part of 'audit_list_cubit.dart';

class AuditListState {
  const AuditListState({
    this.filterAudits = const <Audit>[],
    this.listAudits = const <Audit>[],
    this.loading = false,
    this.indexTab = 0,
    this.resourceManagerUnit,
    this.error,
  });

  final bool loading;
  final List<Audit> listAudits;
  final List<Audit> filterAudits;
  final Object? error;
  final int indexTab;
  final ResourceManagerUnit? resourceManagerUnit;

  AuditListState copyWith({
    bool? loading,
    List<Audit>? listAudits,
    List<Audit>? filterAudits,
    Object? error,
    int? indexTab,
    Map<String, dynamic>? cacheCreateData,
    ResourceManagerUnit? resourceManagerUnit,
  }) {
    return AuditListState(
      loading: loading ?? this.loading,
      listAudits: listAudits ?? this.listAudits,
      filterAudits: filterAudits ?? this.filterAudits,
      error: error ?? this.error,
      indexTab: indexTab ?? this.indexTab,
      resourceManagerUnit: resourceManagerUnit ?? this.resourceManagerUnit,
    );
  }
}
