import 'package:freezed_annotation/freezed_annotation.dart';

part 'mmm.freezed.dart';
part 'mmm.g.dart';

@freezed
class Mmm with _$Mmm {
  const factory Mmm({
    @JsonKey(name: 'MMMId') int? mmmId,
    @JsonKey(name: 'MMMName') String? mmmName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Mmm;

  factory Mmm.fromJson(Map<String, dynamic> json) => _$MmmFromJson(json);
}
