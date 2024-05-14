import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:mason/mason.dart';

import 'consts.dart';
import 'tools.dart';

Future<void> firebaseInit(HookContext context) async {
  await _createFirebaseProject(
    context,
    context.vars[ProjectParameters.firebaseDisplayName],
    context.vars[ProjectParameters.firebaseId],
    context.vars[ProjectParameters.appIdAndroid],
    context.vars[ProjectParameters.bundleIdIos],
    context.vars[ProjectParameters.projectName],
  );
  await _createFirebaseProject(
    context,
    context.vars[ProjectParameters.firebaseDisplayName] + ' - STG',
    context.vars[ProjectParameters.firebaseId] + '-stg',
    context.vars[ProjectParameters.appIdAndroid] + '.stg',
    context.vars[ProjectParameters.bundleIdIos] + '.stg',
    context.vars[ProjectParameters.projectName] + ' [STG]',
  );
  await _createFirebaseProject(
    context,
    context.vars[ProjectParameters.firebaseDisplayName] + ' - DEV',
    context.vars[ProjectParameters.firebaseId] + '-dev',
    context.vars[ProjectParameters.appIdAndroid] + '.dev',
    context.vars[ProjectParameters.bundleIdIos] + '.dev',
    context.vars[ProjectParameters.projectName] + ' [DEV]',
  );
  _changeFlutterfireCrashlyticsScript(context);
}

/// Creates a new Firebase project and links it to the correct build targets
Future<void> _createFirebaseProject(
  HookContext context,
  String displayName,
  String firebaseId,
  String appIdAndroid,
  String bundleIdIos,
  String appName,
) async {
  await _createFirebaseResource(
    context,
    displayName,
    firebaseId,
    appIdAndroid,
  );
  await _addFirebaseFlutterApp(
    context,
    firebaseId,
    appIdAndroid,
    bundleIdIos,
    appName,
  );
}

/// Creates a new Google Cloud project, then adds Firebase resources to the new
/// project using the projects:create command
Future<void> _createFirebaseResource(
  HookContext context,
  String displayName,
  String firebaseId,
  String appIdAndroid,
) async {
  final command = 'firebase';
  final args = [
    'projects:create',
    '--display-name',
    displayName,
    firebaseId,
  ];
  await executeCommand(
    command,
    args,
    context,
    'Creating ${getFlavourFromId(appIdAndroid)} Firebase project',
  );

  final progress = context.logger.progress(
      'Waiting for ${getFlavourFromId(appIdAndroid)} Firebase project to be created');
  bool projectExists = false;
  while (!projectExists) {
    final result = await executeCommand(
      command,
      ['projects:list'],
      context,
    );
    if (result.contains(firebaseId) == true) {
      projectExists = true;
    } else {
      await Future.delayed(
          Duration(seconds: 5)); // wait for 5 seconds before checking again
    }
  }
  progress.complete();
}

/// Adds the Android and iOS apps to the Firebase project
Future<void> _addFirebaseFlutterApp(
  HookContext context,
  String firebaseId,
  String appIdAndroid,
  String bundleIdIos,
  String appName,
) async {
  await _activateFlutterFireCLI(context);
  String flavour = getFlavourFromId(appIdAndroid);
  await _addFirebaseApp(
    context,
    firebaseId,
    appIdAndroid,
    bundleIdIos,
    flavour,
  );
}

/// Activates the FlutterFire CLI
Future<void> _activateFlutterFireCLI(HookContext context) async {
  await executeCommand(
    'dart',
    ['pub', 'global', 'activate', 'flutterfire_cli'],
    context,
    'Activating FlutterFire CLI',
  );
}

/// Adds the Android and iOS apps to the Firebase project
Future<void> _addFirebaseApp(
  HookContext context,
  String firebaseId,
  String appIdAndroid,
  String bundleIdIos,
  String flavour,
) async {
  await _addFirebaseAndroidApp(context, firebaseId, appIdAndroid, flavour);
  await _addFirebaseIosApp(context, firebaseId, bundleIdIos, flavour);
}

/// Adds the Android app to the Firebase project
Future<void> _addFirebaseAndroidApp(
  HookContext context,
  String firebaseId,
  String appIdAndroid,
  String flavour,
) async {
  await executeCommand(
    'flutterfire',
    _getFirebaseAndroidArgs(firebaseId, appIdAndroid, flavour),
    context,
    'Adding Android app to the $flavour Firebase project',
  );
}

/// Returns the arguments for the `flutterfire configure` command for Android
List<String> _getFirebaseAndroidArgs(
  String firebaseId,
  String appIdAndroid,
  String flavour,
) {
  return [
    'configure',
    '--project=$firebaseId',
    '--platforms=android',
    '--yes',
    '--android-package-name=$appIdAndroid',
    '--android-out=android/app/src/$flavour/google-services.json',
    '--out=firebase_$flavour/lib/firebase_options.dart',
    '-f',
  ];
}

/// Adds the iOS app to the Firebase project
Future<void> _addFirebaseIosApp(
  HookContext context,
  String firebaseId,
  String bundleIdIos,
  String flavour,
) async {
  for (var config in ['release', 'debug', 'profile']) {
    await executeCommand(
      'flutterfire',
      _getFirebaseIosArgs(firebaseId, bundleIdIos, flavour, config),
      context,
      'Adding $config build configuration of the iOS app to the $flavour Firebase project',
    );
  }
}

/// Returns the arguments for the `flutterfire configure` command for iOS
List<String> _getFirebaseIosArgs(
  String firebaseId,
  String bundleIdIos,
  String flavour,
  String config,
) {
  return [
    'configure',
    '--project=$firebaseId',
    '--platforms=ios',
    '--yes',
    '--ios-bundle-id=$bundleIdIos',
    '--ios-build-config=${flavour.pascalCase} [$config]',
    '--ios-out=ios/Config/${flavour.pascalCase}/GoogleService-Info.plist',
    '--out=firebase_$flavour/lib/firebase_options.dart',
    '-f',
  ];
}

/// Changes the FlutterFire Crashlytics script to use the correct build flavor
void _changeFlutterfireCrashlyticsScript(HookContext context) async {
  Progress progress =
      context.logger.progress('Updating FlutterFire Crashlytics script');
  var project =
      '${context.vars[ProjectParameters.repoName]}/${context.vars[ProjectParameters.projectName]}';
  var file = File('$project/ios/Runner.xcodeproj/project.pbxproj');
  var lines = await file.readAsLines();

  final hooks_path =
      Platform.script.toFilePath().split('deveji_flutter_core')[0];
  var scriptFile = File(
    path.join(
      hooks_path,
      'deveji_flutter_core',
      'hooks',
      'assets',
      'crashlytics_upload_dsym.sh',
    ),
  );
  var script = await scriptFile.readAsString();
  script = script
      .replaceAll('\\', '\\\\')
      .replaceAll('\n', '\\n')
      .replaceAll('\"', '\\"');

  bool isShellScriptSection = false;
  for (var i = 0; i < lines.length; i++) {
    if (lines[i].contains(
        'flutterfire upload-crashlytics-symbols --upload-symbols-script-path=')) {
      isShellScriptSection = true;
    }
    if (isShellScriptSection && lines[i].trim().startsWith('shellScript')) {
      lines[i] = '\t\t\t' + 'shellScript = "${script}";';
      break;
    }
  }
  if (!isShellScriptSection) {
    throw Exception('Could not find the FlutterFire Crashlytics script');
  }

  await file.writeAsString(lines.join('\n'));
  progress.complete();
}
