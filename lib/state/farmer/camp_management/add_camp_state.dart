import 'package:cmo/model/asi.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_camp_state.freezed.dart';

class AddCampState {
  AddCampState({
    this.loading = false,
    this.camp,
    this.farm,
    this.compartments = const [],
    this.asis = const [],
    this.addCampAreaMetricsSectionState = const AddCampAreaMetricsSectionState(),
    this.addCampActualSectionState = const AddCampActualSectionState(),
    this.addCampInfestationDetailsState = const AddCampInfestationDetailsState(),
  });

  final bool loading;
  final Camp? camp;
  final Farm? farm;
  final List<Compartment> compartments;
  final List<Asi> asis;
  final AddCampAreaMetricsSectionState addCampAreaMetricsSectionState;
  final AddCampActualSectionState addCampActualSectionState;
  final AddCampInfestationDetailsState addCampInfestationDetailsState;

  AddCampState copyWith({
    bool? loading,
    Camp? camp,
    Farm? farm,
    List<Compartment>? compartments,
    List<Asi>? asis,
    AddCampAreaMetricsSectionState? addCampAreaMetricsSectionState,
    AddCampActualSectionState? addCampActualSectionState,
    AddCampInfestationDetailsState? addCampInfestationDetailsState,
  }) {
    return AddCampState(
      loading: loading ?? this.loading,
      camp: camp ?? this.camp,
      farm: farm ?? this.farm,
      compartments: compartments ?? this.compartments,
      asis: asis ?? this.asis,
      addCampAreaMetricsSectionState: addCampAreaMetricsSectionState ?? this.addCampAreaMetricsSectionState,
      addCampActualSectionState: addCampActualSectionState ?? this.addCampActualSectionState,
      addCampInfestationDetailsState: addCampInfestationDetailsState ?? this.addCampInfestationDetailsState,
    );
  }
}

@freezed
class AddCampAreaMetricsSectionState with _$AddCampAreaMetricsSectionState {
  const factory AddCampAreaMetricsSectionState({
    @Default(false) bool isComplete,
    @Default(false) bool isSectionCollapse,

  }) = _AddCampAreaMetricsSectionState;
}

@freezed
class AddCampActualSectionState with _$AddCampActualSectionState {
  const factory AddCampActualSectionState({
    @Default(false) bool isComplete,
    @Default(false) bool isSectionCollapse,
    String? signatureImage,
    String? signaturePoints,
    String? signatureDate,
  }) = _AddCampActualSectionState;
}

@freezed
class AddCampInfestationDetailsState with _$AddCampInfestationDetailsState {
  const factory AddCampInfestationDetailsState({
    @Default(false) bool isComplete,
    @Default(false) bool isSectionCollapse,
    @Default(0) double unAllocatePercent
  }) = _AddCampInfestationDetailsState;
}
