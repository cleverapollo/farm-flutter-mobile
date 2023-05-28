import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'pests_and_diseases_register_treatment_method.freezed.dart';
part 'pests_and_diseases_register_treatment_method.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class PestsAndDiseasesRegisterTreatmentMethod
    with _$PestsAndDiseasesRegisterTreatmentMethod {
  const factory PestsAndDiseasesRegisterTreatmentMethod({
    @JsonKey(name: 'PestsAndDiseasesRegisterTreatmentMethodId')
        int? pestsAndDiseasesRegisterTreatmentMethodId,
    @JsonKey(name: 'PestsAndDiseasesRegisterTreatmentMethodNo')
        String? pestsAndDiseasesRegisterTreatmentMethodNo,
    @JsonKey(name: 'PestsAndDiseasesRegisterId')
        String? pestsAndDiseasesRegisterId,
    @JsonKey(name: 'PestsAndDiseasesRegisterNo')
        String? pestsAndDiseasesRegisterNo,
    @JsonKey(name: 'TreatmentMethodId') int? treatmentMethodId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
  }) = _PestsAndDiseasesRegisterTreatmentMethod;

  const PestsAndDiseasesRegisterTreatmentMethod._();

  factory PestsAndDiseasesRegisterTreatmentMethod.fromJson(
          Map<String, dynamic> json) =>
      _$PestsAndDiseasesRegisterTreatmentMethodFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
