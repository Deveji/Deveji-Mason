import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/utils/extensions/style_extension.dart';

void main() {
  testWidgets('Should return the correct TextTheme via the extension',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(displayLarge: TextStyle(color: Colors.red)),
      ),
      home: Builder(
        builder: (context) {
          expect(context.textTheme.displayLarge!.color, Colors.red);
          return const Placeholder();
        },
      ),
    ));
  });

  testWidgets('Should return the correct ColorScheme via the extension',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.blue),
      ),
      home: Builder(
        builder: (context) {
          expect(context.colorScheme.primary, Colors.blue);
          return const Placeholder();
        },
      ),
    ));
  });
}
