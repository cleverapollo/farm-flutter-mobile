import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'treament_method.freezed.dart';
part 'treament_method.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class TreatmentMethod with _$TreatmentMethod {
  const factory TreatmentMethod({
    @JsonKey(name: 'TreatmentMethodId') int? treatmentMethodId,
    @JsonKey(name: 'TreatmentMethodName') String? treatmentMethodName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _TreatmentMethod;

  const TreatmentMethod._();

  factory TreatmentMethod.fromJson(Map<String, dynamic> json) =>
      _$TreatmentMethodFromJson(json);

  @override
  Id get id => treatmentMethodId ?? Isar.autoIncrement;
}
