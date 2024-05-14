# {{client_name.titleCase()}} App

[![Powered by Mason][mason_badge]][mason_link]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
<!-- TODO: Add license badge -->
<!-- TODO: Add coverage badge -->

{{project_description}}

## Project Overview

This project is designed to run on Android and iOS. It is built using the Flutter framework and 
follows the [Deveji][deveji_link] architecture.

### App Icon

The app icon is located in the `assets/icons/app_icons` folder. 
The icon is a 1024x1024 image that is used to generate the app icons for both Android and iOS.
To change the App Icons replace the following files:
- `assets/icons/app_icons/AppIcon-Development.png` - for the development build flavour
- `assets/icons/app_icons/AppIcon-Staging.png` - for the staging build flavour
- `assets/icons/app_icons/AppIcon-Production.png` - for the production build flavour

To regenerate the app icons run the following command:
```sh
dart run flutter_launcher_icons -f flutter_launcher_icons*
```

### Internationalization Support 🌍

The project supports [flutter_localizations][localization_docs]. The translations are 
located in the l10n folder. Each new supported locale has to be added in a separate file 
named `app_<LOCALE_CODE>.arb`. To generate the localizations run `flutter pub get`.

To add new entries in the .arb files follow the flutter_localizations documentation. A 
simple entry would look like this (in `app_en.arb`):
```
{
  "helloWorld": "Hello World!",
  "@helloWorld": {
    "description": "The conventional newborn programmer greeting"
  }
} 
```

The Spanish translation would be located in `app_es.arb` and would look like this:
```
{
    "helloWorld": "¡Hola Mundo!"
}
```

To use the helloWorld text in the app use:
```dart
import 'package:{{project_name}}/utils/extensions/l10n_extension.dart';

@override
Widget build(BuildContext context) {
  return Text(context.l10n.helloWorld);
}
```

NOTE: On iOS to add a new locale update the `CFBundleLocalizations` array in `ios/Runner/Info.plist`.
```xml
<dict>
  ...
  <key>CFBundleLocalizations</key>
  <array>
      <string>en</string>
      <string>es</string>
  </array>
</dict>
```

### Theming 🎨

The app's theme is defined in `lib\utils\style\theme.dart`. It is configured to support both 
light and dark mode. To change the color scheme generate new `MaterialTheme` from the 
[Material 3 Builder][material_scheme_builder_link].

### Logger 📝

The app uses a custom Logger class to log messages. The logger is configured to log messages
to the console and to a file. The Logger can log all types using the `log` method.
```dart
import 'package:{{project_name}}/utils/logger/logger.dart';

void main() {
 Logger.log('Hello World!'); 
}
```

To configure it to use correct outputs use the `init` method during initialization.
```dart
import 'package:{{project_name}}/utils/logger/logger.dart';

void main() {
  Logger.init(logToConsole: true, logToFile: false);
}
```

### Routing

The app has a built in router that uses the Flutter Navigator to move between the pages. To add routing to a page the developer needs to add a page routing abstract class with a static String field _**routePath**_ and a static method _**PageRoute<T> buildRoute<T>**_.

```dart
/// Routing for the ExampleScreen
abstract class ExampleScreenRouting {
  /// Path for the router
  static const String routePath = '/example/page001';

  /// Builder for navigation to screen
  static PageRoute<T> buildRoute<T>({
    RouteSettings? settings,
  }) {
    Logger.log(ExampleScreen);
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const ExampleScreen(),
      settings: settings,
    ) as PageRoute<T>;
  }
}
```

Once the routing abstract class for the page is implemented, the remaining step is to add
the new route to the _{{client_name.pascalCase()}}Router_. In the _**generateRoute**_ add
a new case:

```dart
switch(settings.name){
  // ...
  case ExampleScreenRouting.routePath:
    return ExampleScreenRouting.buildRoute(settings: settings);
  // ...
}
```

To navigate to the newly added screen the developer should use the provided extension of BuildContext.

```dart
context.push(ExampleScreenRouting.routePath);
```

### Build flavours

This app has 3 build flavours, each having it's own environment.
Each of the flavours could be run in 3 build modes: **Debug, Profile, and Release**.

*NOTE*: Profile and Release modes are not supported on Android emulators and iPhone simulators.

This project has all 9 run configuration configured for Android Studio and VS Code.

#### Development Flavour

The development flavour is used during development and is the most unstable environment.
This environment is used for implementing new and experimental features into the app as
well as any development work that is required on the given project.

