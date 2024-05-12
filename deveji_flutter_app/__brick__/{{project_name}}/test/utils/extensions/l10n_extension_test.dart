import 'package:{{project_name}}/utils/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should support AppLocalizationsX extension on BuildContext',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (BuildContext context) {
            final localizations = context.l10n;
            expect(localizations, isInstanceOf<AppLocalizations>());
            return Container();
          },
        ),
      ),
    );
  });
}
