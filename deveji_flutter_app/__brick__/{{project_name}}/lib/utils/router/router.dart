import 'package:{{project_name}}/ui/screens/examples/fonts/fonts_example_screen.dart';
import 'package:{{project_name}}/ui/screens/examples/theme/theme_example_screen.dart';
import 'package:{{project_name}}/ui/screens/home/home_screen.dart';
import 'package:{{project_name}}/utils/errors/navigation_error.dart';
import 'package:flutter/material.dart';

/// Router for navigation in the app
class {{client_name.pascalCase()}}Router {
  /// Generates the routes for the navigation
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ThemeExampleScreenRouting.routePath:
        return ThemeExampleScreenRouting.buildRoute(settings: settings);
      case FontsExampleScreenRouting.routePath:
        return FontsExampleScreenRouting.buildRoute(settings: settings);
      case HomeScreenRouting.routePath:
        return HomeScreenRouting.buildRoute(settings: settings);
      default:
        throw NavigationError(settings.name ?? 'null');
    }
  }
}
