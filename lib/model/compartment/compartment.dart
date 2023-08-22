import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'compartment.freezed.dart';
part 'compartment.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Compartment with _$Compartment {
  const factory Compartment({
    @JsonKey(name: 'CompartmentId') int? localCompartmentId,
    @JsonKey(name: 'ManagementUnitName') String? managementUnitName,
    @JsonKey(name: 'ManagementUnitId') String? managementUnitId,
    @JsonKey(name: 'ParentManagementUnitId') String? parentManagementUnitId,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'AreaTypeId') String? areaTypeId,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'UnitNumber') String? unitNumber,
    @JsonKey(name: 'Status') bool? status,
    @JsonKey(name: 'PolygonArea') double? polygonArea,
    @JsonKey(name: 'EffectiveArea') double? effectiveArea,
    @JsonKey(name: 'PlannedPlantDT') String? plannedPlantDT,
    @JsonKey(name: 'PlantDT') String? plantDT,
    @JsonKey(name: 'PlannedFellDT') String? plannedFellDT,
    @JsonKey(name: 'Survival') double? survival,
    @JsonKey(name: 'RotationNumber') int? rotationNumber,
    @JsonKey(name: 'UtilMAI') int? utilMAI,
    @JsonKey(name: 'SpeciesGroupTemplateId') String? speciesGroupTemplateId,
    @JsonKey(name: 'ProductGroupTemplateId') String? productGroupTemplateId,
    @JsonKey(name: 'WorkingCircleTemplateId') String? workingCircleTemplateId,
    @JsonKey(name: 'NextWorkingCircleTemplateId')
        String? nextWorkingCircleTemplateId,
    @JsonKey(name: 'SphaAge') double? sphaAge,
    @JsonKey(name: 'SphaSurvival') double? sphaSurvival,
    @JsonKey(name: 'GeologyClassMasterDataId') String? geologyClassMasterDataId,
    @JsonKey(name: 'OwnershipClassMasterDataId')
        String? ownershipClassMasterDataId,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'Polygon') String? polygon,
    @ignore
    @Default(<PolygonItem>[])
    @JsonKey(name: 'PolygonItems')
        List<PolygonItem>? polygonItems,

    // New key value fields
    @JsonKey(name: 'CampId') String? campId,
    @JsonKey(name: 'ProductGroupTemplateName') String? productGroupTemplateName,
    @JsonKey(name: 'SpeciesGroupTemplateName') String? speciesGroupTemplateName,
    @JsonKey(name: 'EspacementWidth') double? espacementWidth,
    @JsonKey(name: 'EspacementLength') double? espacementLength,
    @JsonKey(name: 'StockingPercentage') double? stockingPercentage,
    @Default(false)
    @JsonKey(name: 'IsMasterdataSynced')
        bool? isMasterdataSynced,
  }) = _Compartment;

  const Compartment._();

  factory Compartment.fromJson(Map<String, dynamic> json) =>
      _$CompartmentFromJson(json);

  @override
  Id get id {
    final id = int.tryParse(managementUnitId ?? '') ??
        DateTime.now().millisecondsSinceEpoch;

    return localCompartmentId ?? id;
  }
}

extension CompartmentExtension on Compartment {
  Compartment clearSpeciesGroupTemplateAndProductGroupTemplate() {
    return const Compartment().copyWith(
      stockingPercentage: stockingPercentage,
      isMasterdataSynced: isMasterdataSynced,
      farmId: farmId,
      areaTypeId: areaTypeId,
      groupSchemeId: groupSchemeId,
      polygon: polygon,
      polygonItems: polygonItems,
      isActive: isActive,
      createDT: createDT,
      status: status,
      campId: campId,
      effectiveArea: effectiveArea,
      espacementLength: espacementLength,
      espacementWidth: espacementWidth,
      geologyClassMasterDataId: geologyClassMasterDataId,
      localCompartmentId: localCompartmentId,
      managementUnitId: managementUnitId,
      managementUnitName: managementUnitName,
      nextWorkingCircleTemplateId: nextWorkingCircleTemplateId,
      ownershipClassMasterDataId: ownershipClassMasterDataId,
      parentManagementUnitId: parentManagementUnitId,
      plannedFellDT: plannedFellDT,
      plannedPlantDT: plannedPlantDT,
      plantDT: plantDT,
      polygonArea: polygonArea,
      rotationNumber: rotationNumber,
      sphaAge: sphaAge,
      sphaSurvival: sphaSurvival,
      survival: survival,
      updateDT: updateDT,
      unitNumber: unitNumber,
      utilMAI: utilMAI,
      workingCircleTemplateId: workingCircleTemplateId,
    );
  }
}

@freezed
class PolygonItem with _$PolygonItem {
  const factory PolygonItem({
    @JsonKey(name: 'lat') double? latitude,
    @JsonKey(name: 'lng') double? longitude,
  }) = _PolygonItem;

  factory PolygonItem.fromJson(Map<String, dynamic> json) =>
      _$PolygonItemFromJson(json);
}
