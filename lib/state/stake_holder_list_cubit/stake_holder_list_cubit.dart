import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'stake_holder_list_state.dart';

class StakeHolderListCubit extends HydratedCubit<StakeHolderListState> {
  StakeHolderListCubit() : super(const StakeHolderListState());

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

  Future<void> loadListStakeHolderType() async {
    emit(state.copyWith(loadingList: true));
    try {
      final service = cmoDatabaseMasterService;
      final data = await service.getStakeHolderTypes();
      emit(
        state.copyWith(
          listStakeholderTypes: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingList: false));
    }
  }

  Future<void> onRemoveStakeholder(StakeHolder stakeHolder) async {
    await cmoDatabaseMasterService
        .removeStakeHolder(stakeHolder.stakeHolderId!);
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
