import 'package:freezed_annotation/freezed_annotation.dart';

part 'pests_and_diseases_treatment_method_payload.freezed.dart';
part 'pests_and_diseases_treatment_method_payload.g.dart';

@freezed
class PestsAndDiseasesTreatmentMethodPayLoad
    with _$PestsAndDiseasesTreatmentMethodPayLoad {
  const factory PestsAndDiseasesTreatmentMethodPayLoad({
    String? PestsAndDiseasesRegisterTreatmentMethodId,
    String? PestsAndDiseasesRegisterTreatmentMethodNo,
    String? PestsAndDiseasesRegisterId,
    String? PestsAndDiseasesRegisterNo,
    num? TreatmentMethodId,
    bool? IsActive,
    bool? IsMasterdataSynced,
  }) = _PestsAndDiseasesTreatmentMethodPayLoad;
  factory PestsAndDiseasesTreatmentMethodPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$PestsAndDiseasesTreatmentMethodPayLoadFromJson(json);
}
