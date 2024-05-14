import 'package:mason/mason.dart';

import 'logic/post_gen.dart';
import 'logic/pre_gen.dart';

/// Runs the pre-generation hook.
Future<void> pre_gen(HookContext context) async => pre_gen_hook(context);

/// Runs the post-generation hook.
Future<void> post_gen(HookContext context) async => post_gen_hook(context);
