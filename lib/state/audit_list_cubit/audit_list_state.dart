part of 'audit_list_cubit.dart';

class AuditListState {
  const AuditListState({
    this.dataIncomplete = const <Audit>[],
    this.dataCompleted = const <Audit>[],
    this.dataSynced = const <Audit>[],
    this.loadingStarted = false,
    this.loadingCompleted = false,
    this.loadingSynced = false,
    this.indexTab = 0,
    this.error,
  });

  final bool loadingStarted;
  final bool loadingCompleted;
  final bool loadingSynced;
  final Object? error;
  final int indexTab;

  final List<Audit> dataIncomplete;
  final List<Audit> dataCompleted;
  final List<Audit> dataSynced;

  AuditListState copyWith({
    bool? loadingStarted,
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
      loadingStarted: loadingStarted ?? this.loadingStarted,
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
