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
    this.compartment = const Compartment(isActive: true),
    this.areaTypes = const [],
    this.productGroupTemplates = const [],
    this.speciesGroupTemplates = const [],
    this.groupScheme,
    this.farmId = '',
    this.campId,
  });

  final Object? error;
  final bool loading;
  final List<AreaType> areaTypes;
  final List<ProductGroupTemplate> productGroupTemplates;
  final List<SpeciesGroupTemplate> speciesGroupTemplates;
  final GroupScheme? groupScheme;
  final String farmId;
  final String? campId;
  Compartment compartment;

  CompartmentDetailState copyWith({
    bool? loading,
    String? farmId,
    String? campId,
    Object? error,
    Compartment? compartment,
    List<AreaType>? areaTypes,
    GroupScheme? groupScheme,
    List<ProductGroupTemplate>? productGroupTemplates,
    List<SpeciesGroupTemplate>? speciesGroupTemplates,
  }) {
    return CompartmentDetailState(
      farmId: farmId ?? this.farmId,
      campId: campId ?? this.campId,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      compartment: compartment ?? this.compartment,
      areaTypes: areaTypes ?? this.areaTypes,
      productGroupTemplates:
          productGroupTemplates ?? this.productGroupTemplates,
      speciesGroupTemplates:
          speciesGroupTemplates ?? this.speciesGroupTemplates,
      groupScheme: groupScheme ?? this.groupScheme,
    );
  }
}
