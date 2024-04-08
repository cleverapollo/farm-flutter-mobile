import 'dart:math';

import 'package:isar/isar.dart';

extension StringNullExtension on String? {
  String? capitalize() {
    if (isBlank) return this;
    return '${this![0].toUpperCase()}${this?.substring(1).toLowerCase()}';
  }

  String? removeDot() {
    if (isBlank) return this;
    return this?.replaceAll('.', '');
  }

  int? getExtendedVersionNumber() {
    if (isBlank) return null;
    final versionString = this?.replaceAll('.', '');
    if (int.tryParse(versionString ?? '') != null) {
      final versionCells = this!.split('.').map((i) => int.tryParse(i)).toList();
      if (versionCells.length == 3) {
        return (versionCells[0] ?? 0) * 100000 + (versionCells[1] ?? 0) * 1000 + (versionCells[2] ?? 0);
      }

      var extendedVersionNumber = 0;
      for(var index = 0; index < versionCells.length; index++) {
        extendedVersionNumber += (versionCells[index] ?? 0) * (pow(10, (versionCells.length - index)*2)).toInt();
      }

      return extendedVersionNumber;
    }

    return null;
  }

  bool get validEmail {
    final emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this ?? '');
    return emailValid;
  }

  bool get validPhoneNumber {
    if (isBlank || this!.length < 10) return false;
    return true;
  }

  String get emptyIfNull {
    return this ?? '';
  }

  bool get isNull => this == null;

  bool get isBlank => isNull || this!.isEmpty;

  bool get isNotBlank => !isBlank;

  bool parseBool() {
    return this?.toLowerCase() == 'true';
  }

  bool get isNullOrEmpty => this == null || this?.isEmpty == true;

  String? get stringToBase64SyncServer {
    if (isBlank) return null;
    return 'data:image/jpeg;base64,$this';
  }

  String? get base64SyncServerToString {
    if (isBlank) return null;

    if (this!.contains('data:image/jpeg;base64,')) {
      return this!.replaceFirst('data:image/jpeg;base64,', '');
    }

    if (this!.contains('data:image/png;base64,')) {
      return this!.replaceFirst('data:image/png;base64,', '');
    }

    return '$this';
  }
}
