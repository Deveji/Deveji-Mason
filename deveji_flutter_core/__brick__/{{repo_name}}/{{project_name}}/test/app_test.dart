import 'package:{{project_name}}/app.dart';
import 'package:{{project_name}}/core/services/shared_prefs_service.dart';
import 'package:{{project_name}}/utils/logs/logger.dart';
import 'package:{{project_name}}/utils/router/router.dart';
import 'package:{{project_name}}/utils/style/theme.dart';
import 'package:{{project_name}}/utils/style/typography.dart';
import 'package:{{project_name}}/utils/types/flavor_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPrefs extends Mock implements SharedPreferences {}

/// The tests for the {{client_name.pascalCase()}} widget.
void main() {
  setUp(() async {
    SharedPrefs.sharedPreferences = MockSharedPrefs();
  });

  testWidgets('Should create {{client_name.pascalCase()}} with correct properties',
      (WidgetTester tester) async {
    Logger.init(logToConsole: false, logToFile: false);
    await tester.pumpWidget({{client_name.pascalCase()}}App(flavor: Flavor.prod));

    final appWidget = tester.widget(find.byType(MaterialApp)) as MaterialApp;
    expect(appWidget.theme, const MaterialTheme(appTextTheme).light());
    expect(appWidget.darkTheme, const MaterialTheme(appTextTheme).dark());
    expect(appWidget.initialRoute, {{client_name.pascalCase()}}Router.initialRoute);
    expect(appWidget.onGenerateRoute, {{client_name.pascalCase()}}Router.generateRoute);
    expect({{client_name.pascalCase()}}App.currentFlavor, Flavor.prod);
  });
}
