import 'package:freezed_annotation/freezed_annotation.dart';

part 'speqs.freezed.dart';
part 'speqs.g.dart';

@freezed
class Speqs with _$Speqs {
  const factory Speqs({
    @JsonKey(name: 'SPEQSId') int? speqsId,
    @JsonKey(name: 'SPEQSName') String? speqsName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Speqs;

  factory Speqs.fromJson(Map<String, dynamic> json) => _$SpeqsFromJson(json);
}
