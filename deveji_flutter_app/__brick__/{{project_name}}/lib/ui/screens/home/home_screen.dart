import 'package:{{project_name}}/ui/screens/examples/home/example_home_screen.dart';
import 'package:{{project_name}}/utils/logs/logger.dart';
import 'package:flutter/material.dart';

/// Routing for the HomeScreen
abstract class HomeScreenRouting {
  /// Path for the router
  static const String routePath = '/';

  /// Builder for navigation to screen
  static PageRoute<T> buildRoute<T>({
    RouteSettings? settings,
  }) {
    Logger.log(HomeScreen);
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const HomeScreen(),
      settings: settings,
    ) as PageRoute<T>;
  }
}

/// Home Screen for the {{client_name}} app
class HomeScreen extends StatelessWidget {
  /// Creates the HomeScreen
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExampleHomeScreen();
  }
}
