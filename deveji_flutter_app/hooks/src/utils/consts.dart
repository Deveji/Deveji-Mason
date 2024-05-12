/// Parameters used during the project creation process.
abstract class ProjectParameters {
  /// The name of the client.
  static const String clientName = 'client_name';

  /// The project description.
  static const String projectDescription = 'project_description';

  /// The Android app id.
  static const String appIdAndroid = 'app_id_android';

  /// The iOS app id.
  static const String bundleIdIos = 'app_id_ios';

  /// The project name.
  static const String projectName = 'project_name';
}

/// Parameters used during the creation process inputted by the user.
abstract class UserParameters {
  /// The name of the client.
  static const String clientName = 'user_client_name';

  /// The default client name.
  static const String defaultClientName = '';

  /// The description of the project.
  static const String projectDescription = 'user_project_description';

  /// The app id for Android.
  static const String androidId = 'user_android_app_id';

  /// The default app id for Android.
  static const String defaultAndroidId = '';

  /// The bundle id for iOS.
  static const String iosId = 'user_ios_bundle_id';

  /// The default bundle id for iOS.
  static const String defaultIosId = '';
}

const String logFileName = 'project-creation-debug.log';
