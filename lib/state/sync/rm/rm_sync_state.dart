part of 'rm_sync_cubit.dart';

class RMSyncState extends BaseSyncState {
  GroupScheme? groupScheme;
  ResourceManagerUnit? rmUnit;

  RMSyncState(
      {this.groupScheme,
      this.rmUnit,
      super.syncMessage,
      super.isLoading,
      super.isLoaded});

  RMSyncState copyWith(
      {String? syncMessage,
      bool? isLoading,
      bool? isLoaded,
      GroupScheme? groupScheme,
      ResourceManagerUnit? rmUnit}) {
    return RMSyncState(
        syncMessage: syncMessage ?? this.syncMessage,
        isLoading: isLoading ?? this.isLoading,
        isLoaded: isLoaded ?? this.isLoaded,
        groupScheme: groupScheme ?? this.groupScheme,
        rmUnit: rmUnit ?? this.rmUnit);
  }
}
