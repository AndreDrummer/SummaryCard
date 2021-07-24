import 'dart:io';

import 'package:path_provider/path_provider.dart';

class StorageManager {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/summaryCardData.json');
  }

  static Future<String> writeContent(String data) async {
    final file = await _localFile;
    await file.writeAsString(data);
    return file.path;
  }

  static Future<String> readContent() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      return 'Error: $e';
    }
  }
}
