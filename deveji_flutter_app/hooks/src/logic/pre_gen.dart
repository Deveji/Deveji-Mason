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
  if (clientName.isEmpty) {
    throw Exception('Client name is invalid');
  }
  final bool isDefaultClientName =
      clientName == UserParameters.defaultClientName;
  context.vars[ProjectParameters.clientName] = clientName;

  context.vars[ProjectParameters.projectDescription] =
      context.vars[UserParameters.projectDescription] as String;

  _generateAppId(context, isDefaultClientName);
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

/// Generates a project name for the app.
void _generateProjectName(HookContext context) {
  final clientName = context.vars[ProjectParameters.clientName] as String;
  context.vars[ProjectParameters.projectName] = '${clientName.snakeCase}_app';
}

/// Checks the user input.
void _checkPreGenHook(HookContext context) {
  final clientName = context.vars[ProjectParameters.clientName] as String;
  final projectDescription =
      context.vars[ProjectParameters.projectDescription] as String;
  final appIdAndroid = context.vars[ProjectParameters.appIdAndroid] as String;
  final bundleIdIos = context.vars[ProjectParameters.bundleIdIos] as String;
  final projectName = context.vars[ProjectParameters.projectName] as String;

  print('''\n
  *** Pre-Generation Hook ***
  Creating a new project with the following parameters:
  Client Name: ${clientName.titleCase}
  Project Description: $projectDescription
  Android App ID: $appIdAndroid
  iOS Bundle ID: $bundleIdIos
  Project Name: $projectName
  ''');
}
