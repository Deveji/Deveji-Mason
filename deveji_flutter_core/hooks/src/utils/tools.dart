import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:mason/mason.dart';

import 'consts.dart';

/// Executes a command in the terminal and returns the output as a string
Future<String> executeCommand(
  String command,
  List<String> args,
  HookContext context, [
  String? progressDescription,
]) async {
  final workingDirectory =
      '${Directory.current.path}/${context.vars[ProjectParameters.repoName]}/${context.vars[ProjectParameters.projectName]}';
  Progress? progress;
  if (progressDescription != null) {
    progress = context.logger.progress(progressDescription);
  }

  final process = await Process.start(
    command,
    args,
    runInShell: true,
    workingDirectory: workingDirectory,
  );

  // Create a new file in the output directory
  final logFile = File(path.join(workingDirectory, logFileName));
  final sink = logFile.openWrite(mode: FileMode.append);
  final output = StringBuffer();

  sink.write('Running: $command ${args.join(' ')}\n');
  output.write('Running: $command ${args.join(' ')}\n');

  process.stdout.transform(utf8.decoder).listen((data) {
    sink.write('$data');
    output.write(data);
  });

  await process.stderr.transform(utf8.decoder).listen((data) {
    sink.write('Error: $data');
    output.write('Error: $data');
  }).asFuture();

  final exitCode = await process.exitCode;
  await sink.close();

  if (exitCode != 0) {
    progress?.fail();
    print(output.toString());
    exit(1);
  }
  progress?.complete();
  return output.toString();
}

/// Gets the flavour from the project id (e.g. com.example.app.stg)
String getFlavourFromId(String id) {
  String flavour = id.split('.').last;
  switch (flavour) {
    case 'stg':
      flavour = 'staging';
      break;
    case 'dev':
      flavour = 'development';
      break;
    default:
      flavour = 'production';
  }
  return flavour;
}
