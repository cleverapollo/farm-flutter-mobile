import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';

class FileUtil {
  static Future<File> writeToFileWithUint8List(Uint8List data) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
    final filePath = '$tempPath/screenshot.tmp';
    return File(filePath).writeAsBytes(data);
  }

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

  static Future<String> toBase64(File file) async {
    return base64Encode(file.readAsBytesSync());
  }

  static Future<String> croppedFileToBase64(CroppedFile? croppedFile) async {
    if (croppedFile == null) return '';

    final uint8ListImage = await croppedFile.readAsBytes();
    final imageFile = await writeToFileWithUint8List(uint8ListImage);
    final base64 = await toBase64(imageFile);
    return base64;
  }
}
