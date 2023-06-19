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
    this.selectedAuditTemplate,
    this.selectedFarm,
    this.selectedCompartment,
  });

  final bool loading;
  final Object? error;
  final Assessment? data;
  final Map<String, dynamic>? cacheCreateData;
  final List<AuditTemplate> auditTemplates;
  final List<Compartment> compartments;
  final List<Farm> farms;
  final Farm? selectedFarm;
  final AuditTemplate? selectedAuditTemplate;
  final Compartment? selectedCompartment;

  AuditState copyWith({
    bool? loading,
    Object? error,
    Assessment? data,
    Map<String, dynamic>? cacheCreateData,
    List<AuditTemplate>? auditTemplates,
    List<Compartment>? compartments,
    List<Farm>? farms,
    Farm? selectedFarm,
    AuditTemplate? selectedAuditTemplate,
    Compartment? selectedCompartment,
  }) {
    return AuditState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      data: data ?? this.data,
      cacheCreateData: cacheCreateData ?? this.cacheCreateData,
      auditTemplates: auditTemplates ?? this.auditTemplates,
      compartments: compartments ?? this.compartments,
      farms: farms ?? this.farms,
      selectedAuditTemplate: selectedAuditTemplate ?? this.selectedAuditTemplate,
      selectedCompartment: selectedCompartment ?? this.selectedCompartment,
      selectedFarm: selectedFarm ?? this.selectedFarm,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        error,
        data,
        cacheCreateData,
        farms,
        compartments,
        auditTemplates,
        selectedFarm,
        selectedCompartment,
        selectedAuditTemplate,
        Json.tryEncode(cacheCreateData),
      ];
}
