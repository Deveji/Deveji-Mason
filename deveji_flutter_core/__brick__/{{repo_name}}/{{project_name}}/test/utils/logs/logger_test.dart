import 'dart:io';

import 'package:{{project_name}}/app.dart';
import 'package:{{project_name}}/utils/logs/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Main function to run logger tests
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  loggerLogcatTest();
  loggerFileTest();
  loggerCorrectFormatTest();
}

// Create a class to mock debugPrint
class _MockPrint extends Mock {
  void call(String? message, {int? wrapWidth});
}

/// Tests for the logger logging to logcat
void loggerLogcatTest() {
  group('Logger logging to Logcat', () {
    final mockPrint = _MockPrint();

    setUp(() {
      debugPrint = mockPrint.call;
    });

    tearDown(() {
      debugPrint = debugPrintThrottled;
    });

    test('Should not log to logcat if initialized to false', () {
      Logger.init(logToConsole: false, logToFile: false);
      Logger.log('Test message');
      verifyNever(mockPrint.call(any));
    });

    test('Should log to logcat if initialized to true', () {
      Logger.init(logToConsole: true, logToFile: false);
      Logger.log('Test message');
      verify(mockPrint('Test message')).called(1);
    });

    test('Should log to logcat if initialized with defaults', () {
      Logger.init(logToFile: false);
      Logger.log('Test message');
      verify(mockPrint('Test message')).called(1);
    });
  });
}

class _MockPathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    await Directory.systemTemp.createTemp(kApplicationDocumentsPath);
    return Directory.systemTemp.path;
  }
}

const String kApplicationDocumentsPath = 'applicationDocumentsPath';

/// Tests for the logger logging to file
void loggerFileTest() {
  group('Logger logging to file correctly', () {
    setUp(() async {
      PathProviderPlatform.instance = _MockPathProviderPlatform();
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/dev_log.log');

      if (file.existsSync()) {
        await file.delete();
      }
    });

    tearDown(() async {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/dev_log.log');

      if (file.existsSync()) {
        await file.delete();
      }
    });

    test('Should not log when initialized to false', () async {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/dev_log.log');

      Logger.init(logToConsole: false, logToFile: false);
      Logger.log('Test message 1');

      // Check that the file does not exist
      expect(file.existsSync(), false);
    });

    test('Should create a file dev_log.log when initialized to true', () async {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/dev_log.log');

      Logger.init(logToConsole: false, logToFile: true);
      Logger.log('Test message 2');
      // Wait for the logger to finish writing to the file
      await Future<void>.delayed(const Duration(seconds: 1));

      // Check that the file contains the logged message
      final contents = await file.readAsString();
      expect(contents.contains('Test message'), true);
    });

    test('Should create a file dev_log.log when default initialized', () async {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/dev_log.log');

      Logger.init(logToConsole: false);
      Logger.log('Test message 3');
      // Wait for the logger to finish writing to the file
      await Future<void>.delayed(const Duration(seconds: 1));

      // Check that the file contains the logged message
      final contents = await file.readAsString();
      expect(contents.contains('Test message'), true);
    });
  });
}

/// Tests for the logger logging in the correct format
void loggerCorrectFormatTest() {
  group('Logger logs in the correct format', () {
    test('Should log a string in the correct format', () async {
      // Mock the debugPrint function
      final mockPrint = _MockPrint();
      debugPrint = mockPrint.call;

      Logger.init(logToConsole: true, logToFile: false);
      Logger.log('Test message');
      verify(mockPrint('Test message')).called(1);

      debugPrint = debugPrintThrottled;
    });
    test('Should log an exception in the correct format', () async {
      // Mock the debugPrint function
      final mockPrint = _MockPrint();
      debugPrint = mockPrint.call;

      Logger.init(logToConsole: true, logToFile: false);
      Logger.log(Exception('Test exception'));
      verify(mockPrint('Exception: Test exception')).called(1);

      debugPrint = debugPrintThrottled;
    });
    test('Should log an error in the correct format', () async {
      // Mock the debugPrint function
      final mockPrint = _MockPrint();
      debugPrint = mockPrint.call;

      Logger.init(logToConsole: true, logToFile: false);
      Logger.log(Error());
      verify(mockPrint("Instance of 'Error'")).called(1);
      verify(mockPrint('null')).called(1);

      debugPrint = debugPrintThrottled;
    });
    test('Should log a type in the correct format', () async {
      // Mock the debugPrint function
      final mockPrint = _MockPrint();
      debugPrint = mockPrint.call;

      Logger.init(logToConsole: true, logToFile: false);
      Logger.log({{client_name.pascalCase()}}App);
      verify(mockPrint('<----------{{client_name.pascalCase()}}App---------->')).called(1);

      debugPrint = debugPrintThrottled;
    });
    test('Should log an object in the correct format', () async {
      // Mock the debugPrint function
      final mockPrint = _MockPrint();
      debugPrint = mockPrint.call;

      Logger.init(logToConsole: true, logToFile: false);
      Logger.log(Object());
      verify(mockPrint("Instance of 'Object'")).called(1);

      debugPrint = debugPrintThrottled;
    });
  });
}
