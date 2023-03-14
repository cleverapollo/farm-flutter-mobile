import 'package:freezed_annotation/freezed_annotation.dart';

part 'plantation.freezed.dart';
part 'plantation.g.dart';

@freezed
class Plantation with _$Plantation {
  const factory Plantation({
    @JsonKey(name: 'PlantationId') int? plantationId,
    @JsonKey(name: 'PlantationName') String? plantationName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'CompanyId') int? companyId,
  }) = _Plantation;

  factory Plantation.fromJson(Map<String, dynamic> json) => _$PlantationFromJson(json);
}
