import 'package:{{project_name}}/utils/logs/logger.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

const _sectionGap = 30.0;
const _innerSectionGap = 20.0;

/// Routing for the ThemeExampleScreen
abstract class ThemeExampleScreenRouting {
  /// Path for the router
  static const String routePath = '/example/theme-example';

  /// Builder for navigation to screen
  static PageRoute<T> buildRoute<T>({
    RouteSettings? settings,
  }) {
    Logger.log(ThemeExampleScreen);
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const ThemeExampleScreen(),
      settings: settings,
    ) as PageRoute<T>;
  }
}

/// Screen to show the use of themes
class ThemeExampleScreen extends StatelessWidget {
  /// Creates the ThemeExampleScreen
  const ThemeExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Example'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ..._loadingIndicators(context),
                  const Gap(_sectionGap),
                  ..._elevatedButtons(context),
                  const Gap(_sectionGap),
                  ..._textButtons(context),
                  const Gap(_sectionGap),
                  ..._outlineButtons(context),
                  const Gap(_sectionGap),
                  ..._textFields(context),
                  const Gap(_sectionGap),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _loadingIndicators(BuildContext context) {
    return [
      Text(
        'Loading Indicators',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const Gap(_innerSectionGap),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.secondary,
            ),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _elevatedButtons(BuildContext context) {
    return [
      Text(
        'Elevated Buttons',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const Gap(_innerSectionGap),
      Wrap(
        spacing: _innerSectionGap / 2,
        runSpacing: _innerSectionGap / 2,
        alignment: WrapAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            child: const Text('Primary Button'),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              foregroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            child: const Text('Secondary Button'),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              foregroundColor:
                  Theme.of(context).colorScheme.onTertiaryContainer,
            ),
            child: const Text('Tertiary Button'),
          ),
        ],
      ),
    ];
  }

  List<Widget> _textButtons(BuildContext context) {
    return [
      Text(
        'Text Buttons',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const Gap(_innerSectionGap),
      Wrap(
        spacing: _innerSectionGap / 2,
        runSpacing: _innerSectionGap / 2,
        alignment: WrapAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const Text('Primary Button'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text('Secondary Button'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.tertiary,
            ),
            child: const Text('Tertiary Button'),
          ),
        ],
      ),
    ];
  }

  List<Widget> _outlineButtons(BuildContext context) {
    return [
      Text(
        'Outline Buttons',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const Gap(_innerSectionGap),
      Wrap(
        spacing: _innerSectionGap / 2,
        runSpacing: _innerSectionGap / 2,
        alignment: WrapAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
              foregroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const Text('Primary Button'),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
              foregroundColor: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text('Secondary Button'),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              foregroundColor: Theme.of(context).colorScheme.tertiary,
            ),
            child: const Text('Tertiary Button'),
          ),
        ],
      ),
    ];
  }

  List<Widget> _textFields(BuildContext context) {
    return [
      Text(
        'Text Fields',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const Gap(_innerSectionGap),
      Wrap(
        spacing: _innerSectionGap / 2,
        runSpacing: _innerSectionGap / 2,
        alignment: WrapAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Primary Text Field',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Secondary Text Field',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Tertiary Text Field',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }
}
