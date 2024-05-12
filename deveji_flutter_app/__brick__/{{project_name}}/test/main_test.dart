import 'package:{{project_name}}/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should initialize app and call runApp',
      (WidgetTester tester) async {
    await app.main();
    expect(find.byType(app.{{client_name.pascalCase()}}App), findsOneWidget);
  });
}
