import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/pests_and_diseases_register_payload/pests_and_diseases_register_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/pests_and_diseases_treatment_method_payload/pests_and_diseases_treatment_method_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_pests_and_diseases_register_payload.freezed.dart';
part 'main_pests_and_diseases_register_payload.g.dart';

@freezed
class MainPestsAndDiseasesRegisterPayLoad
    with _$MainPestsAndDiseasesRegisterPayLoad {
  const factory MainPestsAndDiseasesRegisterPayLoad({
    PestsAndDiseasesRegisterPayLoad? Register,
    List<PestsAndDiseasesTreatmentMethodPayLoad>? TreatmentMethod,
  }) = _MainPestsAndDiseasesRegisterPayLoad;
  factory MainPestsAndDiseasesRegisterPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$MainPestsAndDiseasesRegisterPayLoadFromJson(json);
}
