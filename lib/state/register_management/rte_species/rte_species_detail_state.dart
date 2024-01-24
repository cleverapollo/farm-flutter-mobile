part of 'rte_species_detail_cubit.dart';

class RteSpeciesDetailState {
  const RteSpeciesDetailState({
    this.activeFarm,
    this.rteSpecies,
    this.animalTypes = const <AnimalType>[],
    this.speciesRanges = const <SpeciesRange>[],
    this.rtePhotos = const <RteSpeciesRegisterPhoto>[],
    this.removedRtePhotos = const <RteSpeciesRegisterPhoto>[],
    this.groupSchemeMasterSpecies = const <GroupSchemeMasterSpecies>[],
    this.filterGroupSchemeMasterSpecies = const <GroupSchemeMasterSpecies>[],
    this.loading = false,
    this.error,
    this.selectedGroupSchemeMasterSpecies,
  });

  final Farm? activeFarm;
  final RteSpecies? rteSpecies;
  final List<AnimalType> animalTypes;
  final List<SpeciesRange> speciesRanges;
  final List<GroupSchemeMasterSpecies> groupSchemeMasterSpecies;
  final List<GroupSchemeMasterSpecies> filterGroupSchemeMasterSpecies;
  final List<RteSpeciesRegisterPhoto> rtePhotos;
  final List<RteSpeciesRegisterPhoto> removedRtePhotos;
  final GroupSchemeMasterSpecies? selectedGroupSchemeMasterSpecies;
  final Object? error;
  final bool loading;

  RteSpeciesDetailState copyWith({
    RteSpecies? rteSpecies,
    Farm? activeFarm,
    List<AnimalType>? animalTypes,
    List<SpeciesRange>? speciesRanges,
    List<RteSpeciesRegisterPhoto>? rtePhotos,
    List<RteSpeciesRegisterPhoto>? removedRtePhotos,
    List<GroupSchemeMasterSpecies>? groupSchemeMasterSpecies,
    List<GroupSchemeMasterSpecies>? filterGroupSchemeMasterSpecies,
    bool? loading,
    Object? error,
    GroupSchemeMasterSpecies? selectedGroupSchemeMasterSpecies,
  }) {
    return RteSpeciesDetailState(
      loading: loading ?? this.loading,
      activeFarm: activeFarm ?? this.activeFarm,
      rteSpecies: rteSpecies ?? this.rteSpecies,
      animalTypes: animalTypes ?? this.animalTypes,
      speciesRanges: speciesRanges ?? this.speciesRanges,
      groupSchemeMasterSpecies: groupSchemeMasterSpecies ?? this.groupSchemeMasterSpecies,
      filterGroupSchemeMasterSpecies: filterGroupSchemeMasterSpecies ?? this.filterGroupSchemeMasterSpecies,
      rtePhotos: rtePhotos ?? this.rtePhotos,
      error: error ?? this.error,
      removedRtePhotos: removedRtePhotos ?? this.removedRtePhotos,
      selectedGroupSchemeMasterSpecies: selectedGroupSchemeMasterSpecies ?? this.selectedGroupSchemeMasterSpecies,
    );
  }
}