The application ID for this flavour is: 
- Android `{{app_id_android}}.dev`
- iOS `{{app_id_ios}}.dev`

The entry point for the app is `main_development.dart`.

#### Staging Flavour

The staging flavour is used to show and test a pre-production version of the app.
This flavour might include experimental features not available in the production environment.
Usually, this environment is more stable than the development version.

The application ID for this flavour is: 
- Android `{{app_id_android}}.stg`
- iOS `{{app_id_ios}}.stg`

The entry point for the app is `main_staging.dart`.

#### Production Flavour

The production flavour is the environment used in the live product. Usually, this is the
most stable version. The developer needs to pay extra attention when releasing any updates
for this environment, having in mind that **all of the user data could be lost if not done properly**.

The application ID for the app is: 
- Android `{{app_id_android}}`
- iOS `{{app_id_ios}}`

The entry point for the app is `main_production.dart`.
{{#use_firebase}}
## Firebase

The project comes with a firebase project for each development flavour.

### Overview

`google-services.json` - android config files located in _android/app/src/flavour/_

`GoogleService-Info.plist` - ios config files located in _ios/Config/flavour/_.
Xcode does not support multiple Firebase flavour at once so there is a 
**Copy GoogleService-Info.plist** script run during the build procedure that copies the
correct flavour into the build directory.

`firebase.json` - project configuration containing all development flavours (and build 
modes for iOS) with the corresponding firebase project

`firebase_flavour` folders - folders containing all data related to the given firebase environment.
This is the place where the developer should keep all firebase files i.e. cloud functions, 
storage rules, firestore rules etc. There is a __lib/firebase_options.dart__ file that 
contains the configuration accessible for the Flutter app.

### Project Flavours

A development project **"{{firebase_display_name}} [DEV]"** (project id: _{{firebase_id}}-dev_).
This project is linked to the development flavour of the Android and iOS apps.
All of the files related to the this project are located in the `firebase_development` folder.

A staging project **"{{firebase_display_name}} [STG]"** (project id: _{{firebase_id}}-stg_).
This project is linked to the staging flavour of the Android and iOS apps.
All of the files related to the this project are located in the `firebase_staging` folder.

A production project **"{{firebase_display_name}}"** (project id: _{{firebase_id}}_).
This project is linked to the production flavour of the Android and iOS apps.
All of the files related to this project are located in the `firebase_production` folder.

### Crashlytics

The app has built-in support for Crashlytics. When an exception is thrown, it is logged to 
Firebase and visible in the Crashlytics dashboard.

For iOS, uploading dSYM files is necessary for the logs to work. In Xcode Runner Build Phases 
there is a script "Fireflutter: flutterfire upload-crashlytics-symbols" which automatically 
uploads the dSYM during project build.

### Analytics

The app has built-in support for Analytics. To enable them in Firebase, the developer needs 
to connect a Google Analytics account. The developer will be asked for that during the first use of 
the Analytics dashboard.

### Command cheatsheet

Before using the [flutterfire][flutterfire_cli_docs] command, the developer needs to globally enable it:
```bash
dart pub global activate flutterfire_cli
```

#### Initialization commands

All of the commands need to be executed in the main directory of the Flutter project. 
Provided examples are for the Production environment (ios - Production [release]).

Initializes the Android app in the firebase.
```bash
flutterfire configure --project={{firebase_id}} --platforms=android --android-package-name={{app_id_android}} --android-out=android/app/src/production/google-services.json --out=firebase_production/lib/firebase_options.dart --yes -f
```

Initializes the iOS app in the firebase (this needs to be done for each build mode 
i.e. Debug, Profile and Release).
```bash
flutterfire configure --project={{firebase_id}} --platforms=ios --ios-bundle-id={{app_id_ios}} --ios-build-config="Production [release]" --ios-out=ios/Config/Production/GoogleService-Info.plist --out=firebase_production/lib/firebase_options.dart --yes -f
```
{{/use_firebase}}
## Flutter Command Cheatsheet

To run the clean command that automatically rebuilds all code generation tools use
```bash
flutter clean && dart run build_runner build -d && flutter pub get
```

## Building releases

To build a release for the AppStore use the command:
```bash
flutter build ipa --release --flavor Production
```

To build a release for the Google Play Store use the command
```bash
flutter build appbundle --release --flavor production
```

<!-- References -->

[deveji_link]: https://www.deveji.com
[mason_badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[localization_docs]: https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
[material_scheme_builder_link]: https://m3.material.io/theme-builder
[flutterfire_cli_docs]: https://firebase.google.com/docs/flutter/setup