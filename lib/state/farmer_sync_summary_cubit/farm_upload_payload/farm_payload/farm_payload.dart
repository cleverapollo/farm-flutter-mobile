import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_member_objective_anwser_payload/farm_member_objective_anwser.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_member_risk_profile_answer_payload/farm_member_risk_profile_answer_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'farm_payload.freezed.dart';
part 'farm_payload.g.dart';

@freezed
class FarmPayLoad with _$FarmPayLoad {
  const factory FarmPayLoad({
    String? FarmId,
    String? FarmName,
    num? GroupSchemeId,
    num? RegionalManagerUnitId,
    bool? IsActive,
    num? IsMasterDataSynced,
    bool? IsSlimfCompliant,
    num? PropertyOwnershipTypeId,
    String? FirstName,
    String? LastName,
    String? IdNumber,
    String? MobileNumber,
    String? Email,
    bool? IsProspectMember,
    bool? IsGroupSchemeMember,
    num? Latitude,
    num? Longitude,
    String? StreetName,
    num? StreetNumber,
    String? Province,
    String? Town,
    num? FarmSize,
    String? InclusionDate,
    bool? IsCommunitiesNeighbouring,
    bool? IsIndigenousNeighbouring,
    bool? IsHcvNeighbouring,
    bool? IsRiversOrStreamsNeighbouring,
    bool? IsChemicalsUsed,
    bool? IsEcosystemsServicesOffered,
    num? ProduceFscCertifiedCharcoalCostEffectivelyId,
    num? ImproveRangeLandId,
    num? ImproveAccessToFarmId,
    num? RestoreBushveldId,
    num? ProtectedRteDuringOperationId,
    num? ManageResourcesSustainablyId,
    String? SignaturePoints,
    String? SignatureImage,
    String? SignatureDate,
    num? CanDelete,
    num? IsLocal,
    List<FarmMemberObjectiveAnswerPayLoad>? ObjectiveAnswers,
    List<FarmMemberRiskProfileAnswerPayLoad>? RiskProfileAnswers,
  }) = _FarmPayLoad;
  factory FarmPayLoad.fromJson(Map<String, dynamic> json) =>
      _$FarmPayLoadFromJson(json);
}
