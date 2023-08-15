import 'package:cmo/model/compartment/area_type.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/compartment/product_group_template.dart';
import 'package:cmo/model/compartment/species_group_template.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/model/resource_manager_unit.dart';

class CompartmentDetailState {
  CompartmentDetailState({
    this.loading = false,
    this.error,
    required this.compartment,
    this.areaTypes = const [],
    this.productGroupTemplates = const [],
    this.speciesGroupTemplates = const [],
    this.groupScheme,
    this.farmId = '',
    this.campId,
    this.isDataReady = false,
    this.isCompartmentNameError = false,
    this.isProductGroupError = false,
    this.isSpeciesGroupError = false,
    this.isEffectiveAreaError = false,
    this.isPlantDateError = false,
    this.compartmentBeforeEdit = const Compartment(),
  });

  final Object? error;
  final bool loading;
  final bool isDataReady;
  final List<AreaType> areaTypes;
  final List<ProductGroupTemplate> productGroupTemplates;
  final List<SpeciesGroupTemplate> speciesGroupTemplates;
  final GroupScheme? groupScheme;
  final String farmId;
  final String? campId;
  final bool isCompartmentNameError;
  final bool isProductGroupError;
  final bool isSpeciesGroupError;
  final bool isEffectiveAreaError;
  final bool isPlantDateError;
  Compartment compartment;
  Compartment compartmentBeforeEdit;

  CompartmentDetailState copyWith({
    bool? loading,
    String? farmId,
    String? campId,
    Object? error,
    Compartment? compartment,
    Compartment? compartmentBeforeEdit,
    List<AreaType>? areaTypes,
    GroupScheme? groupScheme,
    List<ProductGroupTemplate>? productGroupTemplates,
    List<SpeciesGroupTemplate>? speciesGroupTemplates,
    bool? isDataReady,
    bool? isCompartmentNameError,
    bool? isEffectiveAreaError,
  }) {
    return CompartmentDetailState(
      farmId: farmId ?? this.farmId,
      campId: campId ?? this.campId,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      compartment: compartment ?? this.compartment,
      compartmentBeforeEdit:
          compartmentBeforeEdit ?? this.compartmentBeforeEdit,
      areaTypes: areaTypes ?? this.areaTypes,
      productGroupTemplates:
          productGroupTemplates ?? this.productGroupTemplates,
      speciesGroupTemplates:
          speciesGroupTemplates ?? this.speciesGroupTemplates,
      groupScheme: groupScheme ?? this.groupScheme,
      isDataReady: isDataReady ?? this.isDataReady,
      isCompartmentNameError:
          isCompartmentNameError ?? this.isCompartmentNameError,
      isEffectiveAreaError: isEffectiveAreaError ?? this.isEffectiveAreaError,
    );
  }
}
