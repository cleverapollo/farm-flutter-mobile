import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'plantation.freezed.dart';
part 'plantation.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Plantation with _$Plantation {
    const Plantation._();

  @override
  Id get id => plantationId;

  const factory Plantation({
    @JsonKey(name: 'PlantationId') required int  plantationId,
    @JsonKey(name: 'PlantationName') String? plantationName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'CompanyId') int? companyId,
  }) = _Plantation;

  factory Plantation.fromJson(Map<String, dynamic> json) => _$PlantationFromJson(json);
}
