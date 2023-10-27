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
    this.unsyncedAudit = 0,
    this.totalAudits = 0,
    this.unsyncedFarm = 0,
    this.totalFarms = 0,
    this.auditTemplates = 0,
    this.compliances = 0,
    this.criteria = 0,
    this.farmMemberObjectives = 0,
    this.farmObjectivesOptions = 0,
    this.farmPropertyOwnershipTypes = 0,
    this.groupScheme = 0,
    this.impactCaused = 0,
    this.impactOn = 0,
    this.indicators = 0,
    this.principle = 0,
    this.question = 0,
    this.resourceManagementUnits = 0,
    this.rejectReasons = 0,
    this.riskProfileQuestions = 0,
    this.severity = 0,
    this.unsyncedStakeholders = 0,
    this.stakeholderTypes = 0,
    this.totalStakeholders = 0,
    this.totalUnsynced = 0,
    this.totalSynced = 0,
  });

  int unsyncedAudit = 0;
  int totalAudits = 0;
  int unsyncedFarm = 0;
  int totalFarms = 0;
  int auditTemplates = 0;
  int compliances = 0;
  int criteria = 0;
  int farmMemberObjectives = 0;
  int farmObjectivesOptions = 0;
  int farmPropertyOwnershipTypes = 0;
  int groupScheme = 0;
  int impactCaused = 0;
  int impactOn = 0;
  int indicators = 0;
  int principle = 0;
  int question = 0;
  int resourceManagementUnits = 0;
  int rejectReasons = 0;
  int riskProfileQuestions = 0;
  int severity = 0;
  int totalStakeholders = 0;
  int unsyncedStakeholders = 0;
  int stakeholderTypes = 0;
  int totalUnsynced = 0;
  int totalSynced = 0;
}
