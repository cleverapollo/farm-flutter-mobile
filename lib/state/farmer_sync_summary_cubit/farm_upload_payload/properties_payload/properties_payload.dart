import 'package:freezed_annotation/freezed_annotation.dart';

part 'properties_payload.freezed.dart';
part 'properties_payload.g.dart';

@freezed
class Properties with _$Properties {
  const factory Properties({
    String? key,
    String? value,
  }) = _Properties;

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);
}
