part of 'audit_list_cubit.dart';

class AuditListState {
  const AuditListState({
    this.dataIncomplete = const <Audit>[],
    this.dataCompleted = const <Audit>[],
    this.dataSynced = const <Audit>[],
    this.loadingIncomplete = false,
    this.loadingCompleted = false,
    this.loadingSynced = false,
    this.indexTab = 0,
    this.error,
  });

  final bool loadingIncomplete;
  final bool loadingCompleted;
  final bool loadingSynced;
  final Object? error;
  final int indexTab;

  final List<Audit> dataIncomplete;
  final List<Audit> dataCompleted;
  final List<Audit> dataSynced;

  AuditListState copyWith({
    bool? loadingIncomplete,
    bool? loadingCompleted,
    bool? loadingSynced,
    Object? error,
    int? indexTab,
    List<Audit>? dataIncomplete,
    List<Audit>? dataCompleted,
    List<Audit>? dataSynced,
    Map<String, dynamic>? cacheCreateData,
  }) {
    return AuditListState(
      loadingIncomplete: loadingIncomplete ?? this.loadingIncomplete,
      loadingCompleted: loadingCompleted ?? this.loadingCompleted,
      loadingSynced: loadingSynced ?? this.loadingSynced,
      error: error ?? this.error,
      indexTab: indexTab ?? this.indexTab,
      dataIncomplete: dataIncomplete ?? this.dataIncomplete,
      dataCompleted: dataCompleted ?? this.dataCompleted,
      dataSynced: dataSynced ?? this.dataSynced,
    );
  }
}
