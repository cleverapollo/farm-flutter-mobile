import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/rte_species_register_payload/rte_species_register_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/rte_species_register_photo_payload/rte_species_register_photo_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_rte_species_register_payload.freezed.dart';
part 'main_rte_species_register_payload.g.dart';

@freezed
class MainRteSpeciesRegisterPayLoad with _$MainRteSpeciesRegisterPayLoad {
  const factory MainRteSpeciesRegisterPayLoad({
    RteSpeciesRegisterPayLoad? Register,
    List<RteSpeciesRegisterPhotoPayLoad>? Photos,
  }) = _MainRteSpeciesRegisterPayLoad;
  factory MainRteSpeciesRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$MainRteSpeciesRegisterPayLoadFromJson(json);
}
