import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/stake_holder_list_cubit/stake_holder_list_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class StakeHolderListCubit extends HydratedCubit<StakeHolderListState> {
  StakeHolderListCubit() : super(const StakeHolderListState());

  Future<void> loadListStakeHolders() async {
    emit(state.copyWith(loadingList: true));
    try {
      final service = cmoDatabaseMasterService;

      final currentRole = await configService.getActiveUserRole();
      switch (currentRole) {
        case UserRoleEnum.farmerMember:
          final listStakeHolders = await cmoDatabaseMasterService.getAllActiveStakeholdersByFarmStakeholder();
          emit(
            state.copyWith(
              listStakeHolders: listStakeHolders,
              filterListStakeHolders: listStakeHolders,
            ),
          );

          break;
        case UserRoleEnum.regionalManager:
          final data = await service.getStakeHolders();
          emit(
            state.copyWith(
              listStakeHolders: data,
              filterListStakeHolders: data,
            ),
          );
          break;
        default:
          break;
      }
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

  Future<void> onRemoveStakeholder(StakeHolder stakeHolder) async {
    await cmoDatabaseMasterService.cacheStakeHolderFromFarm(
      stakeHolder.copyWith(
        isMasterDataSynced: 0,
        isActive: 0,
      ),
    );

    final currentRole = await configService.getActiveUserRole();
    switch (currentRole) {
      case UserRoleEnum.farmerMember:
        final farmerStakeholder = await cmoDatabaseMasterService.getFarmStakeholderByStakeholderId(
          stakeHolder.stakeHolderId,
        );

        if (farmerStakeholder != null) {
          await cmoDatabaseMasterService.cacheFarmStakeholder(
            farmerStakeholder.copyWith(
              isMasterDataSynced: 0,
            ),
            isDirect: false,
          );
        }
        break;
      case UserRoleEnum.regionalManager:
        final groupSchemeStakeholder = await cmoDatabaseMasterService.getGroupSchemeStakeholderByStakeholderId(
          stakeHolder.stakeHolderId!,
        );

        if (groupSchemeStakeholder != null) {
          await cmoDatabaseMasterService.cacheGroupSchemeStakeholder(
            groupSchemeStakeholder.copyWith(
              isMasterDataSynced: 0,
            ),
            isDirect: false,
          );
        }
        break;
      default:
        break;
    }

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
