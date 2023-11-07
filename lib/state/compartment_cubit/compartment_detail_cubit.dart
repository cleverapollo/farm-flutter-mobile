import 'dart:async';
import 'dart:convert';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/compartment/area_type.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/compartment/product_group_template.dart';
import 'package:cmo/model/compartment/species_group_template.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CompartmentDetailCubit extends Cubit<CompartmentDetailState> {
  CompartmentDetailCubit(String farmId,
      {required Compartment compartment, String? campId})
      : super(CompartmentDetailState(
            farmId: farmId,
            campId: campId,
            compartment: compartment.copyWith(
                effectiveArea: compartment.effectiveArea ?? 90),
            compartmentBeforeEdit: compartment));

  Future<void> fetchData() async {
    try {
      emit(state.copyWith(loading: true));
      final groupScheme = await configService.getActiveGroupScheme();
      final farm = await configService.getActiveFarm();

      final groupSchemeId = groupScheme?.groupSchemeId ?? farm?.groupSchemeId;

      final result = await Future.wait([
        cmoDatabaseMasterService.getAreaTypesByGroupSchemeId(groupSchemeId),
        cmoDatabaseMasterService.getProductGroupTemplates(groupSchemeId),
        cmoDatabaseMasterService.getSpeciesGroupTemplates(groupSchemeId),
      ]);

      emit(state.copyWith(
        areaTypes: result[0] as List<AreaType>?,
        productGroupTemplates: result[1] as List<ProductGroupTemplate>?,
        speciesGroupTemplates: result[2] as List<SpeciesGroupTemplate>?,
        filterProductGroupTemplates: result[1] as List<ProductGroupTemplate>?,
        filterSpeciesGroupTemplates: result[2] as List<SpeciesGroupTemplate>?,
        groupScheme: groupScheme,
        isDataReady: true,
      ));
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false, isDataReady: true));
    }
  }

  String? checkCompleteRequiredField() {
    final compartment = state.compartment;
    final conservationAreaType = state.areaTypes.firstWhereOrNull(
      (element) =>
          element.areaTypeName.isNotBlank &&
          element.areaTypeName!.toLowerCase().contains(
                'Conservation Area'.toLowerCase(),
              ),
    );

    if (compartment.areaTypeId != null && compartment.areaTypeId == conservationAreaType?.areaTypeId) {
      if (compartment.polygonArea == null) {
        return LocaleKeys.polygon_area_is_required.tr();
      }

      return null;
    } else {
      if (compartment.unitNumber.isBlank) {
        return LocaleKeys.compartment_name_is_required.tr();
      }
      if (compartment.areaTypeId.isBlank) {
        return LocaleKeys.area_type_is_required.tr();
      }
      if (compartment.productGroupTemplateId.isBlank) {
        return LocaleKeys.product_group_is_required.tr();
      } else if (compartment.speciesGroupTemplateId.isBlank) {
        return LocaleKeys.species_group_is_required.tr();
      } else if (compartment.plannedPlantDT.isBlank) {
        return LocaleKeys.planned_plant_date_is_required.tr();
      } else if (compartment.effectiveArea == null) {
        return LocaleKeys.effective_area_is_required.tr();
      }

      return null;
    }
  }

  Future<void> saveCompartment() async {
    try {
      emit(state.copyWith(loading: true));

      var isMastersynced = false;

      if (state.compartmentBeforeEdit.isMasterdataSynced == true) {
        if (state.compartment != state.compartmentBeforeEdit) {
          isMastersynced = false;
        } else {
          isMastersynced = true;
        }
      }

      String? farmId;
      int? groupSchemeId;

      final farm = await configService.getActiveFarm();

      if (farm != null) {
        farmId = farm.farmId;
        groupSchemeId = farm.groupSchemeId;
      } else {
        farmId = state.farmId;
        groupSchemeId = state.groupScheme?.groupSchemeId;
      }

      await cmoDatabaseMasterService.cacheCompartment(
        state.compartment.copyWith(
          localCompartmentId: state.compartmentBeforeEdit.localCompartmentId ??
              DateTime.now().millisecondsSinceEpoch,
          createDT: state.compartment.createDT ?? DateTime.now(),
          updateDT: DateTime.now(),
          groupSchemeId: groupSchemeId,
          farmId: farmId,
          campId: state.campId,
          isActive: true,
          isMasterdataSynced: isMastersynced,
        ),
        isDirect: true,
      );
    } catch (e) {
      logger.d('Could not create compartment $e');
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void onCompartmentNameChanged(String value) {
    state.compartment = state.compartment.copyWith(unitNumber: value);
  }

  void onChangeLocation(
    double? polygonArea,
    List<PolygonItem>? locations,
  ) {
    emit(
      state.copyWith(
        compartment: state.compartment.copyWith(
          polygonArea: polygonArea,
          polygonItems: locations,
          polygon: json.encode(locations),
        ),
      ),
    );
  }

  void onAreaTypeChanged(String areaTypeId) {
    emit(
      state.copyWith(
        compartment: state.compartment
            .clearSpeciesGroupTemplateAndProductGroupTemplate()
            .copyWith(
              areaTypeId: areaTypeId,
            ),
        filterSpeciesGroupTemplates: state.speciesGroupTemplates
            .where((element) => element.areaTypeId == areaTypeId)
            .toList(),
        filterProductGroupTemplates: state.productGroupTemplates
            .where((element) => element.areaTypeId == areaTypeId)
            .toList(),
      ),
    );
  }

  void onProductGroupChanged({
    String? productGroupId,
    String? productGroupName,
  }) {
    emit(
      state.copyWith(
        compartment: state.compartment.copyWith(
          productGroupTemplateId: productGroupId,
          productGroupTemplateName: productGroupName,
        ),
      ),
    );
  }

  void onSpeciesGroupChanged({
    String? speciesGroupId,
    String? speciesGroupName,
  }) {
    emit(
      state.copyWith(
        compartment: state.compartment.copyWith(
          speciesGroupTemplateId: speciesGroupId,
          speciesGroupTemplateName: speciesGroupName,
        ),
      ),
    );
  }

  void onCompartmentUnitChanged(String value) {
    emit(
      state.copyWith(
        compartment: state.compartment.copyWith(unitNumber: value),
      ),
    );
  }

  void onEffectiveAreaChanged(double? value) {
    emit(
      state.copyWith(
        compartment: state.compartment.copyWith(effectiveArea: value),
      ),
    );
  }

  void onEspacementWidthChanged(String? value) {
    emit(
      state.copyWith(
        compartment: state.compartment.copyWith(
          espacementWidth: double.tryParse(value ?? ''),
        ),
      ),
    );
  }

  void onEspacementLengthChanged(String? value) {
    emit(
      state.copyWith(
        compartment: state.compartment.copyWith(
          espacementLength: double.tryParse(value ?? ''),
        ),
      ),
    );
  }

  void onPlannedPlantDateChanged(DateTime? value) {
    emit(
      state.copyWith(
        compartment: state.compartment.copyWith(
          plannedPlantDT: value?.toString(),
        ),
      ),
    );
  }

  void onSurvivalPercentageDateChanged(double? value) {
    state.compartment = state.compartment.copyWith(survival: value);
  }

  void onRotationChanged(int? value) {
    state.compartment = state.compartment.copyWith(rotationNumber: value);
  }

  void onMAIChanged(int? value) {
    state.compartment = state.compartment.copyWith(utilMAI: value);
  }
}
