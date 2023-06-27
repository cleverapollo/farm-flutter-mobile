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
}
