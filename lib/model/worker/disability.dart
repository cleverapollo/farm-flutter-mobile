import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'disability.freezed.dart';
part 'disability.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Disability with _$Disability {
  const factory Disability({
    @JsonKey(name: 'DisabilityId') int? disabilityId,
    @JsonKey(name: 'DisabilityName') String? disabilityName,
    @Default(true)
    @JsonKey(name: 'IsActive') bool isActive
  }) = _Disability;

  const Disability._();

  factory Disability.fromJson(Map<String, dynamic> json) =>
      _$DisabilityFromJson(json);

  @override
  Id get id => disabilityId ?? Isar.autoIncrement;
}