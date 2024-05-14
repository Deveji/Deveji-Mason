import 'package:mason/mason.dart';

import '../utils/consts.dart';
import '../utils/firebase_init.dart';
import '../utils/tools.dart';

Future<void> post_gen_hook(HookContext context) async {
  if (context.vars[ProjectParameters.useFirebase] as bool) {
    await firebaseInit(context);
  }
  await buildProject(context);
  await generateAppIcons(context);
  await cleanProject(context);
  print('DONE - project generated successfully! 🚀');
}

/// Runs the project build commands
Future<void> buildProject(HookContext context) async {
  await executeCommand(
    'flutter',
    ['pub', 'get'],
    context,
    'Getting dependencies',
  );
}

/// Cleans the project after generation
Future<void> cleanProject(context) async {
  await executeCommand(
    'dart',
    ['fix', '--apply'],
    context,
    'Cleaning up project',
  );
  await executeCommand(
    'dart',
    ['pub', 'remove', 'flutter_gen'],
    context,
    'Removing flutter_gen',
  );
  await buildProject(context);
  await executeCommand(
    'rm',
    ['-f', logFileName],
    context,
    'Removing log file',
  );
}

/// Generates app icons
Future<void> generateAppIcons(HookContext context) async {
  await executeCommand(
    'dart',
    ['run', 'flutter_launcher_icons', '-f', 'flutter_launcher_icons*'],
    context,
    'Generating app icons',
  );
}
