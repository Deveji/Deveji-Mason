import 'package:{{project_name}}/ui/screens/examples/fonts/fonts_example_screen.dart';
import 'package:{{project_name}}/ui/screens/examples/theme/theme_example_screen.dart';
import 'package:{{project_name}}/utils/extensions/l10n_extension.dart';
import 'package:{{project_name}}/utils/extensions/routing_extension.dart';
{{#use_firebase}}
import 'package:{{project_name}}/utils/tools/toast_messages.dart';
import 'package:{{project_name}}/core/services/firebase/firebase_general_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
{{/use_firebase}}
import 'package:flutter/material.dart';

/// Example Home Screen
class ExampleHomeScreen extends StatelessWidget {
  /// Creates the ExampleHomeScreen
  const ExampleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.homeScreenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _fontsExampleButton(context),
            _themeExampleButton(context),
            {{#use_firebase}}
            _firebaseExampleButtons(context),
            {{/use_firebase}}
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
        child: Text(context.l10n.fontsExampleButton),
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
        child: Text(context.l10n.themeExampleButton),
      ),
    );
  }{{#use_firebase}}

  Widget _firebaseExampleButtons(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(context.l10n.firebaseExamplesTitle),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              notifyUserUsingToast(context.l10n.crashlyticsExampleErrorThrown);
              throw Exception(context.l10n.crashlyticsExampleErrorThrown);
            },
            child: Text(context.l10n.crashlyticsExampleButton),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              notifyUserUsingToast(context.l10n.analyticsExampleEventLogged);
              analytics.logBeginCheckout(
                value: 10,
                currency: 'USD',
                items: [
                  AnalyticsEventItem(
                    itemName: 'Socks',
                    itemId: 'xjw73ndnw',
                    price: 10.0,
                  ),
                ],
                coupon: '10PERCENTOFF',
              );
            },
            child: Text(context.l10n.analyticsExampleButton),
          ),
        ),
      ],
    );
  }
  {{/use_firebase}}
}
