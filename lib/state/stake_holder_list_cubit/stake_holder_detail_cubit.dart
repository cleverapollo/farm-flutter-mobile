import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/model/stakeholder/farm_stake_holder.dart';
import 'package:cmo/ui/ui.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'stake_holder_detail_state.dart';

class StakeholderDetailCubit extends HydratedCubit<StakeholderDetailState> {
  StakeholderDetailCubit({
    StakeHolder? stakeHolder,
  }) : super(
          StakeholderDetailState(stakeHolder: stakeHolder),
        ) {
    initStakeholderDetailData();
  }

  Future<void> initStakeholderDetailData() async {
    emit(state.copyWith(loading: true));

    try {
      final service = cmoDatabaseMasterService;
      final currentRole = await configService.getActiveUserRole();
      var stakeHolderTypes = await service.getStakeHolderTypes();
      final farm = await configService.getActiveFarm();
      final listCustomaryUseRights = await service.getCustomaryUseRight();
      final listSocialUpliftments = await service.getSocialUpliftment();
      final listSpecialSites = await service.getSpecialSite();

      if (currentRole == UserRoleEnum.farmerMember) {
        stakeHolderTypes = await service.getFarmerStakeHolderTypes();
      }

      emit(
        state.copyWith(
          farm: farm,
          currentUserRole: currentRole,
          listStakeholderTypes: stakeHolderTypes,
          listCustomaryUseRights: listCustomaryUseRights,
          listSocialUpliftments: listSocialUpliftments,
          listSpecialSites: listSpecialSites,
        ),
      );

      if (farm != null && state.stakeHolder != null) {
        final farmerStakeholder = await cmoDatabaseMasterService
            .getFarmStakeholderByStakeholderId(
          state.stakeHolder?.stakeholderId,
        );

        final additionalInfos = await Future.wait([
          service.getFarmStakeholderCustomaryUseRights(farmStakeholderId: farmerStakeholder?.farmStakeHolderId),
          service.getFarmStakeholderSocialUpliftments(farmStakeholderId: farmerStakeholder?.farmStakeHolderId),
          service.getFarmStakeholderSpecialSites(farmStakeholderId: farmerStakeholder?.farmStakeHolderId),
        ]);

        emit(
          state.copyWith(
            listFarmCustomaryUseRights: additionalInfos[0] as List<FarmStakeholderCustomaryUseRight>,
            listFarmSocialUpliftments: additionalInfos[1] as List<FarmStakeholderSocialUpliftment>,
            listFarmSpecialSites: additionalInfos[2] as List<FarmStakeholderSpecialSite>,
          ),
        );

        initListAdditionalSelectedData();
      }

      if (state.stakeHolder == null) {
        emit(
          state.copyWith(
            stakeHolder: StakeHolder(
              stakeholderId: DateTime.now().millisecondsSinceEpoch.toString(),
              createDT: DateTime.now(),
              updateDT: DateTime.now(),
            ),
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

  void initListAdditionalSelectedData() {
    final selectedSocialUpliftments = <SocialUpliftment>[];
    final selectedSpecialSites = <SpecialSite>[];
    final selectedCustomaryUseRights = <CustomaryUseRight>[];

    for (final item in state.listFarmSocialUpliftments) {
      final socialUpliftment = state.listSocialUpliftments
          .firstWhereOrNull(
            (element) =>
        element.socialUpliftmentId == item.socialUpliftmentId,
      );

      if (socialUpliftment != null) {
        selectedSocialUpliftments.add(socialUpliftment);
      }
    }

    for (final item in state.listFarmCustomaryUseRights) {
      final customaryUseRight = state.listCustomaryUseRights
          .firstWhereOrNull(
            (element) =>
        element.customaryUseRightId == item.customaryUseRightId,
      );

      if (customaryUseRight != null) {
        selectedCustomaryUseRights.add(customaryUseRight);
      }
    }

    for (final item in state.listFarmSpecialSites) {
      final specialSite = state.listSpecialSites
          .firstWhereOrNull(
            (element) =>
        element.specialSiteId == item.specialSiteId,
      );

      if (specialSite != null) {
        selectedSpecialSites.add(specialSite);
      }
    }

    emit(
      state.copyWith(
        selectedSocialUpliftments: selectedSocialUpliftments,
        selectedCustomaryUseRights: selectedCustomaryUseRights,
        selectedSpecialSites: selectedSpecialSites,
      ),
    );
  }

  void onSelectStakeholder(String? stakeHolderTypeId) {
    emit(
      state.copyWith(
        isSelectTypeError: stakeHolderTypeId == null,
        stakeHolder: state.stakeHolder?.copyWith(
          stakeholderTypeId: stakeHolderTypeId,
        ),
      ),
    );
  }

  void onChangeStakeholderName(String? stakeholderName) {
    emit(
      state.copyWith(
        isEntityNameError: stakeholderName.isBlank,
        stakeHolder: state.stakeHolder?.copyWith(
          stakeholderName: stakeholderName,
        ),
      ),
    );
  }

  void onChangeContactName(String? contactName) {
    emit(
      state.copyWith(
        isContactNameError: contactName.isBlank,
        stakeHolder: state.stakeHolder?.copyWith(
          contactName: contactName,
        ),
      ),
    );
  }

  void onChangeEmail(String? email) {
    emit(
      state.copyWith(
        stakeHolder: state.stakeHolder?.copyWith(
          email: email,
        ),
      ),
    );
  }

  void onChangeAddress(String? address) {
    emit(
      state.copyWith(
        stakeHolder: state.stakeHolder?.copyWith(
          address1: address,
        ),
      ),
    );
  }

  void onChangePhoneNumber(String? phoneNumber) {
    emit(
      state.copyWith(
        stakeHolder: state.stakeHolder?.copyWith(
          cell: phoneNumber,
        ),
      ),
    );
  }

  void onChangeSocialUpliftment(List<SocialUpliftment> socialUpliftments) {
    emit(
      state.copyWith(
        selectedSocialUpliftments: socialUpliftments,
      ),
    );
  }

  void onChangeSpecialSite(List<SpecialSite> specialSites) {
    emit(
      state.copyWith(
        selectedSpecialSites: specialSites,
      ),
    );
  }

  void onChangeCustomaryUseRight(List<CustomaryUseRight> customaryUseRights) {
    emit(
      state.copyWith(
        selectedCustomaryUseRights: customaryUseRights,
      ),
    );
  }

  Future<void> onSaveAdditionalInfo(String? farmStakeholderId) async {
    final futures = <Future<void>>[];
    var now = DateTime.now().microsecondsSinceEpoch;

    for (final item in state.listFarmCustomaryUseRights) {
      futures.add(
        cmoDatabaseMasterService.removeFarmStakeholderCustomaryUseRight(item.id),
      );
    }

    for (final item in state.selectedCustomaryUseRights) {
      futures.add(
        cmoDatabaseMasterService.cacheFarmStakeholderCustomaryUseRights(
          FarmStakeholderCustomaryUseRight(
            customaryUseRightId: item.customaryUseRightId,
            farmStakeholderCustomaryUseRightId: (now++).toString(),
            isActive: true,
            isMasterDataSynced: 0,
            farmStakeholderId: farmStakeholderId,
          ),
        ),
      );
    }

    for (final item in state.listFarmSocialUpliftments) {
      futures.add(
        cmoDatabaseMasterService.removeFarmStakeholderSocialUpliftment(item.id),
      );
    }

    for (final item in state.selectedSocialUpliftments) {
      futures.add(
        cmoDatabaseMasterService.cacheFarmStakeholderSocialUpliftments(
          FarmStakeholderSocialUpliftment(
            socialUpliftmentId: item.socialUpliftmentId,
            farmStakeholderSocialUpliftmentId: (now++).toString(),
            farmStakeholderId: farmStakeholderId,
            isActive: true,
            isMasterDataSynced: 0,
          ),
        ),
      );
    }

    for (final item in state.listFarmSpecialSites) {
      futures.add(
        cmoDatabaseMasterService.removeFarmStakeholderSpecialSite(item.id),
      );
    }

    for (final item in state.selectedSpecialSites) {
      futures.add(
        cmoDatabaseMasterService.cacheFarmStakeholderSpecialSites(
          FarmStakeholderSpecialSite(
            specialSiteId: item.specialSiteId,
            farmStakeholderSpecialSiteId: (now++).toString(),
            farmStakeholderId: farmStakeholderId,
            isActive: true,
            isMasterDataSynced: 0,
          ),
        ),
      );
    }

    await Future.wait(futures);
  }

  bool onValidateRequireField() {
    if (state.stakeHolder?.stakeholderTypeId == null ||
        (state.stakeHolder?.contactName?.isBlank ?? true) ||
        (state.stakeHolder?.stakeholderName?.isBlank ?? true)) {
      emit(
        state.copyWith(
          isSelectTypeError: state.stakeHolder?.stakeholderTypeId == null,
          isEntityNameError: state.stakeHolder?.contactName?.isBlank ?? true,
          isContactNameError: state.stakeHolder?.stakeholderName?.isBlank ?? true,
        ),
      );

      return true;
    }

    return false;
  }

  Future<void> onSaveStakeholder(bool isEditing, {
    required void Function(int?) onCallback,
  }) async {
    if(onValidateRequireField()) {
      return;
    }

    final databaseService = cmoDatabaseMasterService;
    final resultId = await databaseService.cacheStakeholder(
      state.stakeHolder!.copyWith(
        isMasterDataSynced: false,
      ),
      isDirect: false,
    );

    if (state.currentUserRole != null) {
      switch (state.currentUserRole!) {
        case UserRoleEnum.regionalManager:
          await onSaveGroupSchemeStakeholder(isEditing);
          break;
        case UserRoleEnum.farmerMember:
          final farmStakeholderId = await onSaveFarmStakeholder(isEditing);
          await onSaveAdditionalInfo(farmStakeholderId);
          break;
        case UserRoleEnum.behave:
          break;
      }
    }

    onCallback(resultId);
  }

  Future<void> onSaveGroupSchemeStakeholder(bool isEditing) async {
    if (isEditing) {
      final groupSchemeStakeholder = await cmoDatabaseMasterService
          .getGroupSchemeStakeholderByStakeholderId(
        state.stakeHolder!.stakeholderId!,
      );

      if (groupSchemeStakeholder != null) {
        await cmoDatabaseMasterService.cacheGroupSchemeStakeholder(
          groupSchemeStakeholder.copyWith(
            isMasterDataSynced: true,
          ),
          isDirect: false,
        );
      }
    } else {
      final activeGroupScheme = await configService.getActiveGroupScheme();
      final groupSchemeStakeholder = GroupSchemeStakeholder(
        isMasterDataSynced: true,
        groupSchemeId: activeGroupScheme?.groupSchemeId,
        groupSchemeStakeholderId: DateTime.now().millisecondsSinceEpoch.toString(),
        stakeholderId: state.stakeHolder?.stakeholderId,
      );

      await cmoDatabaseMasterService.cacheGroupSchemeStakeholder(
        groupSchemeStakeholder,
        isDirect: false,
      );
    }
  }

  Future<String> onSaveFarmStakeholder(bool isEditing) async {
    var farmStakeholderId = '';
    if (isEditing) {
      final farmerStakeholder = await cmoDatabaseMasterService
          .getFarmStakeholderByStakeholderId(
        state.stakeHolder?.stakeholderId,
      );

      if (farmerStakeholder != null) {
        farmStakeholderId = farmerStakeholder.farmStakeHolderId ?? '';
          await cmoDatabaseMasterService.cacheFarmStakeholder(
            farmerStakeholder.copyWith(
              isMasterDataSynced: 0,
            ),
            isDirect: false,
          );
      }
    } else {
      final farmStakeHolder = FarmStakeHolder(
        isMasterDataSynced: 0,
        farmId: state.farm?.farmId,
        stakeHolderId: state.stakeHolder?.stakeholderId,
        farmStakeHolderId: DateTime.now().millisecondsSinceEpoch.toString(),
        updateDT: DateTime.now(),
        createDT: DateTime.now(),
      );

      farmStakeholderId = farmStakeHolder.farmStakeHolderId ?? '';

      await cmoDatabaseMasterService.cacheFarmStakeholder(
        farmStakeHolder,
        isDirect: false,
      );
    }

    return farmStakeholderId;
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
