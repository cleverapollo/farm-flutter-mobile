import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rte_species_register_payload.freezed.dart';

part 'rte_species_register_payload.g.dart';

@freezed
class RteSpeciesRegisterPayload with _$RteSpeciesRegisterPayload {
  const factory RteSpeciesRegisterPayload({
    @JsonKey(name: 'Register') RteSpecies? register,
    @JsonKey(name: 'Photos') List<RteSpeciesRegisterPhoto>? photos,
  }) = _RteSpeciesRegisterPayload;

  factory RteSpeciesRegisterPayload.fromJson(Map<String, dynamic> json) =>
      _$RteSpeciesRegisterPayloadFromJson(json);
}
