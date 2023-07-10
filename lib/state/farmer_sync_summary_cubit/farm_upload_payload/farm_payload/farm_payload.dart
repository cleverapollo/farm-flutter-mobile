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
    int? GroupSchemeId,
    int? RegionalManagerUnitId,
    bool? IsActive,
    int? IsMasterDataSynced,
    bool? IsSlimfCompliant,
    int? PropertyOwnershipTypeId,
    String? FirstName,
    String? LastName,
    String? IdNumber,
    String? MobileNumber,
    String? Email,
    bool? IsProspectMember,
    bool? IsGroupSchemeMember,
    int? Latitude,
    int? Longitude,
    String? StreetName,
    int? StreetNumber,
    String? Province,
    String? Town,
    int? FarmSize,
    String? InclusionDate,
    bool? IsCommunitiesNeighbouring,
    bool? IsIndigenousNeighbouring,
    bool? IsHcvNeighbouring,
    bool? IsRiversOrStreamsNeighbouring,
    bool? IsChemicalsUsed,
    bool? IsEcosystemsServicesOffered,
    int? ProduceFscCertifiedCharcoalCostEffectivelyId,
    int? ImproveRangeLandId,
    int? ImproveAccessToFarmId,
    int? RestoreBushveldId,
    int? ProtectedRteDuringOperationId,
    int? ManageResourcesSustainablyId,
    String? SignaturePoints,
    String? SignatureImage,
    String? SignatureDate,
    int? CanDelete,
    int? IsLocal,
    List<FarmMemberObjectiveAnswerPayLoad>? ObjectiveAnswers,
    List<FarmMemberRiskProfileAnswerPayLoad>? RiskProfileAnswers,
  }) = _FarmPayLoad;
  factory FarmPayLoad.fromJson(Map<String, dynamic> json) =>
      _$FarmPayLoadFromJson(json);
}
