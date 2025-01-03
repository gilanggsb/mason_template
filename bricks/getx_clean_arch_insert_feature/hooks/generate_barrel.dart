import 'dart:io';
import 'package:mason/mason.dart';

Future<void> generateBarrelFile(HookContext context) async {
  print('=============================');
  print('Generating barrel files.......');

  String directoryPath =
      Directory.current.path + '\\' + context.vars['existing_feature'];

  // Get all directories in the specified path
  final directories =
      Directory(directoryPath).listSync().whereType<Directory>();

  List<String> folderNames = [];

  // Function to generate barrel files for a directory
  void generateBarrelInDirectory(Directory dir) {
    final folderName = dir.path.split('\\').last;
    final barrelFilePath =
        '${dir.path}\\$folderName.dart'; // Create barrel file name based on folder name

    // Get all Dart files in the current directory
    final files = dir.listSync().where((entity) {
      return entity.path.endsWith('.dart') &&
          !entity.path.endsWith('$folderName.dart');
    });

    // Debugging output for files
    if (files.isEmpty) {
      print('No Dart files found in $folderName.');
    } else {
      files.forEach((e) {
        print('Found file: ${e.path}');
      });
    }

    // Generate the export statements
    final exports = files.map((file) {
      final fileName = file.uri.pathSegments.last;
      print("Exporting file: $fileName");
      return "export '$fileName';";
    }).join('\n');

    // Write to the barrel file
    if (exports.isNotEmpty) {
      File(barrelFilePath).writeAsStringSync(exports);
      print('Barrel file generated at $barrelFilePath');
      // folderNames.add(folderName); // Add the parent folder name
    } else {
      print('No exports to write for $folderName.');
    }
  }

  // Generate barrel files for each directory
  for (var dir in directories) {
    final folderName = dir.path.split('\\').last;
    generateBarrelInDirectory(dir); // Process the parent directory

    // Recursively generate barrel files for nested directories
    final nestedDirectories = dir.listSync().whereType<Directory>();
    for (var nestedDir in nestedDirectories) {
      generateBarrelInDirectory(nestedDir); // Process nested directories
    }

    folderNames.add(folderName); // Add the parent folder name
  }

  // Generate barrel in feature
  final barrelFeaturePath =
      '$directoryPath/${context.vars['existing_feature']}.dart';

  final featureExports = folderNames.map((folderName) {
    return "export '$folderName/$folderName.dart';";
  }).join('\n');

  if (featureExports.isNotEmpty) {
    File(barrelFeaturePath).writeAsStringSync(featureExports);
    print('Feature barrel file generated at $barrelFeaturePath');
  } else {
    print('No exports to write for the feature barrel file.');
  }

  print('=============================');
}
