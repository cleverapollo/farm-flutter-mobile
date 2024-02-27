import 'package:cmo/extensions/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isar/isar.dart';

import '../model.dart';

part 'farm.freezed.dart';
part 'farm.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Farm with _$Farm {
  const factory Farm({
    @JsonKey(name: 'FarmId') required String farmId,
    @JsonKey(name: 'FarmName') String? farmName,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'GroupSchemeName') String? groupSchemeName,
    @JsonKey(name: 'RegionalManagerUnitId') int? regionalManagerUnitId,
    @JsonKey(name: 'RegionalManagerUnitName') String? regionalManagerUnitName,
    @Default(false)
    @JsonKey(name: 'IsActive') bool isActive,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsSlimfCompliant') bool? isSlimfCompliant,
    @JsonKey(name: 'PropertyOwnershipTypeId') int? propertyOwnershipTypeId,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'LastName') String? lastName,
    @JsonKey(name: 'IdNumber') String? idNumber,
    @JsonKey(name: 'MobileNumber') String? mobileNumber,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Latitude') String? latitude,
    @JsonKey(name: 'Longitude') String? longitude,
    @JsonKey(name: 'StreetName') String? streetName,
    @JsonKey(name: 'StreetNumber') int? streetNumber,
    @JsonKey(name: 'Province') String? province,
    @JsonKey(name: 'Town') String? town,
    @JsonKey(name: 'FarmSize') double? farmSize,
    @JsonKey(name: 'InclusionDate') String? inclusionDate,
    @Default(false)
    @JsonKey(name: 'IsCommunitiesNeighbouring') bool? isCommunitiesNeighbouring,
    @Default(false)
    @JsonKey(name: 'IsIndigenousNeighbouring') bool? isIndigenousNeighbouring,
    @Default(false)
    @JsonKey(name: 'IsHcvNeighbouring') bool? isHcvNeighbouring,
    @Default(false)
    @JsonKey(name: 'IsRiversOrStreamsNeighbouring') bool? isRiversOrStreamsNeighbouring,
    @Default(false)
    @JsonKey(name: 'IsChemicalsUsed') bool? isChemicalsUsed,
    @Default(false)
    @JsonKey(name: 'IsEcosystemsServicesOffered') bool? isEcosystemsServicesOffered,
    @JsonKey(name: 'ProduceFscCertifiedCharcoalCostEffectivelyId') int? produceFscCertifiedCharcoalCostEffectivelyId,
    @JsonKey(name: 'ImproveRangeLandId') int? improveRangeLandId,
    @JsonKey(name: 'ImproveAccessToFarmId') int? improveAccessToFarmId,
    @JsonKey(name: 'RestoreBushveldId') int? restoreBushveldId,
    @JsonKey(name: 'ProtectedRteDuringOperationId') int? protectedRteDuringOperationId,
    @JsonKey(name: 'ManageResourcesSustainablyId') int? manageResourcesSustainablyId,
    @JsonKey(name: 'SignaturePoints') String? signaturePoints,
    @JsonKey(name: 'SignatureImage') String? signatureImage,
    @JsonKey(name: 'SignatureDate') String? signatureDate,
    @Default(false)
    @JsonKey(name: 'IsGroupSchemeMember') bool isGroupSchemeMember,
    @Default(false)
    @JsonKey(name: 'IsProspectMember') bool isProspectMember,
    @Default(false)
    @JsonKey(name: 'IsSuspended') bool isSuspended,

    @Default(false) @JsonKey(name: 'IsMasterDataSynced') bool isMasterDataSynced,
    @ignore List<FarmMemberObjectiveAnswer>? objectiveAnswers,
    @ignore List<FarmMemberRiskProfileAnswer>? riskProfileAnswers,
    @Default(<Compartment>[])
    @ignore List<Compartment> compartments,
    @Default(<Asi>[])
    @ignore List<Asi> asi,
  }) = _Farm;

  factory Farm.fromJson(Map<String, dynamic> json) => _$FarmFromJson(json);

  const Farm._();

  @override
  Id get id => int.tryParse(farmId) ?? Isar.autoIncrement;
}

extension FarmExtension on Farm {
  int numberStepComplete({
    List<RiskProfileQuestion>? allRiskProfileQuestions,
    List<FarmMemberRiskProfileAnswer>? allFarmMemberRiskProfileAnswers,
    List<FarmMemberObjective>? allFarmMemberObjectives,
    List<FarmMemberObjectiveAnswer>? allFarmMemberObjectiveAnswers,
  }) {
    var stepCount = 0;

    if (isSlimfCompliant != null) {
      stepCount++;
    }

    if (propertyOwnershipTypeId != null) {
      stepCount++;
    }

    if (firstName.isNotBlank &&
        lastName.isNotBlank &&
        idNumber.isNotBlank &&
        idNumber!.length >= 8 &&
        mobileNumber.isNotBlank &&
        mobileNumber!.length >= 8) {
      stepCount++;
    }

    if (farmName.isNotBlank &&
        latitude.isNotBlank &&
        longitude.isNotBlank) {
      stepCount++;
    }

    final riskProfileAnswers = allFarmMemberRiskProfileAnswers?.where(
      (element) => element.farmId == farmId,
    );

    if (riskProfileAnswers.isNotBlank &&
        riskProfileAnswers!.length == allRiskProfileQuestions?.length) {
      stepCount++;
    }

    final objectiveAnswers = allFarmMemberObjectiveAnswers?.where(
      (element) => element.farmId == farmId,
    );

    if (objectiveAnswers.isNotBlank &&
        objectiveAnswers!.length == allFarmMemberObjectives?.length) {
      stepCount++;
    }

    if (!signatureDate.isNullOrEmpty) {
      stepCount++;
    }

    return stepCount;
  }

  bool? get hasSignature {
    if (isMasterDataSynced == null || isMasterDataSynced == 0) return null;

    return signatureDate != null || isGroupSchemeMember == true;
  }

  double calculateFarmSizeBasedOnCompartments() {
    var size = 0.0;
    for (final compartment in compartments) {
      size += compartment.polygonArea ?? 0.0;
    }

    return size;
  }

  LatLng? centerPoint() {
    var centerLat = 0.0;
    var centerLong = 0.0;
    if (compartments.isBlank) return null;

    for (final compartment in compartments) {
      final centerPoint = compartment.centerPoint();
      centerLat += centerPoint.latitude;
      centerLong += centerPoint.longitude;
    }

    return LatLng(
      centerLat / compartments.length,
      centerLong / compartments.length,
    );
  }
}
