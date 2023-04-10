import 'package:cmo/di.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/model/sync_summary_model.dart';
import 'package:cmo/model/user_info.dart';
import 'package:cmo/service/cmo_api_service.dart';
import 'package:cmo/state/assessment_cubit/assessment_cubit.dart';
import 'package:cmo/state/sync_summary_cubit/sync_summary_state.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncSummaryCubit extends Cubit<SyncSummaryState> {
  SyncSummaryCubit() : super(SyncSummaryState()) {
    onInitialData();
  }

  final _databaseMasterService = cmoDatabaseMasterService;

  SyncSummaryModel data = const SyncSummaryModel();
  UserInfo? user;
  List<Company>? companies = [];

  Future<void> onInitialData() async {
    data = data.copyWith(adInprogress: 0);
    emit(state.copyWith(isLoading: true, dataLoaded: false));
    try {
      await _databaseMasterService.db.then((value) async {
        final futures = <Future<dynamic>>[];
        user = await CmoApiService().getUser();

        if (user == null) return;

        companies =
            await CmoApiService().getCompaniesByUserId(userId: user!.userId!);

        if ((companies ?? []).isEmpty) return;

        data = data.copyWith(mdCompany: companies?.length);

        final companyId = companies?.first.companyId ?? 0;
        final userId = user!.userId ?? 0;

        futures
          ..add(_databaseMasterService
              .getQuestionByCompanyId(companyId)
              .then((value) => data = data.copyWith(mdQuestion: value.length)))
          ..add(_databaseMasterService
              .getAssessmentTotalsByCompanyIdAndUserId(
                  companyId: companyId, userId: userId)
              .then((value) => data = data.copyWith(adUnsynced: value.length)))
          ..add(_databaseMasterService.getWorkersLocal().then(
              (value) => data = data.copyWith(mdUnsyncWoker: value.length)))
          ..add(_databaseMasterService.getWorkersLocal().then(
              (value) => data = data.copyWith(mdUnsyncWoker: value.length)))
          ..add(_databaseMasterService.getCompliances().then(
              (value) => data = data.copyWith(mdCompliance: value.length)))
          ..add(_databaseMasterService.getPlantations().then(
              (value) => data = data.copyWith(mdPlantation: value.length)))
          ..add(_databaseMasterService
              .getUnits()
              .then((value) => data = data.copyWith(mdUnit: value.length)))
          ..add(_databaseMasterService.getContractors().then(
              (value) => data = data.copyWith(mdContractor: value.length)))
          ..add(_databaseMasterService
              .getProvinces()
              .then((value) => data = data.copyWith(mdProvince: value.length)))
          ..add(_databaseMasterService.getMunicipalitys().then(
              (value) => data = data.copyWith(mdMunicipality: value.length)))
          ..add(_databaseMasterService.getImpactCauseds().then(
              (value) => data = data.copyWith(mdImpactCaused: value.length)))
          ..add(_databaseMasterService
              .getImpactOns()
              .then((value) => data = data.copyWith(mdImpactOn: value.length)))
          ..add(_databaseMasterService.getJobCategories().then(
              (value) => data = data.copyWith(mdJobCategory: value.length)))
          ..add(_databaseMasterService.getJobDescriptions().then(
              (value) => data = data.copyWith(mdJobDescription: value.length)))
          ..add(_databaseMasterService
              .getJobElements()
              .then((value) => data = data.copyWith(mdElement: value.length)))
          ..add(_databaseMasterService
              .getMmms()
              .then((value) => data = data.copyWith(mdMmm: value.length)))
          ..add(_databaseMasterService
              .getPdcas()
              .then((value) => data = data.copyWith(mdPdca: value.length)))
          ..add(_databaseMasterService
              .getSpeqss()
              .then((value) => data = data.copyWith(mdSpeqs: value.length)))
          ..add(_databaseMasterService
              .getTeams()
              .then((value) => data = data.copyWith(mdTeam: value.length)))
          ..add(_databaseMasterService.getTrainingProviders().then((value) =>
              data = data.copyWith(mdTrainingProvider: value.length)))
          ..add(_databaseMasterService
              .getCourses()
              .then((value) => data = data.copyWith(mdCourse: value.length)))
          ..add(_databaseMasterService.getSchedules().then((value) =>
              data = data.copyWith(schedulerUpcommingEvent: value.length)))
          ..add(_databaseMasterService
              .getSeveritys()
              .then((value) => data = data.copyWith(mdSeverity: value.length)))
          ..add(_databaseMasterService.getScheduleActivitys().then((value) =>
              data = data.copyWith(mdScheduleActivity: value.length)))
          ..add(_databaseMasterService
              .getWorkers()
              .then((value) => data = data.copyWith(mdWoker: value.length)))
          ..add(_databaseMasterService.getRejectReasons().then(
              (value) => data = data.copyWith(mdRejectReason: value.length)));

        await Future.wait(futures).whenComplete(() => emit(state.copyWith(
              isLoading: false,
              dataLoaded: true,
              data: data,
            )));
      });
    } catch (e) {
      emit(state.copyWith(isLoading: false, dataLoaded: false));
      if (kDebugMode) throw FlutterError(e.toString());
    }
  }

  Future<void> onSync(BuildContext context) async {
    if ((companies ?? []).isEmpty) return;

    context.read<AssessmentCubit>().cleanCache();

    await context.read<UserDeviceCubit>().createUserDevice(context);

    //TODO(John Nguyen): Logic Here
  }
}
