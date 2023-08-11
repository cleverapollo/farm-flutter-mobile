part of 'register_management_cubit.dart';

class RegisterManagementState {
  RegisterManagementState({
    this.accidentIncidents = 0,
    this.asi = 0,
    this.biologicalControlAgents = 0,
    this.chemicals = 0,
    this.disciplinaries = 0,
    this.employeeGrievance = 0,
    this.fire = 0,
    this.pestsDiseases = 0,
    this.rteSpecies = 0,
    this.stakeholderComplaints = 0,
    this.stakeholderManagement = 0,
    this.training = 0,
    this.isDataReady = false,
  });

  final bool isDataReady;
  final int accidentIncidents;
  final int asi;
  final int biologicalControlAgents;
  final int chemicals;
  final int disciplinaries;
  final int employeeGrievance;
  final int fire;
  final int pestsDiseases;
  final int rteSpecies;
  final int stakeholderComplaints;
  final int stakeholderManagement;
  final int training;

  RegisterManagementState copyWith({
    bool? isDataReady,
    int? accidentIncidents,
    int? asi,
    int? biologicalControlAgents,
    int? chemicals,
    int? disciplinaries,
    int? employeeGrievance,
    int? fire,
    int? pestsDiseases,
    int? rteSpecies,
    int? stakeholderComplaints,
    int? stakeholderManagement,
    int? training,
  }) {
    return RegisterManagementState(
      isDataReady: isDataReady ?? this.isDataReady,
      accidentIncidents: accidentIncidents ?? this.accidentIncidents,
      asi: asi ?? this.asi,
      biologicalControlAgents:
      biologicalControlAgents ?? this.biologicalControlAgents,
      chemicals: chemicals ?? this.chemicals,
      disciplinaries: disciplinaries ?? this.disciplinaries,
      employeeGrievance: employeeGrievance ?? this.employeeGrievance,
      fire: fire ?? this.fire,
      pestsDiseases: pestsDiseases ?? this.pestsDiseases,
      rteSpecies: rteSpecies ?? this.rteSpecies,
      stakeholderComplaints:
      stakeholderComplaints ?? this.stakeholderComplaints,
      stakeholderManagement:
      stakeholderManagement ?? this.stakeholderManagement,
      training: training ?? this.training,
    );
  }
}
