part of 'farmer_sync_cubit.dart';

class FarmerSyncState extends BaseSyncState {
  FarmerSyncState({super.syncMessage});

  FarmerSyncState copyWith({
    String? syncMessage,
  }) {
    return FarmerSyncState(syncMessage: syncMessage ?? this.syncMessage);
  }
}
