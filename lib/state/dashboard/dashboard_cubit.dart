import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends HydratedCubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  Future<void> initializeRM() async {
    try {
      await getTotalWorkers();
      final service = cmoDatabaseMasterService;
      final totalStakeholders = await service.getStakeHolders();
      emit(state.copyWith(totalStakeholders: totalStakeholders.length));
    } catch (error) {
      handleError(error);
    }
  }

  Future<void> getDataBehaveRole() async {
    try {
      final activeUserInfo = await configService.getActiveUser();
      final activeCompany = await configService.getActiveCompany();
      await getTotalAssessments(
        activeUserInfo?.userId,
        activeCompany?.companyId,
      );

    } catch (error) {
      handleError(error);
    }
  }

  Future<void> getTotalAssessments(int? userId, int? companyId) async {
    if (userId == null || companyId == null) return;
    final service = cmoDatabaseMasterService;
    final totalAssessments = await service.getAllAssessments(
      companyId: companyId,
      userId: userId,
    );

    emit(
      state.copyWith(
        totalAssessments: totalAssessments.length,
        totalIncompleteAssessments: totalAssessments
            .where((element) => element.statusEnum == AssessmentStatus.started)
            .length,
        totalCompletedAssessments: totalAssessments
            .where(
                (element) => element.statusEnum == AssessmentStatus.completed)
            .length,
      ),
    );
  }

  Future<void> getTotalWorkers() async {
    final service = cmoDatabaseMasterService;

    /// Replace farmID here
    final totalWorkers = await service.getFarmerWorkersByFarmId(1553253093156);

    emit(state.copyWith(totalWorkers: totalWorkers.length));
  }

  Future<void> refresh() async {
    await initializeRM();
  }

  void handleError(Object error) {
    logger.d(error);
  }

  @override
  DashboardState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(DashboardState state) {
    return null;
  }
}
