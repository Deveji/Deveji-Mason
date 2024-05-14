import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281428546),
      surfaceTint: Color(4281428546),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289982910),
      onPrimaryContainer: Color(4278198540),
      secondary: Color(4283458386),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292077779),
      onSecondaryContainer: Color(4279115538),
      tertiary: Color(4282017134),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290636533),
      onTertiaryContainer: Color(4278198053),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294376435),
      onBackground: Color(4279770392),
      surface: Color(4294376435),
      onSurface: Color(4279770392),
      surfaceVariant: Color(4292732378),
      onSurfaceVariant: Color(4282468673),
      outline: Color(4285626737),
      outlineVariant: Color(4290890175),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152045),
      inverseOnSurface: Color(4293849834),
      inversePrimary: Color(4288205988),
      primaryFixed: Color(4289982910),
      onPrimaryFixed: Color(4278198540),
      primaryFixedDim: Color(4288205988),
      onPrimaryFixedVariant: Color(4279652652),
      secondaryFixed: Color(4292077779),
      onSecondaryFixed: Color(4279115538),
      secondaryFixedDim: Color(4290235575),
      onSecondaryFixedVariant: Color(4281944891),
      tertiaryFixed: Color(4290636533),
      onTertiaryFixed: Color(4278198053),
      tertiaryFixedDim: Color(4288859865),
      onTertiaryFixedVariant: Color(4280307030),
      surfaceDim: Color(4292336596),
      surfaceBright: Color(4294376435),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981677),
      surfaceContainer: Color(4293652455),
      surfaceContainerHigh: Color(4293257954),
      surfaceContainerHighest: Color(4292863196),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4279323944),
      surfaceTint: Color(4281428546),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282941526),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281681720),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284905832),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279978322),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283464581),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294376435),
      onBackground: Color(4279770392),
      surface: Color(4294376435),
      onSurface: Color(4279770392),
      surfaceVariant: Color(4292732378),
      onSurfaceVariant: Color(4282205501),
      outline: Color(4284047705),
      outlineVariant: Color(4285889908),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152045),
      inverseOnSurface: Color(4293849834),
      inversePrimary: Color(4288205988),
      primaryFixed: Color(4282941526),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281231167),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284905832),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283261264),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283464581),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281819756),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336596),
      surfaceBright: Color(4294376435),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981677),
      surfaceContainer: Color(4293652455),
      surfaceContainerHigh: Color(4293257954),
      surfaceContainerHighest: Color(4292863196),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278200592),
      surfaceTint: Color(4281428546),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4279323944),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279510552),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281681720),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199853),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279978322),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294376435),
      onBackground: Color(4279770392),
      surface: Color(4294376435),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292732378),
      onSurfaceVariant: Color(4280165919),
      outline: Color(4282205501),
      outlineVariant: Color(4282205501),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152045),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4290640839),
      primaryFixed: Color(4279323944),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203671),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281681720),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280234274),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4279978322),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202938),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336596),
      surfaceBright: Color(4294376435),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981677),
      surfaceContainer: Color(4293652455),
      surfaceContainerHigh: Color(4293257954),
      surfaceContainerHighest: Color(4292863196),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4288205988),
      surfaceTint: Color(4288205988),
      onPrimary: Color(4278204697),
      primaryContainer: Color(4279652652),
      onPrimaryContainer: Color(4289982910),
      secondary: Color(4290235575),
      onSecondary: Color(4280497190),
      secondaryContainer: Color(4281944891),
      onSecondaryContainer: Color(4292077779),
      tertiary: Color(4288859865),
      onTertiary: Color(4278269503),
      tertiaryContainer: Color(4280307030),
      onTertiaryContainer: Color(4290636533),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279244048),
      onBackground: Color(4292863196),
      surface: Color(4279244048),
      onSurface: Color(4292863196),
      surfaceVariant: Color(4282468673),
      onSurfaceVariant: Color(4290890175),
      outline: Color(4287337354),
      outlineVariant: Color(4282468673),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292863196),
      inverseOnSurface: Color(4281152045),
      inversePrimary: Color(4281428546),
      primaryFixed: Color(4289982910),
      onPrimaryFixed: Color(4278198540),
      primaryFixedDim: Color(4288205988),
      onPrimaryFixedVariant: Color(4279652652),
      secondaryFixed: Color(4292077779),
      onSecondaryFixed: Color(4279115538),
      secondaryFixedDim: Color(4290235575),
      onSecondaryFixedVariant: Color(4281944891),
      tertiaryFixed: Color(4290636533),
      onTertiaryFixed: Color(4278198053),
      tertiaryFixedDim: Color(4288859865),
      onTertiaryFixedVariant: Color(4280307030),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281678389),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280691494),
      surfaceContainerHighest: Color(4281415217),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4288469416),
      surfaceTint: Color(4288205988),
      onPrimary: Color(4278197001),
      primaryContainer: Color(4284783985),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290498747),
      onSecondary: Color(4278721037),
      secondaryContainer: Color(4286748291),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289123037),
      onTertiary: Color(4278196511),
      tertiaryContainer: Color(4285372578),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279244048),
      onBackground: Color(4292863196),
      surface: Color(4279244048),
      onSurface: Color(4294507764),
      surfaceVariant: Color(4282468673),
      onSurfaceVariant: Color(4291153347),
      outline: Color(4288521628),
      outlineVariant: Color(4286416252),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292863196),
      inverseOnSurface: Color(4280691494),
      inversePrimary: Color(4279783981),
      primaryFixed: Color(4289982910),
      onPrimaryFixed: Color(4278195462),
      primaryFixedDim: Color(4288205988),
      onPrimaryFixedVariant: Color(4278206237),
      secondaryFixed: Color(4292077779),
      onSecondaryFixed: Color(4278457608),
      secondaryFixedDim: Color(4290235575),
      onSecondaryFixedVariant: Color(4280826411),
      tertiaryFixed: Color(4290636533),
      onTertiaryFixed: Color(4278195224),
      tertiaryFixedDim: Color(4288859865),
      onTertiaryFixedVariant: Color(4278860869),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281678389),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280691494),
      surfaceContainerHighest: Color(4281415217),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4293918702),
      surfaceTint: Color(4288205988),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288469416),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293918702),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290498747),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294180095),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289123037),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279244048),
      onBackground: Color(4292863196),
      surface: Color(4279244048),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282468673),
      onSurfaceVariant: Color(4294311410),
      outline: Color(4291153347),
      outlineVariant: Color(4291153347),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292863196),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278202901),
      primaryFixed: Color(4290311618),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288469416),
      onPrimaryFixedVariant: Color(4278197001),
      secondaryFixed: Color(4292341207),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290498747),
      onSecondaryFixedVariant: Color(4278721037),
      tertiaryFixed: Color(4290965241),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289123037),
      onTertiaryFixedVariant: Color(4278196511),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281678389),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280691494),
      surfaceContainerHighest: Color(4281415217),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
