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
  });

  final bool isAddNew;
  final bool isDataReady;
  final String lostTimeInDay;
  final List<FarmerWorker> workers;
  final List<WorkerJobDescription> jobDescriptions;
  final List<NatureOfInjury> natureOfInjuries;
  final List<PropertyDamaged> propertyDamaged;
  AccidentAndIncident accidentAndIncident;

  AddAAIState copyWith({
    AccidentAndIncident? accidentAndIncident,
    String? lostTimeInDay,
    List<FarmerWorker>? workers,
    List<WorkerJobDescription>? jobDescriptions,
    List<NatureOfInjury>? natureOfInjuries,
    List<PropertyDamaged>? propertyDamaged,
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
    );
  }
}
