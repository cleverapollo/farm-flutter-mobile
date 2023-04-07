import 'package:cmo/ui/screen/sync_summary/cubit/sync_summary_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../di.dart';

class SyncSummaryCubit extends Cubit<SyncSummaryState> {
  SyncSummaryCubit() : super(SyncSummaryState()) {
    initData();
  }

  final _databaseService = cmoDatabaseMasterService;

  var data = SyncSummaryData();

  Future<void> initData() async {
    emit(state.copyWith(isLoading: true));

    await _databaseService.db.then((value) async {
      final futures = <Future<dynamic>>[];

      futures
        ..add(_databaseService
            .getWorkersLocal()
            .then((value) => data.mdUnsyncWoker = value.length))
        ..add(_databaseService
            .getCompliances()
            .then((value) => data.mdCompliance = value.length))
        ..add(_databaseService
            .getPlantations()
            .then((value) => data.mdPlantation = value.length))
        ..add(_databaseService
            .getUnits()
            .then((value) => data.mdUnit = value.length))
        ..add(_databaseService
            .getContractors()
            .then((value) => data.mdContractor = value.length))
        ..add(_databaseService
            .getProvinces()
            .then((value) => data.mdProvince = value.length))
        ..add(_databaseService
            .getMunicipalitys()
            .then((value) => data.mdMunicipality = value.length))
        ..add(_databaseService
            .getImpactCauseds()
            .then((value) => data.mdImpactCaused = value.length))
        ..add(_databaseService
            .getImpactOns()
            .then((value) => data.mdImpactOn = value.length))
        ..add(_databaseService
            .getJobCategories()
            .then((value) => data.mdJobCategory = value.length))
        ..add(_databaseService
            .getJobDescriptions()
            .then((value) => data.mdJobDescription = value.length))
        ..add(_databaseService
            .getJobElements()
            .then((value) => data.mdElement = value.length))
        ..add(_databaseService
            .getMmms()
            .then((value) => data.mdMmm = value.length))
        ..add(_databaseService
            .getPdcas()
            .then((value) => data.mdPdca = value.length))
        ..add(_databaseService
            .getSpeqss()
            .then((value) => data.mdSpeqs = value.length))
        ..add(_databaseService
            .getTeams()
            .then((value) => data.mdTeam = value.length))
        ..add(_databaseService
            .getTrainingProviders()
            .then((value) => data.mdTrainingProvider = value.length))
        ..add(_databaseService
            .getCourses()
            .then((value) => data.mdCourse = value.length))
        ..add(_databaseService
            .getSchedules()
            .then((value) => data.schedulerUpcommingEvent = value.length))
        ..add(_databaseService
            .getSeveritys()
            .then((value) => data.mdSeverity = value.length))
        ..add(_databaseService
            .getScheduleActivitys()
            .then((value) => data.mdScheduleActivity = value.length))
        ..add(_databaseService
            .getWorkers()
            .then((value) => data.mdWoker = value.length))
        ..add(_databaseService
            .getCompanyQuestions()
            .then((value) => data.mdCompany = value.length));

      await Future.wait(futures).whenComplete(() => emit(state.copyWith(
            isLoading: false,
            dataLoaded: true,
            adInprogress: data.adInprogress,
            adUnsynced: data.adUnsynced,
            schedulerUpcommingEvent: data.schedulerUpcommingEvent,
            mdCompany: data.mdCompany,
            mdQuestion: data.mdQuestion,
            mdWoker: data.mdWoker,
            mdUnsyncWoker: data.mdUnsyncWoker,
            mdTeam: data.mdTeam,
            mdRejetReason: data.mdRejetReason,
            mdPlantation: data.mdPlantation,
            mdContractor: data.mdContractor,
            mdJobCategory: data.mdJobCategory,
            mdJobDescription: data.mdJobDescription,
            mdElement: data.mdElement,
            mdPdca: data.mdPdca,
            mdSeverity: data.mdSeverity,
            mdSpeqs: data.mdSpeqs,
            mdCompliance: data.mdCompliance,
            mdMmm: data.mdMmm,
            mdImpactCaused: data.mdImpactCaused,
            mdImpactOn: data.mdImpactOn,
            mdUnit: data.mdUnit,
            mdProvince: data.mdProvince,
            mdMunicipality: data.mdMunicipality,
            mdScheduleActivity: data.mdScheduleActivity,
            mdTrainingProvider: data.mdTrainingProvider,
            mdCourse: data.mdCourse,
          )));
    });
  }

  Future<void> onSync() async {}
}

class SyncSummaryData {
  SyncSummaryData({
    this.adInprogress,
    this.adUnsynced,
    this.schedulerUpcommingEvent,
    this.mdCompany,
    this.mdQuestion,
    this.mdWoker,
    this.mdUnsyncWoker,
    this.mdTeam,
    this.mdRejetReason,
    this.mdPlantation,
    this.mdContractor,
    this.mdJobCategory,
    this.mdJobDescription,
    this.mdElement,
    this.mdPdca,
    this.mdSeverity,
    this.mdSpeqs,
    this.mdCompliance,
    this.mdMmm,
    this.mdImpactCaused,
    this.mdImpactOn,
    this.mdUnit,
    this.mdProvince,
    this.mdMunicipality,
    this.mdScheduleActivity,
    this.mdTrainingProvider,
    this.mdCourse,
  });

  num? adInprogress;
  num? adUnsynced;
  num? schedulerUpcommingEvent;
  num? mdCompany;
  num? mdQuestion;
  num? mdWoker;
  num? mdUnsyncWoker;
  num? mdTeam;
  num? mdRejetReason;
  num? mdPlantation;
  num? mdContractor;
  num? mdJobCategory;
  num? mdJobDescription;
  num? mdElement;
  num? mdPdca;
  num? mdSeverity;
  num? mdSpeqs;
  num? mdCompliance;
  num? mdMmm;
  num? mdImpactCaused;
  num? mdImpactOn;
  num? mdUnit;
  num? mdProvince;
  num? mdMunicipality;
  num? mdScheduleActivity;
  num? mdTrainingProvider;
  num? mdCourse;
}
