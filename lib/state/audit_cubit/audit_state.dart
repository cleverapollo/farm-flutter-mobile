part of 'audit_cubit.dart';

class AuditState extends Equatable {
  const AuditState({
    this.loading = false,
    this.error,
    this.data,
    this.cacheCreateData,
    this.auditTemplates = const <AuditTemplate>[],
    this.compartments = const <Compartment>[],
    this.farms = const <Farm>[],
    this.filterFarms = const <Farm>[],
    this.selectedAuditTemplate,
    this.selectedFarm,
    this.selectedCompartment,
    this.isPrepopulateAudit = false,
    this.prepopulateAudit,
  });

  final bool loading;
  final Object? error;
  final Assessment? data;
  final Map<String, dynamic>? cacheCreateData;
  final List<AuditTemplate> auditTemplates;
  final List<Compartment> compartments;
  final List<Farm> farms;
  final List<Farm> filterFarms;
  final Farm? selectedFarm;
  final AuditTemplate? selectedAuditTemplate;
  final Compartment? selectedCompartment;
  final bool isPrepopulateAudit;
  final Audit? prepopulateAudit;

  AuditState copyWith({
    bool? loading,
    Object? error,
    Assessment? data,
    Map<String, dynamic>? cacheCreateData,
    List<AuditTemplate>? auditTemplates,
    List<Compartment>? compartments,
    List<Farm>? farms,
    List<Farm>? filterFarms,
    Farm? selectedFarm,
    AuditTemplate? selectedAuditTemplate,
    Compartment? selectedCompartment,
    bool? isPrepopulateAudit,
    Audit? prepopulateAudit,
  }) {
    return AuditState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      data: data ?? this.data,
      cacheCreateData: cacheCreateData ?? this.cacheCreateData,
      auditTemplates: auditTemplates ?? this.auditTemplates,
      compartments: compartments ?? this.compartments,
      farms: farms ?? this.farms,
      filterFarms: filterFarms ?? this.filterFarms,
      selectedAuditTemplate: selectedAuditTemplate ?? this.selectedAuditTemplate,
      selectedCompartment: selectedCompartment ?? this.selectedCompartment,
      selectedFarm: selectedFarm ?? this.selectedFarm,
      isPrepopulateAudit: isPrepopulateAudit ?? this.isPrepopulateAudit,
      prepopulateAudit: prepopulateAudit ?? this.prepopulateAudit,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        error,
        data,
        cacheCreateData,
        farms,
        filterFarms,
        compartments,
        auditTemplates,
        selectedFarm,
        selectedCompartment,
        selectedAuditTemplate,
        Json.tryEncode(cacheCreateData),
        isPrepopulateAudit,
        prepopulateAudit,
      ];
}

extension AuditStateX on AuditState {
  bool get canSave {
    return selectedAuditTemplate != null && selectedFarm != null;
  }

  String get getSubTitleAudit {
    if(selectedCompartment != null) return selectedCompartment?.unitNumber ?? '';

    return selectedFarm?.farmName ?? '';
  }
}