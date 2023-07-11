import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'hirac.freezed.dart';

part 'hirac.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Hirac with _$Hirac {
  const Hirac._();

  @override
  Id get id => hiracId ?? 0;

  const factory Hirac({
    @JsonKey(name: 'HiracId') int? hiracId,
    @JsonKey(name: 'HiracTemplateId') int? hiracTemplateId,
    @JsonKey(name: 'HiracName') String? hiracName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'UpdateDT') String? updateDt,
    @JsonKey(name: 'CreateDT') String? createDt,
  }) = _Hirac;

  factory Hirac.fromJson(Map<String, dynamic> json) =>
      _$HiracFromJson(json);
}
