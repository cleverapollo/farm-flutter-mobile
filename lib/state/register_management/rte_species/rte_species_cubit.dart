import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'rte_species_state.dart';

class RteSpeciesCubit extends HydratedCubit<RteSpeciesState> {
  RteSpeciesCubit() : super(const RteSpeciesState());

  Future<void> init() async {
    final activeFarm = await configService.getActiveFarm();
    final groupSchemeMasterSpecies = await cmoDatabaseMasterService.getAllGroupSchemeMasterSpecies();
    emit(
      state.copyWith(
        activeFarm: activeFarm,
        groupSchemeMasterSpecies: groupSchemeMasterSpecies,
      ),
    );

    await loadRteSpecies();
  }

  Future<void> loadRteSpecies() async {
    emit(state.copyWith(loading: true));
    try {
      if (state.activeFarm?.farmId == null) return;
      final listRteSpecies = await cmoDatabaseMasterService.getRteSpeciesByFarmId(state.activeFarm!.farmId);

      emit(
        state.copyWith(
          listRteSpecies: listRteSpecies,
          filterRteSpecies: listRteSpecies,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void searching(String? searchText) {
    emit(state.copyWith(loading: true));
    try {
      if (searchText == null || searchText.isEmpty) {
        emit(
          state.copyWith(
            filterRteSpecies: state.listRteSpecies,
          ),
        );
      } else {
        final filteredItems = state.listRteSpecies
            .where(
              (element) =>
                  element.rteSpeciesRegisterNo
                      ?.toLowerCase()
                      .contains(searchText.toLowerCase()) ??
                  false,
            )
            .toList();

        emit(
          state.copyWith(
            filterRteSpecies: filteredItems,
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

  String getCommonName(RteSpecies item) {
    return state.groupSchemeMasterSpecies
            .firstWhereOrNull(
              (element) =>
                  element.groupSchemeMasterSpeciesId ==
                  item.groupSchemeMasterSpeciesId,
            )
            ?.commonName ??
        '';
  }

  String getSpeciesTypeName(RteSpecies item) {
    return state.groupSchemeMasterSpecies
            .firstWhereOrNull(
              (element) =>
                  element.groupSchemeMasterSpeciesId ==
                  item.groupSchemeMasterSpeciesId,
            )
            ?.animalTypeName ??
        '';
  }

  @override
  RteSpeciesState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(RteSpeciesState state) {
    return null;
  }
}
