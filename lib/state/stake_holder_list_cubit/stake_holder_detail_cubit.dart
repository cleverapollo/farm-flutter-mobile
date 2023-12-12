import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'stake_holder_detail_state.dart';

enum AdditionalInfoEnum {
  socialUpliftment,
  specialSite,
  customaryUseRight,
}

class StakeholderDetailCubit extends HydratedCubit<StakeholderDetailState> {
  StakeholderDetailCubit({StakeHolder? stakeHolder})
      : super(
          StakeholderDetailState(
            stakeHolder: stakeHolder ??
                StakeHolder(
                  stakeHolderId: DateTime.now().millisecondsSinceEpoch.toString(),
                  isActive: 1,
                  isMasterDataSynced: 0,
                ),
          ),
        );

  Future<void> initStakeholderDetailData(StakeHolder? stakeHolder) async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;
      final currentRole = await configService.getActiveUserRole();
      final stakeHolderTypes = await service.getStakeHolderTypes();
      emit(
        state.copyWith(
          currentUserRole: currentRole,
          listStakeholderTypes: stakeHolderTypes,
        ),
      );

      final farm = await configService.getActiveFarm();
      if (farm != null && stakeHolder != null) {
        final additionalInfos = await Future.wait([
          service.getFarmStakeholderCustomaryUseRights(
              stakeholderId:
              int.tryParse(stakeHolder.stakeHolderId ?? '') ?? 0),
          service.getFarmStakeholderSocialUpliftments(
              stakeholderId:
              int.tryParse(stakeHolder.stakeHolderId ?? '') ?? 0),
          service.getFarmStakeholderSpecialSites(
              stakeholderId:
              int.tryParse(stakeHolder.stakeHolderId ?? '') ?? 0),
        ]);

        emit(
          state.copyWith(
            stakeHolder: stakeHolder,
            farm: farm,
            listCustomaryUseRights: additionalInfos[0] as List<FarmStakeholderCustomaryUseRight>,
            listSocialUpliftments: additionalInfos[1] as List<FarmStakeholderSocialUpliftment>,
            listSpecialSites: additionalInfos[2] as List<FarmStakeholderSpecialSite>,
          ),
        );
      } else {
        final stakeHolderId = DateTime.now().millisecondsSinceEpoch;

        emit(
          state.copyWith(
            stakeHolder: StakeHolder(
              stakeHolderId: stakeHolderId.toString(),
              isActive: 1,
              isMasterDataSynced: 0,
              createDT: DateTime.now(),
              updateDT: DateTime.now(),
            ),
            // farmerStakeHolder: FarmerStakeHolder(
            //   farmId: farm?.farmId ?? '',
            //   farmerStakeHolderId: DateTime.now().millisecondsSinceEpoch.toString(),
            //   stakeholderId: stakeHolderId.toString(),
            //   isActive: true,
            //   isMasterDataSynced: false,
            //
            // ),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void onSelectStakeholder(String? stakeHolderTypeId) {
    emit(
      state.copyWith(
        stakeHolder: state.stakeHolder?.copyWith(
          stakeHolderTypeId: stakeHolderTypeId,
        ),
      ),
    );
  }

  void onCreateAdditionalInfo(AdditionalInfoEnum type, String name) {
    switch (type) {
      case AdditionalInfoEnum.socialUpliftment:
        final data = <SocialUpliftment>[];
        final farmerData = <FarmStakeholderSocialUpliftment>[];

        final socialUpliftmentId =
        DateTime.now().millisecondsSinceEpoch.toString();

        data
          ..addAll(state.listSocialUpliftment ?? [])
          ..add(SocialUpliftment(
            socialUpliftmentId: socialUpliftmentId,
            socialUpliftmentName: name,
            isActive: true,
            isMasterDataSynced: 0,
          ));

        farmerData
          ..addAll(state.listSocialUpliftments ?? [])
          ..add(FarmStakeholderSocialUpliftment(
            socialUpliftmentId: socialUpliftmentId,
            farmStakeholderId: state.farmerStakeHolder?.farmerStakeHolderId.toString(),
            isActive: 1,
            isMasterDataSynced: 0,
          ));

        emit(state.copyWith(
          listSocialUpliftment: data,
          listSocialUpliftments: farmerData,
        ));
        break;
      case AdditionalInfoEnum.specialSite:
        final data = <SpecialSite>[];
        final farmerData = <FarmStakeholderSpecialSite>[];

        final specialSiteId = DateTime.now().millisecondsSinceEpoch.toString();

        data
          ..addAll(state.listSpecialSite ?? [])
          ..add(SpecialSite(
            specialSiteId: specialSiteId,
            specialSiteName: name,
            isActive: true,
            isMasterDataSynced: 0,
          ));
        farmerData
          ..addAll(state.listSpecialSites ?? [])
          ..add(FarmStakeholderSpecialSite(
            specialSiteId: specialSiteId,
            farmStakeholderId: state.farmerStakeHolder?.farmerStakeHolderId.toString(),
            isActive: 1,
            isMasterDataSynced: 0,
          ));

        emit(state.copyWith(
          listSpecialSite: data,
          listSpecialSites: farmerData,
        ));
        break;
      case AdditionalInfoEnum.customaryUseRight:
        final data = <CustomaryUseRight>[];
        final farmerData = <FarmStakeholderCustomaryUseRight>[];

        final customaryUseRightId =
        DateTime.now().millisecondsSinceEpoch.toString();

        data
          ..addAll(state.listCustomaryUseRight ?? [])
          ..add(CustomaryUseRight(
            customaryUseRightId: customaryUseRightId,
            customaryUseRightName: name,
            isActive: true,
            isMasterDataSynced: 0,
          ));

        farmerData
          ..addAll(state.listCustomaryUseRights ?? [])
          ..add(FarmStakeholderCustomaryUseRight(
            customaryUseRightId: customaryUseRightId,
            farmStakeholderId:
            state.farmerStakeHolder?.farmerStakeHolderId.toString(),
            isActive: 1,
            isMasterDataSynced: 0,
          ));

        emit(state.copyWith(
          listCustomaryUseRight: data,
          listCustomaryUseRights: farmerData,
        ));
        break;
    }
  }

  Future<void> onSaveAdditionalInfo() async {
    final futures = <Future<void>>[];

    if (state.farmerStakeHolder != null) {
      futures.add(cmoDatabaseMasterService.cacheFarmerStakeholder(state.farmerStakeHolder!));
    }

    for (final item in state.listCustomaryUseRight ?? <CustomaryUseRight>[]) {
      futures.add(cmoDatabaseMasterService.cacheCustomaryUseRightFromFarm(item));
    }

    for (final item in state.listCustomaryUseRights ?? <FarmStakeholderCustomaryUseRight>[]) {
      futures.add(cmoDatabaseMasterService.cacheFarmStakeholderCustomaryUseRights(item));
    }

    for (final item in state.listSocialUpliftment ?? <SocialUpliftment>[]) {
      futures.add(cmoDatabaseMasterService.cacheSocialUpliftmentFromFarm(item));
    }

    for (final item in state.listSocialUpliftments ?? <FarmStakeholderSocialUpliftment>[]) {
      futures.add(cmoDatabaseMasterService.cacheFarmStakeholderSocialUpliftments(item));
    }

    for (final item in state.listSpecialSite ?? <SpecialSite>[]) {
      futures.add(cmoDatabaseMasterService.cacheSpecialSiteFromFarm(item));
    }

    for (final item in state.listSpecialSites ?? <FarmStakeholderSpecialSite>[]) {
      futures.add(cmoDatabaseMasterService.cacheFarmStakeholderSpecialSites(item));
    }

    await Future.wait(futures);
  }

  Future<void> onSaveGroupSchemeStakeholder() async {

  }

  @override
  StakeholderDetailState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(StakeholderDetailState state) {
    return null;
  }
}
