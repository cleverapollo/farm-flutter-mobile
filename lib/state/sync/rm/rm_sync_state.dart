part of 'rm_sync_cubit.dart';

class RMSyncState extends BaseSyncState {
  RMSyncState({
    this.groupScheme,
    this.rmUnit,
    this.rmSyncSummaryInformation,
    this.userInfo,
    super.syncMessage,
    super.errorMessageItems,
    super.isSyncError,
    super.isLoading,
    super.isLoaded,
    super.isSynced,
    super.isSyncing,
  });

  GroupScheme? groupScheme;
  ResourceManagerUnit? rmUnit;
  RmSyncSummaryInformation? rmSyncSummaryInformation;
  UserInfo? userInfo;

  RMSyncState copyWith({
    String? syncMessage,
    bool? isLoading,
    bool? isLoaded,
    bool? isSyncing,
    bool? isSynced,
    bool? isSyncError,
    List<String>? errorMessageItems,
    GroupScheme? groupScheme,
    ResourceManagerUnit? rmUnit,
    RmSyncSummaryInformation? rmSyncSummaryInformation,
    UserInfo? userInfo,
  }) {
    return RMSyncState(
      syncMessage: syncMessage ?? this.syncMessage,
      errorMessageItems: errorMessageItems ?? this.errorMessageItems,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isSyncing: isSyncing ?? this.isSyncing,
      isSyncError: isSyncError ?? this.isSyncError,
      isSynced: isSynced ?? this.isSynced,
      groupScheme: groupScheme ?? this.groupScheme,
      rmUnit: rmUnit ?? this.rmUnit,
      userInfo: userInfo ?? this.userInfo,
      rmSyncSummaryInformation: rmSyncSummaryInformation ?? this.rmSyncSummaryInformation,
    );
  }
}

class RmSyncSummaryInformation {
  RmSyncSummaryInformation({
    this.unsyncedAudit,
    this.totalAudits,
    this.unsyncedFarm,
    this.totalFarms,
    this.auditTemplates,
    this.compliances,
    this.criteria,
    this.farmMemberObjectives,
    this.farmObjectivesOptions,
    this.farmPropertyOwnershipTypes,
    this.groupScheme,
    this.impactCaused,
    this.impactOn,
    this.indicators,
    this.principle,
    this.question,
    this.resourceManagementUnits,
    this.rejectReasons,
    this.riskProfileQuestions,
    this.severity,
    this.unsyncedStakeholders,
    this.stakeholderTypes,
    this.totalStakeholders,
    this.totalUnsynced,
    this.totalSynced,
  });

  int? unsyncedAudit;
  int? totalAudits;
  int? unsyncedFarm;
  int? totalFarms;
  int? auditTemplates;
  int? compliances;
  int? criteria;
  int? farmMemberObjectives;
  int? farmObjectivesOptions;
  int? farmPropertyOwnershipTypes;
  int? groupScheme;
  int? impactCaused;
  int? impactOn;
  int? indicators;
  int? principle;
  int? question;
  int? resourceManagementUnits;
  int? rejectReasons;
  int? riskProfileQuestions;
  int? severity;
  int? totalStakeholders;
  int? unsyncedStakeholders;
  int? stakeholderTypes;
  int? totalUnsynced;
  int? totalSynced;
}
