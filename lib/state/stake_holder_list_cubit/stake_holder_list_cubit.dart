import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'stake_holder_list_state.dart';

class StakeHolderListCubit extends HydratedCubit<StakeHolderListState> {
  StakeHolderListCubit() : super(const StakeHolderListState());

  Future<void> loadListStakeHolderForRMRole() async {
    emit(state.copyWith(loadingList: true));
    try {
      final service = cmoDatabaseMasterService;
      final data = await service.getStakeHolders();
      emit(state.copyWith(
        listStakeHolders: data,
        filterListStakeHolders: data,
      ));
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
                  (element.entityName
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

  Future<void> refresh() async {
    await loadListStakeHolderForRMRole();
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
