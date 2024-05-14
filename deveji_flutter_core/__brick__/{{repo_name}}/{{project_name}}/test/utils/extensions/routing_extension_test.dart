import 'package:{{project_name}}/utils/extensions/routing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Test for the Routing extension methods.
void main() {
  pushExtensionTest();
  popExtensionTest();
  pushReplacementExtensionTest();
}

/// Tests for the push extension method.
void pushExtensionTest() {
  testWidgets('Should push page without arguments',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => Container(key: const Key('home')),
          '/second': (context) => Container(key: const Key('second')),
        },
      ),
    );

    tester.element(find.byType(Container)).push('/second');
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('second')), findsOneWidget);
  });

  testWidgets('Should push page with arguments', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => Container(key: const Key('home')),
          '/second': (context) => Container(
                key: const Key('second'),
                child:
                    Text(ModalRoute.of(context)!.settings.arguments! as String),
              ),
        },
      ),
    );

    tester.element(find.byType(Container)).push('/second', arguments: 'test');
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('second')), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });
}

/// Tests for the pop extension method.
void popExtensionTest() {
  testWidgets('Should pop page', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => context.push('/second'),
            child: const Text('Go to second'),
          ),
        ),
        routes: {
          '/second': (context) => Container(key: const Key('second')),
        },
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    tester.element(find.byType(Container)).pop();
    await tester.pumpAndSettle();

    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}

/// Tests for the pushReplacement extension method.
void pushReplacementExtensionTest() {
  testWidgets('Should push replacement page without arguments',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => context.pushReplacement('/second'),
            child: const Text('Go to second'),
          ),
        ),
        routes: {
          '/second': (context) => Container(key: const Key('second')),
        },
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('second')), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNothing);
  });

  testWidgets('Should push replacement page with arguments',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () =>
                context.pushReplacement('/second', arguments: 'test'),
            child: const Text('Go to second'),
          ),
        ),
        routes: {
          '/second': (context) =>
              Text(ModalRoute.of(context)!.settings.arguments! as String),
        },
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('test'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNothing);
  });
}
