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
import 'package:flutter/widgets.dart';
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

  Future<void> fetchData({required BuildContext context}) async {
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

      onUpdateStocking();
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false, isDataReady: true));
    }
  }

  String? checkCompleteRequiredField() {
    final compartment = state.compartment;
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

      await cmoDatabaseMasterService.cacheCompartment(
        state.compartment.copyWith(
          localCompartmentId: state.compartmentBeforeEdit.localCompartmentId ??
              DateTime.now().millisecondsSinceEpoch,
          createDT: state.compartment.createDT ?? DateTime.now().toString(),
          groupSchemeId: state.groupScheme?.groupSchemeId,
          farmId: state.farmId,
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

  void onPolygonAreaChanged(double? value) {
    state.compartment = state.compartment.copyWith(polygonArea: value);
  }

  void onLocationsChanged(List<PolygonItem>? locations) {
    state.compartment = state.compartment.copyWith(
      polygonItems: locations,
      polygon: json.encode(locations),
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
    state.compartment = state.compartment.copyWith(espacementWidth: value);
    onUpdateStocking();
  }

  void onEspacementLengthChanged(String? value) {
    state.compartment = state.compartment.copyWith(espacementLength: value);
    onUpdateStocking();
  }

  void onUpdateStocking() {
    emit(
      state.copyWith(
        compartment: state.compartment.copyWith(
          stockingPercentage: 10000 /
              ((double.tryParse(state.compartment.espacementLength ?? '') ??
                      1) *
                  (double.tryParse(state.compartment.espacementWidth ?? '') ??
                      1)),
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
