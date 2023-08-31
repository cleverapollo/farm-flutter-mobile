import 'package:isar/isar.dart';

extension StringNullExtension on String? {
  bool get validEmail {
    final emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this ?? '');
    return emailValid;
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

    return '$this';
  }

  String get lettersToIndex {
    if (isNullOrEmpty) return '';

    return _mapStringAlphabet[this!.toLowerCase()].toString();
  }

  int get toIdIsarFromUuid {
    final id = this?.replaceAll(RegExp(r'[^\w\s]+'), '');

    if (id == null) return Isar.autoIncrement;

    final ids = <String>[];

    for (final letter in id.split('')) {
      if (int.tryParse(letter) == null) {
        ids.add(letter.lettersToIndex.toString());
      } else {
        ids.add(letter);
      }
    }

    final num1 = num.tryParse(ids.join()) ?? 0;

    final num2 = num1 ~/ _num_10_28;

    return num2;
  }
}

Map<String, int> _mapStringAlphabet = {
  'a': 0,
  'b': 1,
  'c': 2,
  'd': 3,
  'e': 4,
  'f': 5,
  'g': 6,
  'h': 7,
  'i': 8,
  'j': 9,
  'k': 10,
  'l': 11,
  'm': 12,
  'n': 13,
  'o': 14,
  'p': 15,
  'q': 16,
  'r': 17,
  's': 18,
  't': 19,
  'u': 20,
  'v': 21,
  'w': 22,
  'x': 23,
  'y': 24,
  'z': 25,
};

num _num_10_28 = 10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10 *
    10;
