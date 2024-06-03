import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) async {
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
