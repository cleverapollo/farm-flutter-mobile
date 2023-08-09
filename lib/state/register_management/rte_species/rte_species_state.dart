part of 'rte_species_cubit.dart';

class RteSpeciesState {
  const RteSpeciesState({
    this.activeFarm,
    this.loading = false,
    this.listRteSpecies = const <RteSpecies>[],
    this.filterRteSpecies = const <RteSpecies>[],
    this.error,
  });

  final Object? error;
  final bool loading;
  final Farm? activeFarm;
  final List<RteSpecies> listRteSpecies;
  final List<RteSpecies> filterRteSpecies;

  RteSpeciesState copyWith({
    bool? loading,
    Object? error,
    Farm? activeFarm,
    List<RteSpecies>? listRteSpecies,
    List<RteSpecies>? filterRteSpecies,
  }) {
    return RteSpeciesState(
      filterRteSpecies: filterRteSpecies ?? this.filterRteSpecies,
      listRteSpecies: listRteSpecies ?? this.listRteSpecies,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      activeFarm: activeFarm ?? this.activeFarm,
    );
  }
}
