import 'package:{{project_name}}/ui/screens/examples/fonts/fonts_example_screen.dart';
import 'package:{{project_name}}/ui/screens/examples/theme/theme_example_screen.dart';
import 'package:{{project_name}}/core/services/shared_prefs_service.dart';
import 'package:{{project_name}}/ui/screens/home/home_screen.dart';
import 'package:{{project_name}}/utils/errors/navigation_error.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name}}/ui/screens/onboarding/onboarding_screen.dart';
import 'package:{{project_name}}/utils/consts.dart';

/// Router for navigation in the app
class {{client_name.pascalCase()}}Router {
  /// The initial route for the app
  static String get initialRoute =>
      sharedPrefs.prefs.getBool(SharedPrefsConsts.showOnboarding) ?? true
          ? OnboardingScreenRouting.routePath
          : HomeScreenRouting.routePath;

  /// Generates the routes for the navigation
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ThemeExampleScreenRouting.routePath:
        return ThemeExampleScreenRouting.buildRoute(settings: settings);
      case FontsExampleScreenRouting.routePath:
        return FontsExampleScreenRouting.buildRoute(settings: settings);
      case HomeScreenRouting.routePath:
        return HomeScreenRouting.buildRoute(settings: settings);
      case OnboardingScreenRouting.routePath:
        return OnboardingScreenRouting.buildRoute(settings: settings);
      default:
        throw NavigationError(settings.name ?? 'null');
    }
  }
}
