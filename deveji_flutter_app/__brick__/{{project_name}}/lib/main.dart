import 'package:{{project_name}}/ui/screens/home/home_screen.dart';
import 'package:{{project_name}}/utils/extensions/l10n_extension.dart';
import 'package:{{project_name}}/utils/logs/logger.dart';
import 'package:{{project_name}}/utils/router/router.dart';
import 'package:{{project_name}}/utils/style/app_theme.dart';
import 'package:flutter/material.dart';

/// The main entry point for the application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initialize();
  runApp(const {{client_name.pascalCase()}}App());
}

/// The main application widget.
class {{client_name.pascalCase()}}App extends StatelessWidget {
  /// Creates the main application widget.
  const {{client_name.pascalCase()}}App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightAppTheme,
      darkTheme: darkAppTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: HomeScreenRouting.routePath,
      onGenerateRoute: {{client_name.pascalCase()}}Router.generateRoute,
    );
  }
}

Future<void> _initialize() async {
  Logger.init(logToConsole: true, logToFile: true);
  Logger.log({{client_name.pascalCase()}}App);
}
