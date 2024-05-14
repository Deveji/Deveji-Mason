import 'package:{{project_name}}/utils/extensions/l10n_extension.dart';
import 'package:{{project_name}}/utils/extensions/style_extension.dart';
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
        title: Text(context.l10n.themeExampleScreenTitle),
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
        context.l10n.loadingIndicatorsSectionTitle,
        style: context.textTheme.titleMedium,
      ),
      const Gap(_innerSectionGap),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              context.colorScheme.primary,
            ),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              context.colorScheme.secondary,
            ),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              context.colorScheme.tertiary,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _elevatedButtons(BuildContext context) {
    return [
      Text(
        context.l10n.elevatedButtonsSectionTitle,
        style: context.textTheme.titleMedium,
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
              backgroundColor: context.colorScheme.primaryContainer,
              foregroundColor: context.colorScheme.onPrimaryContainer,
            ),
            child: Text(context.l10n.primaryButtonText),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.secondaryContainer,
              foregroundColor: context.colorScheme.onSecondaryContainer,
            ),
            child: Text(context.l10n.secondaryButtonText),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.tertiaryContainer,
              foregroundColor: context.colorScheme.onTertiaryContainer,
            ),
            child: Text(context.l10n.tertiaryButtonText),
          ),
        ],
      ),
    ];
  }

  List<Widget> _textButtons(BuildContext context) {
    return [
      Text(
        context.l10n.textButtonsSectionTitle,
        style: context.textTheme.titleMedium,
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
              foregroundColor: context.colorScheme.primary,
            ),
            child: Text(context.l10n.primaryButtonText),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: context.colorScheme.secondary,
            ),
            child: Text(context.l10n.secondaryButtonText),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: context.colorScheme.tertiary,
            ),
            child: Text(context.l10n.tertiaryButtonText),
          ),
        ],
      ),
    ];
  }

  List<Widget> _outlineButtons(BuildContext context) {
    return [
      Text(
        context.l10n.outlinedButtonsSectionTitle,
        style: context.textTheme.titleMedium,
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
                color: context.colorScheme.primary,
              ),
              foregroundColor: context.colorScheme.primary,
            ),
            child: Text(context.l10n.primaryButtonText),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: context.colorScheme.secondary,
              ),
              foregroundColor: context.colorScheme.secondary,
            ),
            child: Text(context.l10n.secondaryButtonText),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: context.colorScheme.tertiary,
              ),
              foregroundColor: context.colorScheme.tertiary,
            ),
            child: Text(context.l10n.tertiaryButtonText),
          ),
        ],
      ),
    ];
  }

  List<Widget> _textFields(BuildContext context) {
    return [
      Text(
        context.l10n.textFieldsSectionTitle,
        style: context.textTheme.titleMedium,
      ),
      const Gap(_innerSectionGap),
      Wrap(
        spacing: _innerSectionGap / 2,
        runSpacing: _innerSectionGap / 2,
        alignment: WrapAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: context.l10n.primaryTextFieldLabel,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: context.l10n.secondaryTextFieldLabel,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.secondary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.secondary,
                ),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: context.l10n.tertiaryTextFieldLabel,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.tertiary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.tertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }
}
