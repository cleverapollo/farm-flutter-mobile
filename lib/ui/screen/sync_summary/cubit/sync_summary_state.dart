import 'package:cmo/ui/screen/sync_summary/cubit/sync_summary_cubit.dart';

class SyncSummaryState {
  SyncSummaryState({
    this.isLoading = false,
    this.dataLoaded = false,
    this.data,
  });

  final bool isLoading;
  final bool dataLoaded;
  SyncSummaryData? data;

  SyncSummaryState copyWith({
    bool? isLoading,
    bool? dataLoaded,
    num? adInprogress,
    num? adUnsynced,
    num? schedulerUpcommingEvent,
    num? mdCompany,
    num? mdQuestion,
    num? mdWoker,
    num? mdUnsyncWoker,
    num? mdTeam,
    num? mdRejetReason,
    num? mdPlantation,
    num? mdContractor,
    num? mdJobCategory,
    num? mdJobDescription,
    num? mdElement,
    num? mdPdca,
    num? mdSeverity,
    num? mdSpeqs,
    num? mdCompliance,
    num? mdMmm,
    num? mdImpactCaused,
    num? mdImpactOn,
    num? mdUnit,
    num? mdProvince,
    num? mdMunicipality,
    num? mdScheduleActivity,
    num? mdTrainingProvider,
    num? mdCourse,
  }) {
    return SyncSummaryState(
      isLoading: isLoading ?? this.isLoading,
      dataLoaded: dataLoaded ?? this.dataLoaded,
      data: SyncSummaryData(
        adInprogress: adInprogress ?? data?.adInprogress,
        adUnsynced: adUnsynced ?? data?.adUnsynced,
        schedulerUpcommingEvent:
            schedulerUpcommingEvent ?? data?.schedulerUpcommingEvent,
        mdCompany: mdCompany ?? data?.mdCompany,
        mdQuestion: mdQuestion ?? data?.mdQuestion,
        mdWoker: mdWoker ?? data?.mdWoker,
        mdUnsyncWoker: mdUnsyncWoker ?? data?.mdUnsyncWoker,
        mdTeam: mdTeam ?? data?.mdTeam,
        mdRejetReason: mdRejetReason ?? data?.mdRejetReason,
        mdPlantation: mdPlantation ?? data?.mdPlantation,
        mdContractor: mdContractor ?? data?.mdContractor,
        mdJobCategory: mdJobCategory ?? data?.mdJobCategory,
        mdJobDescription: mdJobDescription ?? data?.mdJobDescription,
        mdElement: mdElement ?? data?.mdElement,
        mdPdca: mdPdca ?? data?.mdPdca,
        mdSeverity: mdSeverity ?? data?.mdSeverity,
        mdSpeqs: mdSpeqs ?? data?.mdSpeqs,
        mdCompliance: mdCompliance ?? data?.mdCompliance,
        mdMmm: mdMmm ?? data?.mdMmm,
        mdImpactCaused: mdImpactCaused ?? data?.mdImpactCaused,
        mdImpactOn: mdImpactOn ?? data?.mdImpactOn,
        mdUnit: mdUnit ?? data?.mdUnit,
        mdProvince: mdProvince ?? data?.mdProvince,
        mdMunicipality: mdMunicipality ?? data?.mdMunicipality,
        mdScheduleActivity: mdScheduleActivity ?? data?.mdScheduleActivity,
        mdTrainingProvider: mdTrainingProvider ?? data?.mdTrainingProvider,
        mdCourse: mdCourse ?? data?.mdCourse,
      ),
    );
  }
}
