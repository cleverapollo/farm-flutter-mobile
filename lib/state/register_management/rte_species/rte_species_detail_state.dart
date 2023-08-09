part of 'rte_species_detail_cubit.dart';

class RteSpeciesDetailState {
  const RteSpeciesDetailState({
    this.activeFarm,
    this.rteSpecies,
    this.animalTypes = const <AnimalType>[],
    this.speciesRanges = const <SpeciesRange>[],
    this.rtePhotos = const <RteSpeciesPhotoModel>[],


    this.listWorkers = const <FarmerWorker>[],
    this.filterWorkers = const <FarmerWorker>[],
    this.listJobDescriptions = const <JobDescription>[],
    this.filterJobDescriptions = const <JobDescription>[],
    this.loading = false,
    this.error,
    this.listWorkerJobDescriptions = const <WorkerJobDescription>[],
  });

  final Farm? activeFarm;
  final RteSpecies? rteSpecies;
  final List<AnimalType> animalTypes;
  final List<SpeciesRange> speciesRanges;
  final List<RteSpeciesPhotoModel> rtePhotos;


  final Object? error;
  final bool loading;
  final List<FarmerWorker> listWorkers;
  final List<FarmerWorker> filterWorkers;
  final List<JobDescription> listJobDescriptions;
  final List<JobDescription> filterJobDescriptions;
  final List<WorkerJobDescription> listWorkerJobDescriptions;

  RteSpeciesDetailState copyWith({
    RteSpecies? rteSpecies,
    Farm? activeFarm,
    List<AnimalType>? animalTypes,
    List<SpeciesRange>? speciesRanges,
    List<RteSpeciesPhotoModel>? rtePhotos,

    bool? loading,
    Object? error,
    List<FarmerWorker>? listWorkers,
    List<FarmerWorker>? filterWorkers,
    List<JobDescription>? listJobDescriptions,
    List<JobDescription>? filterJobDescriptions,
    List<WorkerJobDescription>? listWorkerJobDescriptions,
  }) {
    return RteSpeciesDetailState(
      loading: loading ?? this.loading,
      activeFarm: activeFarm ?? this.activeFarm,
      rteSpecies: rteSpecies ?? this.rteSpecies,
      animalTypes: animalTypes ?? this.animalTypes,
      speciesRanges: speciesRanges ?? this.speciesRanges,
      rtePhotos: rtePhotos ?? this.rtePhotos,


      listWorkers: listWorkers ?? this.listWorkers,
      filterWorkers: filterWorkers ?? this.filterWorkers,
      error: error ?? this.error,
      listJobDescriptions: listJobDescriptions ?? this.listJobDescriptions,
      filterJobDescriptions:
      filterJobDescriptions ?? this.filterJobDescriptions,
      listWorkerJobDescriptions:
      listWorkerJobDescriptions ?? this.listWorkerJobDescriptions,
    );
  }
}
