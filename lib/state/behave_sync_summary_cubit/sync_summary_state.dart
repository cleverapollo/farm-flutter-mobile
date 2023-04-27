
import '../../model/sync_summary_model.dart';

class SyncSummaryState {
  SyncSummaryState({
    this.isLoading = false,
    this.dataLoaded = false,
    this.isLoadingSync = false,
    this.syncMessage = '',
    this.data,
    this.countInProgress = 0,
    this.countUnSynced = 0,
  });

  final bool isLoading;
  final bool dataLoaded;
  final bool isLoadingSync;
  final num countInProgress;
  final num countUnSynced;
  final String syncMessage;

  SyncSummaryModel? data;

  SyncSummaryState copyWith({
    bool? isLoading,
    bool? dataLoaded,
    bool? isLoadingSync,
    String? syncMessage,
    SyncSummaryModel? data,
    num? countInProgress,
    num? countUnSynced,
  }) {
    return SyncSummaryState(
      countInProgress: countInProgress ?? this.countInProgress,
      countUnSynced: countUnSynced ?? this.countUnSynced,
      isLoadingSync: isLoadingSync ?? this.isLoadingSync,
      syncMessage: syncMessage ?? this.syncMessage,
      isLoading: isLoading ?? this.isLoading,
      dataLoaded: dataLoaded ?? this.dataLoaded,
      data: SyncSummaryModel(
        adInprogress: data?.adInprogress ?? this.data?.adInprogress,
        adUnsynced: data?.adUnsynced ?? this.data?.adUnsynced,
        schedulerUpcommingEvent:
            data?.schedulerUpcommingEvent ?? this.data?.schedulerUpcommingEvent,
        mdCompany: data?.mdCompany ?? this.data?.mdCompany,
        mdQuestion: data?.mdQuestion ?? this.data?.mdQuestion,
        mdWoker: data?.mdWoker ?? this.data?.mdWoker,
        mdUnsyncWoker: data?.mdUnsyncWoker ?? this.data?.mdUnsyncWoker,
        mdTeam: data?.mdTeam ?? this.data?.mdTeam,
        mdRejectReason: data?.mdRejectReason ?? this.data?.mdRejectReason,
        mdPlantation: data?.mdPlantation ?? this.data?.mdPlantation,
        mdContractor: data?.mdContractor ?? this.data?.mdContractor,
        mdJobCategory: data?.mdJobCategory ?? this.data?.mdJobCategory,
        mdJobDescription: data?.mdJobDescription ?? this.data?.mdJobDescription,
        mdElement: data?.mdElement ?? this.data?.mdElement,
        mdPdca: data?.mdPdca ?? this.data?.mdPdca,
        mdSeverity: data?.mdSeverity ?? this.data?.mdSeverity,
        mdSpeqs: data?.mdSpeqs ?? this.data?.mdSpeqs,
        mdCompliance: data?.mdCompliance ?? this.data?.mdCompliance,
        mdMmm: data?.mdMmm ?? this.data?.mdMmm,
        mdImpactCaused: data?.mdImpactCaused ?? this.data?.mdImpactCaused,
        mdImpactOn: data?.mdImpactOn ?? this.data?.mdImpactOn,
        mdUnit: data?.mdUnit ?? this.data?.mdUnit,
        mdProvince: data?.mdProvince ?? this.data?.mdProvince,
        mdMunicipality: data?.mdMunicipality ?? this.data?.mdMunicipality,
        mdScheduleActivity:
            data?.mdScheduleActivity ?? this.data?.mdScheduleActivity,
        mdTrainingProvider:
            data?.mdTrainingProvider ?? this.data?.mdTrainingProvider,
        mdCourse: data?.mdCourse ?? this.data?.mdCourse,
      ),
    );
  }
}
