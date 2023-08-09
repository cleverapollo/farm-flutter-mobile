import 'package:cmo/model/asi.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cmo/extensions/extensions.dart';

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
    @Default(false) bool isSectionCollapse,
    String? campName,
    String? protectedArea,
    String? cattlePostHousing,
    String? corridors,
    String? roadAndFireBreaks,
    String? poachingAlleviationZone,
    String? rangeLand,
    String? convertedToGrassland,
  }) = _AddCampAreaMetricsSectionState;
}

extension AddCampAreaMetricsSectionStateExtension on AddCampAreaMetricsSectionState {
  bool get isComplete {
    return campName.isNotBlank &&
        protectedArea.isNotBlank &&
        cattlePostHousing.isNotBlank &&
        corridors.isNotBlank &&
        roadAndFireBreaks.isNotBlank &&
        poachingAlleviationZone.isNotBlank &&
        rangeLand.isNotBlank &&
        convertedToGrassland.isNotBlank;
  }

  double get totalHectares =>
      (double.tryParse(protectedArea ?? '') ?? 0) +
      (double.tryParse(cattlePostHousing ?? '') ?? 0) +
      (double.tryParse(corridors ?? '') ?? 0) +
      (double.tryParse(roadAndFireBreaks ?? '') ?? 0) +
      (double.tryParse(poachingAlleviationZone ?? '') ?? 0) +
      (double.tryParse(rangeLand ?? '') ?? 0) +
      (double.tryParse(convertedToGrassland ?? '') ?? 0);
}

@freezed
class AddCampActualSectionState with _$AddCampActualSectionState {
  const factory AddCampActualSectionState({
    @Default(true) bool isSectionCollapse,
  }) = _AddCampActualSectionState;
}

@freezed
class AddCampInfestationDetailsState with _$AddCampInfestationDetailsState {
  const factory AddCampInfestationDetailsState({
    @Default(true) bool isSectionCollapse,
    @Default(0) double unAllocatePercent
  }) = _AddCampInfestationDetailsState;
}

extension AddCampInfestationDetailsStateExtension on AddCampInfestationDetailsState {
  bool isComplete(Camp camp) {
    return camp.infestationCategory1 != null &&
        camp.infestationCategory2 != null &&
        camp.infestationCategory3 != null &&
        camp.infestationCategory4 != null &&
        camp.infestationCategory5 != null;
  }
}