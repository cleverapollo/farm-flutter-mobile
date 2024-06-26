import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends HydratedCubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  Future<void> initializeFarmDashBoard() async {
    try {
      emit(state.copyWith(loading: true));
      final userInfo = await configService.getActiveUser();
      final activeFarm = await configService.getActiveFarm();
      final data = await cmoDatabaseMasterService
          .getFarmerWorkersByFarmId(activeFarm?.farmId ?? '');

      CharcoalPlantationRoleEnum? getCharcoalPlantationRole;
      if (activeFarm?.groupSchemeId != null && userInfo != null) {
        getCharcoalPlantationRole = userInfo.getCharcoalPlantationRole;
      }

      final totalStakeholder = await cmoDatabaseMasterService.getAllActiveStakeholdersByFarmStakeholder();
      emit(state.copyWith(
          farmDashBoardInfo: FarmDashBoardInfo(
            totalLabour: data.length,
            totalStakeholder: totalStakeholder.length,
              charcoalPlantationRoleEnum: getCharcoalPlantationRole,
          ),
          loading: false));
    } catch (e) {
      handleError(e);
    }
  }

  Future<void> initializeRM() async {
    try {
      await getResourceManagerMembers();
      await getStakeHolders();
      await RMGetTotalAssessments();
      final totalStakeholders = await cmoDatabaseMasterService.getStakeHolders();
      emit(
        state.copyWith(
          totalStakeholders: totalStakeholders.length,
        ),
      );
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

      await getTotalUnsyncBehave(
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

    final totalIncompleteAssessments = await service.getAllAssessmentsStarted();
    final totalCompletedAssessments =
        await service.getAllAssessmentsCompleted();
    emit(
      state.copyWith(
        totalAssessments: totalAssessments.length,
        totalIncompleteAssessments: totalIncompleteAssessments.length,
        totalCompletedAssessments: totalCompletedAssessments.length,
      ),
    );
  }

  Future<void> RMGetTotalAssessments() async {
    final resourceManagerUnit = await configService.getActiveRegionalManager();
    if (resourceManagerUnit == null) {
      return;
    }
    final service = cmoDatabaseMasterService;
    final totalAudits = await service.getAllAudits();
    final totalIncompleteAudits = totalAudits
        .where((element) => element.completed == false)
        .toList()
        .length;
    final totalCompletedAudits = totalAudits
        .where(
          (element) => element.completed == true && element.synced == false,
        )
        .toList()
        .length;

    state.rmDashboardInfo?.unsynced = totalCompletedAudits;
    state.rmDashboardInfo?.memberOutstanding =
        (await service.getUnsyncedFarmCountByRegionalManagerUnitId(
                    resourceManagerUnit!.regionalManagerUnitId!))
                ?.length ??
            0;
    emit(
      state.copyWith(
        totalAssessments: totalAudits.length,
        totalIncompleteAssessments: totalIncompleteAudits,
        totalCompletedAssessments: totalCompletedAudits,
        rmDashboardInfo: state.rmDashboardInfo,
      ),
    );
  }

  Future<void> getTotalUnsyncBehave(int? userId, int? companyId) async {
    if (userId == null || companyId == null) return;
    final service = cmoDatabaseMasterService;
    final totalAssessments = await service.getAllAssessments(
      companyId: companyId,
      userId: userId,
    );

    final totalWorkersLocal = await service.getWorkersLocal();

    emit(
      state.copyWith(
        totalUnsyncBehave: totalWorkersLocal.length +
            totalAssessments
                .where(
                  (element) => element.statusEnum != AssessmentStatus.synced,
                )
                .length,
      ),
    );
  }

  Future<void> getResourceManagerMembers() async {
    emit(state.copyWith(loading: true));
    final service = cmoDatabaseMasterService;
    final resourceManagerUnit = await configService.getActiveRegionalManager();
    if (resourceManagerUnit == null) {
      return;
    }
    final farms = await service.getFarmsByRMUnit(resourceManagerUnit.id);
    final info = state.rmDashboardInfo ?? RMDashboardInfo();

    info.incompletedMembers = 0;
    info.onboardedMembers = 0;
    info.incompleteMembersArea = 0;
    info.onboardedMembersArea = 0;

    for (final farm in farms) {
      final compartments = await cmoDatabaseMasterService.getCompartmentByFarmId(
        farm.farmId,
      );

      var totalArea = 0.0;
      for (final compartment in compartments) {
        totalArea += compartment.polygonArea ?? 0;
      }

      if (farm.isGroupSchemeMember) {
        info.onboardedMembers = info.onboardedMembers + 1;
        info.onboardedMembersArea = info.onboardedMembersArea + totalArea;
      } else {
        info.incompletedMembers = info.incompletedMembers + 1;
        info.incompleteMembersArea = info.incompleteMembersArea + totalArea;
      }
    }

    info.totalMembers = info.onboardedMembers + info.incompletedMembers;
    info.totalMembersArea = info.onboardedMembersArea + info.incompleteMembersArea;

    emit(state.copyWith(rmDashboardInfo: info, loading: false));
  }

  Future<void> getStakeHolders() async {
    final service = cmoDatabaseMasterService;
    final groupScheme = await configService.getActiveGroupScheme();
    if (groupScheme == null) {
      return;
    }
    final stakeHolders = await service.getStakeHolders();
    emit(
      state.copyWith(
        rmDashboardInfo: state.rmDashboardInfo
          ?..stakeHolders = stakeHolders.length,
      ),
    );
  }

  Future<void> refresh() async {
    final userRole = await configService.getActiveUserRole();
    switch (userRole) {
      case UserRoleEnum.behave:
        await getDataBehaveRole();
        break;
      case UserRoleEnum.regionalManager:
        await initializeRM();
        break;
      case UserRoleEnum.farmerMember:
        await initializeFarmDashBoard();
        break;
      default:
        break;
    }
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
