import 'package:{{project_name}}/ui/screens/examples/fonts/fonts_example_screen.dart';
import 'package:{{project_name}}/ui/screens/examples/theme/theme_example_screen.dart';
import 'package:{{project_name}}/utils/extensions/routing_extension.dart';
import 'package:flutter/material.dart';

/// Example Home Screen
class ExampleHomeScreen extends StatelessWidget {
  /// Creates the ExampleHomeScreen
  const ExampleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _fontsExampleButton(context),
            _themeExampleButton(context),
          ],
        ),
      ),
    );
  }

  Widget _fontsExampleButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.push(FontsExampleScreenRouting.routePath);
        },
        child: const Text('Fonts Example'),
      ),
    );
  }

  Widget _themeExampleButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.push(ThemeExampleScreenRouting.routePath);
        },
        child: const Text('Theme Example'),
      ),
    );
  }
}
