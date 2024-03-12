class BaseSyncState {
  const BaseSyncState({
    this.syncMessage,
    this.errorMessageItems = const <String>[],
    this.isLoading = false,
    this.isLoaded = false,
    this.isSyncing = false,
    this.isSyncError = false,
    this.isSynced = false,
  });

  final String? syncMessage;
  final List<String> errorMessageItems;
  final bool isLoading;
  final bool isLoaded;
  final bool isSyncing;
  final bool isSyncError;
  final bool isSynced;
}

class SyncException implements Exception {
  SyncException({
    this.errorMessage,
  }) : super();
  final String? errorMessage;
}

class SyncError extends Error {
  SyncError({
    this.errorMessage,
  }) : super();
  final String? errorMessage;
}
