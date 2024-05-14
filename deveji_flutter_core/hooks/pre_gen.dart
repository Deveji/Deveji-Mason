import 'package:mason/mason.dart';

import 'src/main.dart';

/// Runs the pre-generation hook.
Future<void> run(HookContext context) async => pre_gen(context);
