import 'package:{{project_name}}/utils/style/app_theme.dart';
import 'package:{{project_name}}/utils/style/color_schemes.g.dart';
import 'package:{{project_name}}/utils/style/typography.dart';
import 'package:flutter_test/flutter_test.dart';

/// Tests for the app theme and its color schemes
void main() {
  test('Should use light color scheme when light theme', () {
    expect(lightAppTheme.colorScheme, lightColorScheme);
    expect(
      lightAppTheme.textTheme.headlineSmall!.fontFamily,
      appTextTheme.headlineSmall!.fontFamily,
    );
  });

  test('Should use dark color scheme when dark theme', () {
    expect(darkAppTheme.colorScheme, darkColorScheme);
    expect(
      darkAppTheme.textTheme.headlineSmall!.fontFamily,
      appTextTheme.headlineSmall!.fontFamily,
    );
  });
}
