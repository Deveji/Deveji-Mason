import 'package:mason/mason.dart';

import 'src/main.dart';

/// Runs the post-generation hook.
Future<void> run(HookContext context) async => post_gen(context);
