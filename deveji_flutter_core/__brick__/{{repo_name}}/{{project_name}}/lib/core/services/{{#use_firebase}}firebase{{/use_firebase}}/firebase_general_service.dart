import 'package:{{project_name}}/utils/logs/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// The Firebase Crashlytics instance.
FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;

/// The Firebase Analytics instance.
FirebaseAnalytics analytics = FirebaseAnalytics.instance;

/// Initializes Firebase.
Future<void> initializeFirebase({
  required FirebaseOptions firebaseOptions,
}) async {
  // FIREBASE
  await Firebase.initializeApp(
    options: firebaseOptions,
  );

  // FIREBASE CRASHLYTICS
  await _firebaseCrashlyticsInit();
}

Future<void> _firebaseCrashlyticsInit() async {
  await crashlytics.setCrashlyticsCollectionEnabled(true);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = (errorDetails) {
    crashlytics.recordFlutterFatalError(errorDetails);
    Logger.log(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter
  // framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    crashlytics.recordError(error, stack, fatal: true);
    Logger.log(error);
    return true;
  };
}
