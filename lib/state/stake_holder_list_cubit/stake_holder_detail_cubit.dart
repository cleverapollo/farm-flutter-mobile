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
      final stakeHolderTypes = await service.getStakeHolderTypes();
      final farm = await configService.getActiveFarm();
      final listCustomaryUseRights = await service.getCustomaryUseRight();
      final listSocialUpliftments = await service.getSocialUpliftment();
      final listSpecialSites = await service.getSpecialSite();

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
          state.stakeHolder?.stakeHolderId,
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
      }

      if (state.stakeHolder == null) {
        emit(
          state.copyWith(
            stakeHolder: StakeHolder(
              stakeHolderId: DateTime.now().millisecondsSinceEpoch.toString(),
              isActive: 1,
              isMasterDataSynced: 0,
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

  void onSelectStakeholder(String? stakeHolderTypeId) {
    emit(
      state.copyWith(
        isSelectTypeError: stakeHolderTypeId == null,
        stakeHolder: state.stakeHolder?.copyWith(
          stakeHolderTypeId: stakeHolderTypeId,
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
    var now = DateTime.now().microsecondsSinceEpoch;
    emit(
      state.copyWith(
        listFarmSocialUpliftments: socialUpliftments
            .map(
              (element) => FarmStakeholderSocialUpliftment(
                socialUpliftmentId: element.socialUpliftmentId,
                farmStakeholderSocialUpliftmentId: (now++).toString(),
                isActive: 1,
                isMasterDataSynced: 0,
              ),
            )
            .toList(),
      ),
    );
  }

  void onChangeSpecialSite(List<SpecialSite> specialSites) {
    var now = DateTime.now().microsecondsSinceEpoch;
    emit(
      state.copyWith(
        listFarmSpecialSites: specialSites
            .map(
              (element) => FarmStakeholderSpecialSite(
                specialSiteId: element.specialSiteId,
                farmStakeholderSpecialSiteId: (now++).toString(),
                isActive: 1,
                isMasterDataSynced: 0,
              ),
            )
            .toList(),
      ),
    );
  }

  void onChangeCustomaryUseRight(List<CustomaryUseRight> customaryUseRights) {
    var now = DateTime.now().microsecondsSinceEpoch;
    emit(
      state.copyWith(
        listFarmCustomaryUseRights: customaryUseRights
            .map(
              (element) => FarmStakeholderCustomaryUseRight(
                customaryUseRightId: element.customaryUseRightId,
                farmStakeholderCustomaryUseRightId: (now++).toString(),
                isActive: 1,
                isMasterDataSynced: 0,
              ),
            )
            .toList(),
      ),
    );
  }

  Future<void> onSaveAdditionalInfo(String? farmStakeholderId) async {
    final futures = <Future<void>>[];

    for (final item in state.listFarmCustomaryUseRights) {
      futures.add(
        cmoDatabaseMasterService.cacheFarmStakeholderCustomaryUseRights(
          item.copyWith(
            farmStakeholderId: farmStakeholderId,
          ),
        ),
      );
    }

    for (final item in state.listFarmSocialUpliftments) {
      futures.add(
        cmoDatabaseMasterService.cacheFarmStakeholderSocialUpliftments(
          item.copyWith(
            farmStakeholderId: farmStakeholderId,
          ),
        ),
      );
    }

    for (final item in state.listFarmSpecialSites) {
      futures.add(
        cmoDatabaseMasterService.cacheFarmStakeholderSpecialSites(
          item.copyWith(
            farmStakeholderId: farmStakeholderId,
          ),
        ),
      );
    }

    await Future.wait(futures);
  }

  bool onValidateRequireField() {
    if (state.stakeHolder?.stakeHolderTypeId == null ||
        (state.stakeHolder?.contactName?.isBlank ?? true) ||
        (state.stakeHolder?.stakeholderName?.isBlank ?? true)) {
      emit(
        state.copyWith(
          isSelectTypeError: state.stakeHolder?.stakeHolderTypeId == null,
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
        isActive: 1,
        isMasterDataSynced: 0,
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
        state.stakeHolder!.stakeHolderId!,
      );

      if (groupSchemeStakeholder != null) {
        await cmoDatabaseMasterService.cacheGroupSchemeStakeholder(
          groupSchemeStakeholder.copyWith(
            isMasterDataSynced: 0,
          ),
          isDirect: false,
        );
      }
    } else {
      final activeGroupScheme = await configService.getActiveGroupScheme();
      final groupSchemeStakeholder = GroupSchemeStakeholder(
        isMasterDataSynced: 0,
        groupSchemeId: activeGroupScheme?.groupSchemeId,
        groupSchemeStakeholderId: DateTime.now().millisecondsSinceEpoch.toString(),
        stakeholderId: state.stakeHolder?.stakeHolderId,
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
        state.stakeHolder?.stakeHolderId,
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
        stakeHolderId: state.stakeHolder?.stakeHolderId,
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
