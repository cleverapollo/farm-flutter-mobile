import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'package:cmo/model/data/farm_member_objective_answer.dart';
import 'package:cmo/model/data/farm_member_risk_profile_answer.dart';

part 'farm.freezed.dart';

part 'farm.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Farm with _$Farm {
  const factory Farm({
    @JsonKey(name: 'FarmId') required String farmId,
    @JsonKey(name: 'FarmName') String? farmName,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'RegionalManagerUnitId') int? regionalManagerUnitId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
    @JsonKey(name: 'IsSlimfCompliant') bool? isSlimfCompliant,
    @JsonKey(name: 'PropertyOwnershipTypeId') int? propertyOwnershipTypeId,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'LastName') String? lastName,
    @JsonKey(name: 'IdNumber') String? idNumber,
    @JsonKey(name: 'MobileNumber') String? mobileNumber,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'IsProspectMember') bool? isProspectMember,
    @JsonKey(name: 'IsGroupSchemeMember') bool? isGroupSchemeMember,
    @JsonKey(name: 'Latitude') String? latitude,
    @JsonKey(name: 'Longitude') String? longitude,
    @JsonKey(name: 'StreetName') String? streetName,
    @JsonKey(name: 'StreetNumber') int? streetNumber,
    @JsonKey(name: 'Province') String? province,
    @JsonKey(name: 'Town') String? town,
    @JsonKey(name: 'FarmSize') double? farmSize,
    @JsonKey(name: 'InclusionDate') String? inclusionDate,
    @JsonKey(name: 'IsCommunitiesNeighbouring') bool? isCommunitiesNeighbouring,
    @JsonKey(name: 'IsIndigenousNeighbouring') bool? isIndigenousNeighbouring,
    @JsonKey(name: 'IsHcvNeighbouring') bool? isHcvNeighbouring,
    @JsonKey(name: 'IsRiversOrStreamsNeighbouring')
        bool? isRiversOrStreamsNeighbouring,
    @JsonKey(name: 'IsChemicalsUsed') bool? isChemicalsUsed,
    @JsonKey(name: 'IsEcosystemsServicesOffered')
        bool? isEcosystemsServicesOffered,
    @JsonKey(name: 'ProduceFscCertifiedCharcoalCostEffectivelyId')
        int? produceFscCertifiedCharcoalCostEffectivelyId,
    @JsonKey(name: 'ImproveRangeLandId') int? improveRangeLandId,
    @JsonKey(name: 'ImproveAccessToFarmId') int? improveAccessToFarmId,
    @JsonKey(name: 'RestoreBushveldId') int? restoreBushveldId,
    @JsonKey(name: 'ProtectedRteDuringOperationId')
        int? protectedRteDuringOperationId,
    @JsonKey(name: 'ManageResourcesSustainablyId')
        int? manageResourcesSustainablyId,
    @JsonKey(name: 'SignaturePoints') String? signaturePoints,
    @JsonKey(name: 'SignatureImage') String? signatureImage,
    @JsonKey(name: 'SignatureDate') String? signatureDate,
    @JsonKey(name: 'CanDelete') int? canDelete,
    @JsonKey(name: 'IsLocal') int? isLocal,
    List<FarmMemberObjectiveAnswer>? objectiveAnswers,
    List<FarmMemberRiskProfileAnswer>? riskProfileAnswers,
  }) = _Farm;

  factory Farm.fromJson(Map<String, dynamic> json) => _$FarmFromJson(json);

  const Farm._();

  @override
  Id get id => int.tryParse(farmId) ?? Isar.autoIncrement;
}
