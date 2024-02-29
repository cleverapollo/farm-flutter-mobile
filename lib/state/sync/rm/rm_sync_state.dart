part of 'rm_sync_cubit.dart';

class RMSyncState extends BaseSyncState {
  RMSyncState({
    this.groupScheme,
    this.rmUnit,
    super.syncMessage,
    super.isLoading,
    super.isLoaded,
    this.rmSyncSummaryInformation,
    this.userInfo,
  });

  GroupScheme? groupScheme;
  ResourceManagerUnit? rmUnit;
  RmSyncSummaryInformation? rmSyncSummaryInformation;
  UserInfo? userInfo;

  RMSyncState copyWith({
    String? syncMessage,
    bool? isLoading,
    bool? isLoaded,
    GroupScheme? groupScheme,
    ResourceManagerUnit? rmUnit,
    RmSyncSummaryInformation? rmSyncSummaryInformation,
    UserInfo? userInfo,
  }) {
    return RMSyncState(
      syncMessage: syncMessage ?? this.syncMessage,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      groupScheme: groupScheme ?? this.groupScheme,
      rmUnit: rmUnit ?? this.rmUnit,
      userInfo: userInfo ?? this.userInfo,
      rmSyncSummaryInformation:
          rmSyncSummaryInformation ?? this.rmSyncSummaryInformation,
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
