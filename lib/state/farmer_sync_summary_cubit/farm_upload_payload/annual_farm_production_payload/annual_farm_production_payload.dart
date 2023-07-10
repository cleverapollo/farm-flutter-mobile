import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_farm_production_payload.freezed.dart';
part 'annual_farm_production_payload.g.dart';

@freezed
class AnnualFarmProductionPayload with _$AnnualFarmProductionPayload {
  const factory AnnualFarmProductionPayload({
    int? JobDescriptionId,
    String? JobDescriptionName,
    bool? IsAssignedToWorker,
    int? IsActive,
  }) = _AnnualFarmProductionPayload;
  factory AnnualFarmProductionPayload.fromJson(Map<String, dynamic> json) =>
      _$AnnualFarmProductionPayloadFromJson(json);
}
