part of 'rm_sync_cubit.dart';

class RMSyncState extends BaseSyncState {
  RMSyncState({super.syncMessage, super.isLoading, super.isLoaded});

  RMSyncState copyWith({
    String? syncMessage,
    bool? isLoading,
    bool? isLoaded,
  }) {
    return RMSyncState(
        syncMessage: syncMessage ?? this.syncMessage,
        isLoading: isLoading ?? this.isLoading,
        isLoaded: isLoaded ?? this.isLoaded);
  }
}
