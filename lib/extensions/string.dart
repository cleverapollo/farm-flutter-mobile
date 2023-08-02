extension StringNullExtension on String? {
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

    return '$this';
  }
}
