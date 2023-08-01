import 'dart:async';
import 'dart:convert';

import 'package:cmo/di.dart';
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
  CompartmentDetailCubit(String farmId, {String? campId}) : super(CompartmentDetailState(farmId: farmId, campId: campId));

  Future fetchData({required BuildContext context}) async {
    try {
      emit(state.copyWith(loading: true));
      final groupScheme = await configService.getActiveGroupScheme();
      final result = await Future.wait([
        cmoDatabaseMasterService.getAreaTypes(),
        cmoDatabaseMasterService.getProductGroupTemplates(),
        cmoDatabaseMasterService.getSpeciesGroupTemplates(),
      ]);

      emit(state.copyWith(
        areaTypes: result[0] as List<AreaType>?,
        productGroupTemplates: result[1] as List<ProductGroupTemplate>?,
        speciesGroupTemplates: result[2] as List<SpeciesGroupTemplate>?,
        groupScheme: groupScheme,
      ));
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> saveCompartment() async {
    try {
      emit(state.copyWith(loading: true));
      await cmoDatabaseMasterService.cacheCompartment(
        state.compartment.copyWith(
          createDT: DateTime.now().toString(),
          groupSchemeId: state.groupScheme?.groupSchemeId,
          farmId: state.farmId,
          campId: state.campId,
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
        compartment: state.compartment.copyWith(areaTypeId: areaTypeId),
      ),
    );
  }

  void onProductGroupChanged({
    String? productGroupId,
    String? productGroupName,
  }) {
    state.compartment = state.compartment.copyWith(
      productGroupTemplateId: productGroupId,
      productGroupTemplateName: productGroupName,
    );
  }

  void onSpeciesGroupChanged({
    String? speciesGroupId,
    String? speciesGroupName,
  }) {
    state.compartment = state.compartment.copyWith(
      speciesGroupTemplateId: speciesGroupId,
      speciesGroupTemplateName: speciesGroupName,
    );
  }

  void onCompartmentUnitChanged(String value) {
    state.compartment = state.compartment.copyWith(unitNumber: value);
  }

  void onEffectiveAreaChanged(double? value) {
    state.compartment = state.compartment.copyWith(effectiveArea: value);
  }

  void onEspacementWidthChanged(String? value) {
    state.compartment = state.compartment.copyWith(espacementWidth: value);
  }
  void onEspacementLengthChanged(String? value) {
    state.compartment = state.compartment.copyWith(espacementLength: value);
  }

  void onPlannedPlantDateChanged(DateTime? value) {
    state.compartment = state.compartment.copyWith(plannedPlantDT: value?.toString());
  }

  void onSurvivalPercentageDateChanged(double? value) {
    state.compartment = state.compartment.copyWith(survival: value);
  }

  void onStockingPercentageDateChanged(double? value) {
    state.compartment = state.compartment.copyWith(stockingPercentage: value);
  }

  void onRotationChanged(int? value) {
    state.compartment = state.compartment.copyWith(rotationNumber: value);
  }

  void onMAIChanged(int? value) {
    state.compartment = state.compartment.copyWith(utilMAI: value);
  }
}
