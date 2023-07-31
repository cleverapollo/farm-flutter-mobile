import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/stake_holder_list_cubit/stake_holder_list_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum AdditionalInfoEnum {
  socialUpliftment,
  specialSite,
  customaryUseRight,
}

class StakeHolderListCubit extends HydratedCubit<StakeHolderListState> {
  StakeHolderListCubit() : super(const StakeHolderListState());

  void onSelectStakeholder(StakeHolderType? item) {
    emit(state.copyWith(selectStakeHolderType: item));
  }

  void onCreateAdditionalInfo(AdditionalInfoEnum type, String name) {
    switch (type) {
      case AdditionalInfoEnum.socialUpliftment:
        final data = <SocialUpliftment>[];
        final farmerData = <FarmStakeholderSocialUpliftment>[];

        final socialUpliftmentId =
            DateTime.now().millisecondsSinceEpoch.toString();

        data
          ..addAll(state.listSocialUpliftment)
          ..add(SocialUpliftment(
            socialUpliftmentId: socialUpliftmentId,
            socialUpliftmentName: name,
            isActive: true,
            isMasterDataSynced: 0,
          ));

        farmerData
          ..addAll(state.listSocialUpliftments)
          ..add(FarmStakeholderSocialUpliftment(
            socialUpliftmentId: socialUpliftmentId,
            farmStakeholderId:
                state.farmerStakeHolder.farmerStakeHolderId.toString(),
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
          ..addAll(state.listSpecialSite)
          ..add(SpecialSite(
            specialSiteId: specialSiteId,
            specialSiteName: name,
            isActive: true,
            isMasterDataSynced: 0,
          ));
        farmerData
          ..addAll(state.listSpecialSites)
          ..add(FarmStakeholderSpecialSite(
            specialSiteId: specialSiteId,
            farmStakeholderId:
                state.farmerStakeHolder.farmerStakeHolderId.toString(),
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
          ..addAll(state.listCustomaryUseRight)
          ..add(CustomaryUseRight(
            customaryUseRightId: customaryUseRightId,
            customaryUseRightName: name,
            isActive: true,
            isMasterDataSynced: 0,
          ));

        farmerData
          ..addAll(state.listCustomaryUseRights)
          ..add(FarmStakeholderCustomaryUseRight(
            customaryUseRightId: customaryUseRightId,
            farmStakeholderId:
                state.farmerStakeHolder.farmerStakeHolderId.toString(),
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

    futures.add(cmoDatabaseMasterService
        .cacheFarmerStakeholder(state.farmerStakeHolder));

    for (final item in state.listCustomaryUseRight) {
      futures
          .add(cmoDatabaseMasterService.cacheCustomaryUseRightFromFarm(item));
    }
    for (final item in state.listCustomaryUseRights) {
      futures.add(cmoDatabaseMasterService
          .cacheFarmStakeholderCustomaryUseRights(item));
    }
    for (final item in state.listSocialUpliftment) {
      futures.add(cmoDatabaseMasterService.cacheSocialUpliftmentFromFarm(item));
    }
    for (final item in state.listSocialUpliftments) {
      futures.add(
          cmoDatabaseMasterService.cacheFarmStakeholderSocialUpliftments(item));
    }
    for (final item in state.listSpecialSite) {
      futures.add(cmoDatabaseMasterService.cacheSpecialSiteFromFarm(item));
    }
    for (final item in state.listSpecialSites) {
      futures
          .add(cmoDatabaseMasterService.cacheFarmStakeholderSpecialSites(item));
    }

    await Future.wait(futures);
  }

  Future<void> loadListStakeHolders() async {
    emit(state.copyWith(loadingList: true));
    try {
      final service = cmoDatabaseMasterService;
      final data = await service.getStakeHolders();
      emit(
        state.copyWith(
          listStakeHolders: data,
          filterListStakeHolders: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingList: false));
    }
  }

  Future<void> searching(String? searchText) async {
    emit(state.copyWith(loadingList: true));
    try {
      if (searchText == null || searchText.isEmpty) {
        emit(
          state.copyWith(
            filterListStakeHolders: state.listStakeHolders,
          ),
        );
      } else {
        final filteredItems = state.listStakeHolders
            .where(
              (element) =>
                  (element.stakeholderName
                          ?.toLowerCase()
                          .contains(searchText.toLowerCase()) ??
                      false) ||
                  (element.contactName
                          ?.toLowerCase()
                          .contains(searchText.toLowerCase()) ??
                      false) ||
                  (element.email
                          ?.toLowerCase()
                          .contains(searchText.toLowerCase()) ??
                      false),
            )
            .toList();

        emit(
          state.copyWith(
            filterListStakeHolders: filteredItems,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingList: false));
    }
  }

  Future<void> initStakeholderDetailData(StakeHolder? stakeHolder) async {
    emit(const StakeHolderListState(loadingList: true));

    try {
      final service = cmoDatabaseMasterService;
      final data = await service.getStakeHolderTypes();
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
            listStakeholderTypes: data,
            listCustomaryUseRights:
                additionalInfos[0] as List<FarmStakeholderCustomaryUseRight>,
            listSocialUpliftments:
                additionalInfos[1] as List<FarmStakeholderSocialUpliftment>,
            listSpecialSites:
                additionalInfos[2] as List<FarmStakeholderSpecialSite>,
            farm: farm,
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
            ),
            farmerStakeHolder: FarmerStakeHolder(
              farmId: farm?.farmId ?? '',
              farmerStakeHolderId:
                  DateTime.now().millisecondsSinceEpoch.toString(),
              stakeholderId: stakeHolderId.toString(),
              isActive: true,
              isMasterDataSynced: false,
              isLocal: true,
            ),
            listStakeholderTypes: data,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingList: false));
    }
  }

  Future<void> onRemoveStakeholder(StakeHolder stakeHolder) async {
    await cmoDatabaseMasterService
        .removeStakeHolder(int.parse(stakeHolder.stakeHolderId!));
    showSnackSuccess(
      msg: '${LocaleKeys.remove.tr()} ${stakeHolder.stakeHolderId}!',
    );

    await loadListStakeHolders();
  }

  Future<void> refresh() async {
    final rmUnit = await configService.getActiveRegionalManager();
    final farm = await configService.getActiveFarm();
    emit(state.copyWith(resourceManagerUnit: rmUnit, farm: farm));
    await loadListStakeHolders();
  }

  @override
  StakeHolderListState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(StakeHolderListState state) {
    return null;
  }
}
