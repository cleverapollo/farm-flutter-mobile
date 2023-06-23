import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class FileUtil {
  static Future<File> writeToFile(ByteData data) async {
    final buffer = data.buffer;
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
    final filePath =
        '$tempPath/signature.tmp'; // signature.tmp is dump file, can be anything
    return File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future<bool> saveFile(String? path) async {
    if (path == null) return false;

    var isSave = false;

    final file = File(path); // 1
    await file
        .writeAsBytes(await file.readAsBytes())
        .then((value) => isSave = true);

    return isSave;
  }
}