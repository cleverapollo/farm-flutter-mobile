import 'package:freezed_annotation/freezed_annotation.dart';

part 'pests_and_diseases_register_payload.freezed.dart';
part 'pests_and_diseases_register_payload.g.dart';

@freezed
class PestsAndDiseasesRegisterPayLoad with _$PestsAndDiseasesRegisterPayLoad {
  const factory PestsAndDiseasesRegisterPayLoad({
    String? PestsAndDiseasesRegisterNo,
    String? FarmId,
    num? PestsAndDiseaseTypeId,
    String? PestsAndDiseasesRegisterId,
    num? NumberOfOutbreaks,
    num? AreaLost,
    bool? UnderControl,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    bool? IsActive,
    bool? IsMasterdataSynced,
    String? PestsAndDiseaseTypeName,
    String? PestsAndDiseaseTreatmentMethods,
    DateTime? CreateDT,
    DateTime? UpdateDT,
  }) = _PestsAndDiseasesRegisterPayLoad;
  factory PestsAndDiseasesRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$PestsAndDiseasesRegisterPayLoadFromJson(json);
}
