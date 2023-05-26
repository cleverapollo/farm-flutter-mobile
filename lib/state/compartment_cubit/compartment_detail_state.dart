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
    this.compartment = const Compartment(),
    this.areaTypes = const [],
    this.productGroupTemplates = const [],
    this.speciesGroupTemplates = const [],
    this.groupScheme,
    this.resourceManagerUnit,
  });

  final Object? error;
  final bool loading;
  final List<AreaType> areaTypes;
  final List<ProductGroupTemplate> productGroupTemplates;
  final List<SpeciesGroupTemplate> speciesGroupTemplates;
  final GroupScheme? groupScheme;
  final ResourceManagerUnit? resourceManagerUnit;
  Compartment compartment;

  CompartmentDetailState copyWith(
      {bool? loading,
      Object? error,
      Compartment? compartment,
      List<AreaType>? areaTypes,
      GroupScheme? groupScheme,
      ResourceManagerUnit? resourceManagerUnit,
      List<ProductGroupTemplate>? productGroupTemplates,
      List<SpeciesGroupTemplate>? speciesGroupTemplates}) {
    return CompartmentDetailState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      compartment: compartment ?? this.compartment,
      areaTypes: areaTypes ?? this.areaTypes,
      productGroupTemplates:
          productGroupTemplates ?? this.productGroupTemplates,
      speciesGroupTemplates:
          speciesGroupTemplates ?? this.speciesGroupTemplates,
      groupScheme: groupScheme ?? this.groupScheme,
      resourceManagerUnit: resourceManagerUnit ?? this.resourceManagerUnit,
    );
  }
}
