part of 'add_aai_cubit.dart';

class AddAAIState {
  AddAAIState({
    required this.accidentAndIncident,
    required this.isAddNew,
    this.isDataReady = false,
    this.workers = const [],
    this.jobDescriptions = const [],
    this.natureOfInjuries = const [],
    this.propertyDamaged = const [],
    this.lostTimeInDay = '',
    this.workerSelect,
    this.jobDescriptionSelect,
    this.natureOfInjurySelect,
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

  AddAAIState copyWith({
    AccidentAndIncident? accidentAndIncident,
    String? lostTimeInDay,
    List<FarmerWorker>? workers,
    List<WorkerJobDescription>? jobDescriptions,
    List<NatureOfInjury>? natureOfInjuries,
    List<PropertyDamaged>? propertyDamaged,
    FarmerWorker? workerSelect,
    WorkerJobDescription? jobDescriptionSelect,
    NatureOfInjury? natureOfInjurySelect,
    bool? isDataReady,
  }) {
    return AddAAIState(
      accidentAndIncident: accidentAndIncident ?? this.accidentAndIncident,
      workers: workers ?? this.workers,
      jobDescriptions: jobDescriptions ?? this.jobDescriptions,
      natureOfInjuries: natureOfInjuries ?? this.natureOfInjuries,
      propertyDamaged: propertyDamaged ?? this.propertyDamaged,
      isAddNew: isAddNew,
      lostTimeInDay: lostTimeInDay ?? this.lostTimeInDay,
      isDataReady: isDataReady ?? this.isDataReady,
      workerSelect: workerSelect ?? this.workerSelect,
      jobDescriptionSelect: jobDescriptionSelect ?? this.jobDescriptionSelect,
      natureOfInjurySelect: natureOfInjurySelect ?? this.natureOfInjurySelect,
    );
  }
}
