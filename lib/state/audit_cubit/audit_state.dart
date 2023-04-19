part of 'audit_cubit.dart';

class AuditState extends Equatable {
  const AuditState({
    this.loading = false,
    this.error,
    this.data,
    this.cacheCreateData,
    this.auditTemplates = const <AuditTemplate>[],
    this.compartments = const <Compartment>[],
    this.sites = const <Site>[],
    this.selectedAuditTemplateName,
    this.selectedSiteName,
    this.selectedCompartmentName,
  });

  final bool loading;
  final Object? error;
  final Assessment? data;
  final Map<String, dynamic>? cacheCreateData;
  final List<AuditTemplate> auditTemplates;
  final List<Compartment> compartments;
  final List<Site> sites;
  final String? selectedSiteName;
  final String? selectedAuditTemplateName;
  final String? selectedCompartmentName;

  AuditState copyWith({
    bool? loading,
    Object? error,
    Assessment? data,
    Map<String, dynamic>? cacheCreateData,
    List<AuditTemplate>? auditTemplates,
    List<Compartment>? compartments,
    List<Site>? sites,
    String? selectedSiteName,
    String? selectedAuditTemplateName,
    String? selectedCompartmentName,
  }) {
    return AuditState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      data: data ?? this.data,
      cacheCreateData: cacheCreateData ?? this.cacheCreateData,
      auditTemplates: auditTemplates ?? this.auditTemplates,
      compartments: compartments ?? this.compartments,
      sites: sites ?? this.sites,
      selectedAuditTemplateName: selectedAuditTemplateName ?? this.selectedAuditTemplateName,
      selectedCompartmentName: selectedCompartmentName ?? this.selectedCompartmentName,
      selectedSiteName: selectedSiteName ?? this.selectedSiteName,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        error,
        data,
        cacheCreateData,
        sites,
        compartments,
        auditTemplates,
        selectedSiteName,
        selectedCompartmentName,
        selectedAuditTemplateName,
        Json.tryEncode(cacheCreateData),
      ];
}
