import 'package:mason/mason.dart';

import '../utils/consts.dart';

/// Runs the pre-generation hook.
Future<void> pre_gen_hook(HookContext context) async {
  _evaluateUserInput(context);
  _generateProjectName(context);
  _checkPreGenHook(context);
}

/// Evaluates the user input.
void _evaluateUserInput(HookContext context) {
  final clientName = context.vars[UserParameters.clientName] as String;
  if (clientName.isEmpty || clientName.length > 30 || clientName.length < 3) {
    throw Exception('Client name is invalid');
  }
  final bool isDefaultClientName =
      clientName == UserParameters.defaultClientName;
  context.vars[ProjectParameters.clientName] = clientName;

  context.vars[ProjectParameters.projectDescription] =
      context.vars[UserParameters.projectDescription] as String;

  _generateAppId(context, isDefaultClientName);
  _generateFirebaseConfig(context);
}

/// Generates an app id for Android and iOS.
void _generateAppId(HookContext context, bool isDefaultClientName) {
  final bool isDefaultAndroidId =
      context.vars[UserParameters.androidId] == UserParameters.defaultAndroidId;
  final bool isDefaultIosId =
      context.vars[UserParameters.iosId] == UserParameters.defaultIosId;

  if (!isDefaultClientName && isDefaultAndroidId) {
    context.vars[ProjectParameters.appIdAndroid] =
        'com.deveji.${(context.vars[ProjectParameters.clientName] as String).snakeCase}';
  } else {
    context.vars[ProjectParameters.appIdAndroid] =
        context.vars[UserParameters.androidId];
  }

  if (!isDefaultClientName && isDefaultIosId) {
    context.vars[ProjectParameters.bundleIdIos] =
        'com.deveji.${(context.vars[ProjectParameters.clientName] as String).camelCase}';
  } else {
    context.vars[ProjectParameters.bundleIdIos] =
        context.vars[UserParameters.iosId];
  }
}

/// Generates the Firebase configuration.
void _generateFirebaseConfig(HookContext context) {
  final bool useFirebase = context.vars[UserParameters.useFirebase] as bool;
  context.vars[ProjectParameters.useFirebase] = useFirebase;
  if (useFirebase) {
    final firebaseId = context.vars[UserParameters.firebaseId] as String;
    if (firebaseId.isEmpty && firebaseId.length < 30 && firebaseId.length > 3) {
      throw Exception('Firebase id is invalid');
    }
    final clientName = context.vars[ProjectParameters.clientName] as String;
    final now = DateTime.now();
    final month = now.month.toString().padLeft(2, '0');
    final year = now.year.toString();
    context.vars[ProjectParameters.firebaseId] =
        firebaseId == UserParameters.defaultFirebaseId
            ? '${clientName.paramCase}-$month-$year'
            : context.vars[UserParameters.firebaseId];
    context.vars[ProjectParameters.firebaseDisplayName] =
        '${clientName.titleCase}';
  }
}

/// Generates a project name for the app.
void _generateProjectName(HookContext context) {
  final clientName = context.vars[ProjectParameters.clientName] as String;
  context.vars[ProjectParameters.projectName] = '${clientName.snakeCase}_app';
  context.vars[ProjectParameters.repoName] = '${clientName.headerCase}-App';
}

/// Checks the user input.
void _checkPreGenHook(HookContext context) {
  final clientName = context.vars[ProjectParameters.clientName] as String;
  final projectDescription =
      context.vars[ProjectParameters.projectDescription] as String;
  final appIdAndroid = context.vars[ProjectParameters.appIdAndroid] as String;
  final bundleIdIos = context.vars[ProjectParameters.bundleIdIos] as String;
  final projectName = context.vars[ProjectParameters.projectName] as String;
  final repoName = context.vars[ProjectParameters.repoName] as String;
  final useFirebase = context.vars[ProjectParameters.useFirebase] as bool;
  final firebaseId = context.vars[ProjectParameters.firebaseId] as String?;
  final firebaseDisplayName =
      context.vars[ProjectParameters.firebaseDisplayName] as String?;

  print('''

  *** Pre-Generation Hook ***
  Creating a new project with the following parameters:
  Client Name: ${clientName.titleCase}
  Project Description: $projectDescription
  Android App ID: $appIdAndroid
  iOS Bundle ID: $bundleIdIos
  Repository Name: $repoName
  Project Name: $projectName
  ''');

  if (useFirebase) {
    print('''
  Firebase ID: $firebaseId
  Firebase Display Name: $firebaseDisplayName
    ''');
  }
}
