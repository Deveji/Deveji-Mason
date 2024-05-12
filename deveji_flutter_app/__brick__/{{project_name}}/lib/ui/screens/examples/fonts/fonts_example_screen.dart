import 'package:{{project_name}}/utils/logs/logger.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Routing for the FontsExampleScreen
abstract class FontsExampleScreenRouting {
  /// Path for the router
  static const String routePath = '/example/fonts-example';

  /// Builder for navigation to screen
  static PageRoute<T> buildRoute<T>({
    RouteSettings? settings,
  }) {
    Logger.log(FontsExampleScreen);
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const FontsExampleScreen(),
      settings: settings,
    ) as PageRoute<T>;
  }
}

/// Screen to show the use of fonts
class FontsExampleScreen extends StatelessWidget {
  /// Creates the FontsExampleScreen
  const FontsExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fonts Example'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Gap(40),
              ..._displaySection(context),
              const Gap(20),
              ..._headlineSection(context),
              const Gap(20),
              ..._titleSection(context),
              const Gap(20),
              ..._bodySection(context),
              const Gap(20),
              ..._labelSection(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _displaySection(BuildContext context) {
    return [
      Text(
        'Display Large',
        style: Theme.of(context).textTheme.displayLarge,
        textAlign: TextAlign.center,
      ),
      Text(
        'Display Medium',
        style: Theme.of(context).textTheme.displayMedium,
        textAlign: TextAlign.center,
      ),
      Text(
        'Display Small',
        style: Theme.of(context).textTheme.displaySmall,
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> _headlineSection(BuildContext context) {
    return [
      Text(
        'Headline Large',
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
      Text(
        'Headline Medium',
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
      Text(
        'Headline Small',
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> _titleSection(BuildContext context) {
    return [
      Text(
        'Title Large',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      Text(
        'Title Medium',
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      Text(
        'Title Small',
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> _bodySection(BuildContext context) {
    return [
      Text(
        'Body Large',
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
      Text(
        'Body Medium',
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
      Text(
        'Body Small',
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> _labelSection(BuildContext context) {
    return [
      Text(
        'Label Large',
        style: Theme.of(context).textTheme.labelLarge,
        textAlign: TextAlign.center,
      ),
      Text(
        'Label Medium',
        style: Theme.of(context).textTheme.labelMedium,
        textAlign: TextAlign.center,
      ),
      Text(
        'Label Small',
        style: Theme.of(context).textTheme.labelSmall,
        textAlign: TextAlign.center,
      ),
    ];
  }
}
