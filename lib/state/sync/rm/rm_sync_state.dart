part of 'rm_sync_cubit.dart';

class RMSyncState extends BaseSyncState {
  RMSyncState({super.syncMessage});

  RMSyncState copyWith({
    String? syncMessage,
  }) {
    return RMSyncState(syncMessage: syncMessage ?? this.syncMessage);
  }
}
