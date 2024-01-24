part of 'rte_species_cubit.dart';

class RteSpeciesState {
  const RteSpeciesState({
    this.activeFarm,
    this.loading = false,
    this.listRteSpecies = const <RteSpecies>[],
    this.filterRteSpecies = const <RteSpecies>[],
    this.groupSchemeMasterSpecies = const <GroupSchemeMasterSpecies>[],
    this.error,
  });

  final Object? error;
  final bool loading;
  final Farm? activeFarm;
  final List<RteSpecies> listRteSpecies;
  final List<RteSpecies> filterRteSpecies;
  final List<GroupSchemeMasterSpecies> groupSchemeMasterSpecies;

  RteSpeciesState copyWith({
    bool? loading,
    Object? error,
    Farm? activeFarm,
    List<RteSpecies>? listRteSpecies,
    List<RteSpecies>? filterRteSpecies,
    List<GroupSchemeMasterSpecies>? groupSchemeMasterSpecies,
  }) {
    return RteSpeciesState(
      filterRteSpecies: filterRteSpecies ?? this.filterRteSpecies,
      listRteSpecies: listRteSpecies ?? this.listRteSpecies,
      groupSchemeMasterSpecies: groupSchemeMasterSpecies ?? this.groupSchemeMasterSpecies,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      activeFarm: activeFarm ?? this.activeFarm,
    );
  }
}
