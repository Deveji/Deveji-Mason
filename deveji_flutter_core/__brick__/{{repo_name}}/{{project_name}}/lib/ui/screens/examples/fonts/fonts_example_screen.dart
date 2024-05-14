import 'package:{{project_name}}/utils/extensions/l10n_extension.dart';
import 'package:{{project_name}}/utils/extensions/style_extension.dart';
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
        title: Text(context.l10n.fontsExampleScreenTitle),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
        ),
      ),
    );
  }

  List<Widget> _displaySection(BuildContext context) {
    return [
      Text(
        context.l10n.displayLargeFontExample,
        style: context.textTheme.displayLarge,
        textAlign: TextAlign.center,
      ),
      Text(
        context.l10n.displayMediumFontExample,
        style: context.textTheme.displayMedium,
        textAlign: TextAlign.center,
      ),
      Text(
        context.l10n.displaySmallFontExample,
        style: context.textTheme.displaySmall,
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> _headlineSection(BuildContext context) {
    return [
      Text(
        context.l10n.headlineLargeFontExample,
        style: context.textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
      Text(
        context.l10n.headlineMediumFontExample,
        style: context.textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
      Text(
        context.l10n.headlineSmallFontExample,
        style: context.textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> _titleSection(BuildContext context) {
    return [
      Text(
        context.l10n.titleLargeFontExample,
        style: context.textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      Text(
        context.l10n.titleMediumFontExample,
        style: context.textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      Text(
        context.l10n.titleSmallFontExample,
        style: context.textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> _bodySection(BuildContext context) {
    return [
      Text(
        context.l10n.bodyLargeFontExample,
        style: context.textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
      Text(
        context.l10n.bodyMediumFontExample,
        style: context.textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
      Text(
        context.l10n.bodySmallFontExample,
        style: context.textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> _labelSection(BuildContext context) {
    return [
      Text(
        context.l10n.labelLargeFontExample,
        style: context.textTheme.labelLarge,
        textAlign: TextAlign.center,
      ),
      Text(
        context.l10n.labelMediumFontExample,
        style: context.textTheme.labelMedium,
        textAlign: TextAlign.center,
      ),
      Text(
        context.l10n.labelSmallFontExample,
        style: context.textTheme.labelSmall,
        textAlign: TextAlign.center,
      ),
    ];
  }
}
