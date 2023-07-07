import 'package:cmo/model/camp.dart';
import 'package:cmo/model/chemical.dart';
import 'package:cmo/model/chemical_application_method/chemical_application_method.dart';
import 'package:cmo/model/chemical_type/chemical_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_management_chemical_state.freezed.dart';

@freezed
class RMChemicalState with _$RMChemicalState {
  const factory RMChemicalState({
    String? farmId,
    int? groupSchemeId,
    @Default(false) bool isLoading,
    @Default(true) bool isOpen,
    @Default([]) List<ChemicalType> chemicalTypes,
    @Default([]) List<ChemicalApplicationMethod> chemicalApplicationMethods,
    @Default([]) List<Camp> camps,
    Camp? campSelect,
    ChemicalType? chemicalTypeSelect,
    ChemicalApplicationMethod? chemicalApplicationMethodSelect,
    @Default(Chemical()) Chemical chemical,
    @Default(<Chemical>[]) List<Chemical> chemicals,
    @Default(<Chemical>[]) List<Chemical> chemicalsSearch,
  }) = _RMChemicalState;
}
