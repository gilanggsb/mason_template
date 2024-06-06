import 'dart:async';

import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) async {
  Logger logger = context.logger;

  if (logger.confirm('Would you like to add env to .gitignore?',
      defaultValue: true)) ignoreEnvFile(context);

  await runBuildRunner(context);
}

FutureOr<void> runBuildRunner(HookContext context) async {
  // Determine the directory where the pubspec.yaml file is located
  final currentDirectory =
      Directory.current.path + '/' + context.vars['project_name'];

  // Run the build_runner command
  final buildRunnerProcess = await Process.start(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '-d'],
    runInShell: true,
    workingDirectory: currentDirectory,
  );

  // Handle stdout and stderr streams
  await stdout.addStream(buildRunnerProcess.stdout);
  await stderr.addStream(buildRunnerProcess.stderr);

  final exitCode = await buildRunnerProcess.exitCode;
  if (exitCode != 0) {
    context.logger.err('build_runner failed with exit code $exitCode');
    exit(exitCode);
  } else {
    context.logger.info('build_runner completed successfully');
  }
}

void ignoreEnvFile(HookContext context) {
  final currentDirectory =
      Directory.current.path + '/' + context.vars['project_name'];
  final gitignoreFile = File('${currentDirectory}/.gitignore');
  final lines = gitignoreFile.readAsLinesSync();

  // Lines to add to .gitignore
  final envLines = [
    '.env.*',
    // '.env.development',
    // '.env.production',
    // '.env.staging',
  ];

  // Check if the lines already exist to avoid duplicates
  for (final line in envLines) {
    if (!lines.contains(line)) {
      lines.add(line);
    }
  }

  // Write the updated lines back to .gitignore
  gitignoreFile.writeAsStringSync(lines.join('\n'));
}
