import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

/// Logger to help with debugging
class Logger {
  static bool _logToConsole = true;
  static bool _logToFile = true;
  static final _formatter = DateFormat('dd.MM.yyyy HH:mm:ss:SSS');
  static final _logQueue = Queue<String>();

  /// Initializes the logger with the chosen outputs
  static void init({bool? logToConsole, bool? logToFile}) {
    _logToConsole = logToConsole ?? _logToConsole;
    _logToFile = logToFile ?? _logToFile;
  }

  /// Logs an object to the chosen outputs
  static void log(dynamic message) {
    if (message is String) {
      _logQueue.add(message);
    } else if (message is Exception) {
      _logQueue.add(message.toString());
    } else if (message is Error) {
      _logQueue
        ..add(Error.safeToString(message))
        ..add(message.stackTrace.toString());
    } else if (message is Type) {
      _logQueue.add('<----------$message---------->');
    } else {
      _logQueue.add(message.toString());
    }
    _processQueue();
  }

  static Future<void> _processQueue() async {
    while (_logQueue.isNotEmpty) {
      final message = _logQueue.removeFirst();
      if (_logToConsole) {
        debugPrint(message);
      }
      if (_logToFile) {
        await _writeToFile(message);
      }
    }
  }

  static Future<void> _writeToFile(String message) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/dev_log.log');
    await file.writeAsString(
      '${_formatter.format(DateTime.now())} - $message\n',
      mode: FileMode.append,
    );
  }
}
