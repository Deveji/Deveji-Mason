import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Shared preferences service for the app
final SharedPrefs sharedPrefs = SharedPrefs();

/// Initializes the shared preferences service
class SharedPrefs {
  static SharedPreferences? _sharedPreferences;

  /// Initializes the shared preferences service
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  /// Returns the shared preferences instance
  SharedPreferences get prefs =>
      _sharedPreferences ??
      (throw AssertionError('Shared preferences not initialized'));

  /// Replaces the shared preferences instance with a test instance
  @visibleForTesting
  static set sharedPreferences(SharedPreferences? value) {
    _sharedPreferences = value;
  }

  /// Returns the shared preferences instance
  @visibleForTesting
  static SharedPreferences? get sharedPreferences => _sharedPreferences;
}
