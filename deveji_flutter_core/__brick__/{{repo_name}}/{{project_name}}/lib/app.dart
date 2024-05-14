import 'package:{{project_name}}/core/services/shared_prefs_service.dart';
import 'package:{{project_name}}/ui/screens/home/home_screen.dart';
import 'package:{{project_name}}/utils/extensions/l10n_extension.dart';
import 'package:{{project_name}}/utils/types/flavor_types.dart';
import 'package:{{project_name}}/utils/logs/logger.dart';
import 'package:{{project_name}}/utils/router/router.dart';
import 'package:{{project_name}}/utils/style/theme.dart';
import 'package:{{project_name}}/utils/style/typography.dart';
{{#use_firebase}}
import 'package:{{project_name}}/core/services/firebase/firebase_general_service.dart';
import 'package:firebase_core/firebase_core.dart';
{{/use_firebase}}
import 'package:flutter/material.dart';

/// Global key for localization
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// The main application widget.
class {{client_name.pascalCase()}}App extends StatelessWidget {
  /// Creates the main application widget.
  {{client_name.pascalCase()}}App({required Flavor flavor, super.key}) {
    currentFlavor = flavor;
  }

  /// Current flavor of the app
  static late final Flavor currentFlavor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: const MaterialTheme(appTextTheme).light(),
      darkTheme: const MaterialTheme(appTextTheme).dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: {{client_name.pascalCase()}}Router.initialRoute,
      onGenerateRoute: {{client_name.pascalCase()}}Router.generateRoute,
    );
  }
  /// Initializes the application.
  static Future<void> initialize({{#use_firebase}}FirebaseOptions firebaseOptions{{/use_firebase}}) async {
    Logger.init(logToConsole: true, logToFile: true);
    Logger.log({{client_name.pascalCase()}}App);
    await sharedPrefs.init();
    {{#use_firebase}}
    await initializeFirebase(firebaseOptions: firebaseOptions);
    {{/use_firebase}}
  }
}
