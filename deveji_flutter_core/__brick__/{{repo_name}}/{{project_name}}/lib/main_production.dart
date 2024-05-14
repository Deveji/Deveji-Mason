import 'package:{{project_name}}/app.dart';
import 'package:{{project_name}}/utils/types/flavor_types.dart';
import 'package:flutter/material.dart';{{#use_firebase}}
import 'package:local_firebase_production/firebase_options.dart' as prod;{{/use_firebase}}

/// The main entry point for the application in production flavour
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await {{client_name.pascalCase()}}App.initialize(
    {{#use_firebase}}prod.DefaultFirebaseOptions.currentPlatform,{{/use_firebase}}
  );
  runApp(
    {{client_name.pascalCase()}}App(
      flavor: Flavor.prod,
    ),
  );
}
