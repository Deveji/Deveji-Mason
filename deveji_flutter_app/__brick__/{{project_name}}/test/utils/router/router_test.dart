import 'package:{{project_name}}/ui/screens/examples/fonts/fonts_example_screen.dart';
import 'package:{{project_name}}/ui/screens/examples/theme/theme_example_screen.dart';
import 'package:{{project_name}}/ui/screens/home/home_screen.dart';
import 'package:{{project_name}}/utils/errors/navigation_error.dart';
import 'package:{{project_name}}/utils/logs/logger.dart';
import 'package:{{project_name}}/utils/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Tests for the {{client_name.pascalCase()}}Router class
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Logger.init(logToConsole: false, logToFile: false);
  routerTest();
  incorrectRouteTest();
}

/// Tests for the correct routes
void routerTest() {
  test('Should navigate to ThemeExampleScreen when routePath is given', () {
    const settings = RouteSettings(name: ThemeExampleScreenRouting.routePath);
    final route = {{client_name.pascalCase()}}Router.generateRoute(settings);

    expect(route.settings.name, ThemeExampleScreenRouting.routePath);
  });

  test('Should navigate to FontsExampleScreen when routePath is given', () {
    const settings = RouteSettings(name: FontsExampleScreenRouting.routePath);
    final route = {{client_name.pascalCase()}}Router.generateRoute(settings);

    expect(route.settings.name, FontsExampleScreenRouting.routePath);
  });

  test('Should navigate to HomeScreen when routePath is given', () {
    const settings = RouteSettings(name: HomeScreenRouting.routePath);
    final route = {{client_name.pascalCase()}}Router.generateRoute(settings);

    expect(route.settings.name, HomeScreenRouting.routePath);
  });
}

/// Tests for the incorrect routes
void incorrectRouteTest() {
  test('Should throw NavigationError when routePath is not given', () {
    const settings = RouteSettings(name: 'incorrectRoute');
    expectLater(
      () => {{client_name.pascalCase()}}Router.generateRoute(settings),
      throwsA(isA<NavigationError>()),
    );
  });
}
