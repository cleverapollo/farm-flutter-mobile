part of 'aai_cubit.dart';

class AAIState {
  const AAIState({
    this.filteredItems = const [],
    this.items = const [],
    this.isLoading = false,
    this.statusFilter = StatusFilterEnum.open,
    this.farmerWorkers = const <FarmerWorker>[],
    this.jobDescriptions = const <JobDescription>[],
    this.natureOfInjuries = const <NatureOfInjury>[],
    this.inputSearch,
  });

  final List<AccidentAndIncident> filteredItems;
  final List<AccidentAndIncident> items;
  final bool isLoading;
  final StatusFilterEnum statusFilter;
  final List<FarmerWorker> farmerWorkers;
  final List<JobDescription> jobDescriptions;
  final List<NatureOfInjury> natureOfInjuries;
  final String? inputSearch;

  AAIState copyWith({
    List<AccidentAndIncident>? filteredItems,
    List<AccidentAndIncident>? items,
    List<FarmerWorker>? farmerWorkers,
    List<JobDescription>? jobDescriptions,
    List<NatureOfInjury>? natureOfInjuries,
    bool? isLoading,
    StatusFilterEnum? statusFilter,
    String? inputSearch,
  }) {
    return AAIState(
      filteredItems: filteredItems ?? this.filteredItems,
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      farmerWorkers: farmerWorkers ?? this.farmerWorkers,
      statusFilter: statusFilter ?? this.statusFilter,
      inputSearch: inputSearch ?? this.inputSearch,
      natureOfInjuries: natureOfInjuries ?? this.natureOfInjuries,
      jobDescriptions: jobDescriptions ?? this.jobDescriptions,
    );
  }
}
