import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm.freezed.dart';
part 'farm.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Farm with _$Farm {
  const Farm._();

  @override
  Id get id => int.tryParse(farmId ?? "") ?? 0;

  const factory Farm({
    @JsonKey(name: 'CreateDT') String? createDt,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'FarmName') String? farmName,
    @JsonKey(name: 'FarmRoleId') String? farmRoleId,
    @JsonKey(name: 'FarmSize') double? farmSize,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'GroupSchemeName') String? groupSchemeName,
    @JsonKey(name: 'IdNumber') String? idNumber,
    @JsonKey(name: 'ImproveAccessToFarmId') int? improveAccessToFarmId,
    @JsonKey(name: 'ImproveRangeLandId') int? improveRangeLandId,
    @JsonKey(name: 'InclusionDate') String? inclusionDate,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsChemicalsUsed') bool? isChemicalsUsed,
    @JsonKey(name: 'IsCommunitiesNeighbouring')
    bool? isCommunitiesNeighbouring,
    @JsonKey(name: 'IsEcosystemsServicesOffered')
    bool? isEcosystemsServicesOffered,
    @JsonKey(name: 'IsGroupSchemeMember') bool? isGroupSchemeMember,
    @JsonKey(name: 'IsHcvNeighbouring') bool? isHcvNeighbouring,
    @JsonKey(name: 'IsIndigenousNeighbouring')
    bool? isIndigenousNeighbouring,
    @JsonKey(name: 'IsProspectMember') bool? isProspectMember,
    @JsonKey(name: 'IsRiversOrStreamsNeighbouring')
    bool? isRiversOrStreamsNeighbouring,
    @JsonKey(name: 'IsSlimfCompliant') bool? isSlimfCompliant,
    @JsonKey(name: 'LastName') String? lastName,
    @JsonKey(name: 'latitude')
    String? latitude,
    @JsonKey(name: 'longitude')
    String? longitude,
    @JsonKey(name: 'ManageResourcesSustainablyId')
    int? manageResourcesSustainablyId,
    @JsonKey(name: 'MobileNumber') String? mobileNumber,
    @JsonKey(name: 'ProduceFscCertifiedCharcoalCostEffectivelyId')
    int? produceFscCertifiedCharcoalCostEffectivelyId,
    @JsonKey(name: 'PropertyOwnershipTypeId') int? propertyOwnershipTypeId,
    @JsonKey(name: 'ProtectedRteDuringOperationId')
    int? protectedRteDuringOperationId,
    @JsonKey(name: 'province')
    String? province,
    @JsonKey(name: 'RegionalManagerUnitId') int? regionalManagerUnitId,
    @JsonKey(name: 'RegionalManagerUnitName')
    String? regionalManagerUnitName,
    @JsonKey(name: 'RestoreBushveldId') int? restoreBushveldId,
    @JsonKey(name: 'StreetName') String? streetName,
    @JsonKey(name: 'StreetNumber') int? streetNumber,
    String? town,
    @JsonKey(name: 'UpdateDT') String? updateDt,
  }) = _Farm;

  factory Farm.fromJson(Map<String, dynamic> json) => _$FarmFromJson(json);
}

