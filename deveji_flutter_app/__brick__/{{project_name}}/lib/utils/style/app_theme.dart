import 'package:{{project_name}}/utils/style/color_schemes.g.dart';
import 'package:{{project_name}}/utils/style/typography.dart';
import 'package:flutter/material.dart';

/// Light theme for the app
final lightAppTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: appTextTheme,
);

/// Dark theme for the app
final darkAppTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  textTheme: appTextTheme,
);
