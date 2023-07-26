import 'dart:async';
import 'dart:convert';

import 'package:cmo/di.dart';
import 'package:cmo/model/compartment/area_type.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/compartment/product_group_template.dart';
import 'package:cmo/model/compartment/species_group_template.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CompartmentDetailCubit extends Cubit<CompartmentDetailState> {
  CompartmentDetailCubit(String farmId, {String? campId}) : super(CompartmentDetailState(farmId: farmId, campId: campId));

  Future fetchData({required BuildContext context}) async {
    try {
      emit(state.copyWith(loading: true));
      final groupScheme = await configService.getActiveGroupScheme();
      final resourceManagerUnit = await configService.getActiveRegionalManager();
      final result = await Future.wait([
        cmoPerformApiService.fetchAreaTypes(),
        cmoPerformApiService.fetchProductGroupTemplates(),
        cmoPerformApiService.fetchSpeciesGroupTemplates()
      ]);
      emit(state.copyWith(
        areaTypes: result[0] as List<AreaType>?,
        productGroupTemplates: result[1] as List<ProductGroupTemplate>?,
        speciesGroupTemplates: result[2] as List<SpeciesGroupTemplate>?,
        groupScheme: groupScheme,
        resourceManagerUnit: resourceManagerUnit,
      ));
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future saveCompartment() {
    return cmoDatabaseMasterService.cacheCompartment(state.compartment.copyWith(
      compartmentId: DateTime.now().millisecondsSinceEpoch,
      groupSchemeId: state.groupScheme?.groupSchemeId,
      regionalManagerUnitId: state.resourceManagerUnit?.regionalManagerUnitId,
      farmId: state.farmId,
      campId: state.campId,
    ));
  }

  void onCompartmentNameChanged(String value) {
    state.compartment = state.compartment.copyWith(compartmentName: value);
  }

  void onPolygonAreaChanged(double? value) {
    state.compartment = state.compartment.copyWith(polygonArea: value);
  }

  void onLocationsChanged(List<GeoLocation>? locations) {
    state.compartment =
        state.compartment.copyWith(jsonLocations: json.encode(locations));
  }

  void onAreaTypeChanged(String areaTypeId) {
    emit(state.copyWith(
        compartment: state.compartment.copyWith(areaTypeId: areaTypeId)));
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

  void onEspacementChanged(String? value) {
    state.compartment = state.compartment.copyWith(espacement: value);
  }

  void onPlannedPlantDateChanged(DateTime? value) {
    state.compartment =
        state.compartment.copyWith(plannedPlantDT: value?.toIso8601String());
  }

  void onSurvivalPercentageDateChanged(double? value) {
    state.compartment = state.compartment.copyWith(survival: value);
  }

  void onStockingPercentageDateChanged(double? value) {
    state.compartment = state.compartment.copyWith(stockingPercentage: value);
  }

  void onRotationChanged(double? value) {
    state.compartment = state.compartment.copyWith(rotationNumber: value);
  }

  void onMAIChanged(double? value) {
    state.compartment = state.compartment.copyWith(utilMAI: value);
  }
}
