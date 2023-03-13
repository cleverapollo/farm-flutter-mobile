import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

class Json {
  static String? tryEncode(Object? data) {
    try {
      return jsonEncode(data);
    } catch (e) {
      return null;
    }
  }

  static dynamic tryDecode(String? data) {
    try {
      return jsonDecode(data.toString());
    } catch (e) {
      return null;
    }
  }
}

class StringNullConverter implements JsonConverter<String?, dynamic> {
  const StringNullConverter();

  @override
  String? fromJson(dynamic json) => '$json' == 'null' ? null : '$json';

  @override
  String toJson(String? object) => object ?? '';
}

class StringConverter implements JsonConverter<String, dynamic> {
  const StringConverter();

  @override
  String fromJson(dynamic json) => '$json';

  @override
  String toJson(String object) => object;
}
