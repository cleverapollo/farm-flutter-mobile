part of 'aai_detail_cubit.dart';

class AAIDetailState {
  AAIDetailState({
    required this.accidentAndIncident,
    required this.isAddNew,
    this.isDataReady = false,
    this.workers = const [],
    this.jobDescriptions = const [],
    this.natureOfInjuries = const [],
    this.propertyDamaged = const [],
    this.selectedPropertyDamages = const <PropertyDamaged>[],
    this.lostTimeInDay = '',
    this.workerSelect,
    this.jobDescriptionSelect,
    this.natureOfInjurySelect,
    this.isWorkerError = false,
    this.isDateIncidentError = false,
    this.isDateReportedError = false,
  });

  final bool isAddNew;
  final bool isDataReady;
  final String lostTimeInDay;
  final List<FarmerWorker> workers;
  final FarmerWorker? workerSelect;
  final List<WorkerJobDescription> jobDescriptions;
  final WorkerJobDescription? jobDescriptionSelect;
  final List<NatureOfInjury> natureOfInjuries;
  final NatureOfInjury? natureOfInjurySelect;
  final List<PropertyDamaged> propertyDamaged;
  AccidentAndIncident accidentAndIncident;
  final List<PropertyDamaged> selectedPropertyDamages;
  final bool isWorkerError;
  final bool isDateIncidentError;
  final bool isDateReportedError;

  AAIDetailState copyWith({
    AccidentAndIncident? accidentAndIncident,
    String? lostTimeInDay,
    List<FarmerWorker>? workers,
    List<WorkerJobDescription>? jobDescriptions,
    List<NatureOfInjury>? natureOfInjuries,
    List<PropertyDamaged>? propertyDamaged,
    List<PropertyDamaged>? selectedPropertyDamages,
    FarmerWorker? workerSelect,
    WorkerJobDescription? jobDescriptionSelect,
    NatureOfInjury? natureOfInjurySelect,
    bool? isDataReady,
    bool? isWorkerError,
    bool? isDateIncidentError,
    bool? isDateReportedError,
  }) {
    return AAIDetailState(
      accidentAndIncident: accidentAndIncident ?? this.accidentAndIncident,
      workers: workers ?? this.workers,
      jobDescriptions: jobDescriptions ?? this.jobDescriptions,
      natureOfInjuries: natureOfInjuries ?? this.natureOfInjuries,
      propertyDamaged: propertyDamaged ?? this.propertyDamaged,
      selectedPropertyDamages: selectedPropertyDamages ?? this.selectedPropertyDamages,
      isAddNew: isAddNew,
      lostTimeInDay: lostTimeInDay ?? this.lostTimeInDay,
      isDataReady: isDataReady ?? this.isDataReady,
      workerSelect: workerSelect ?? this.workerSelect,
      jobDescriptionSelect: jobDescriptionSelect ?? this.jobDescriptionSelect,
      natureOfInjurySelect: natureOfInjurySelect ?? this.natureOfInjurySelect,
      isWorkerError: isWorkerError ?? this.isWorkerError,
      isDateIncidentError: isDateIncidentError ?? this.isDateIncidentError,
      isDateReportedError: isDateReportedError ?? this.isDateReportedError,
    );
  }
}
