part of 'farmer_sync_onboarding_cubit.dart';

class FarmerSyncOnboardingState extends BaseSyncState {
  Farm? farm;

  FarmerSyncOnboardingState({
    this.farm,
    super.syncMessage,
    super.isLoading,
    super.isLoaded,
  });

  FarmerSyncOnboardingState copyWith({
    String? syncMessage,
    bool? isLoading,
    bool? isLoaded,
    Farm? farm,
  }) {
    return FarmerSyncOnboardingState(
      syncMessage: syncMessage ?? this.syncMessage,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      farm: farm ?? this.farm,
    );
  }
}
