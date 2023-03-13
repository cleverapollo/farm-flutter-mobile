extension StringNullExtension on String? {
  String get emptyIfNull {
    return this ?? '';
  }

  bool get isNull => this == null;

  bool get isBlank => isNull || this!.isEmpty;

  bool get isNotBlank => !isBlank;
}
