import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'rte_species_detail_state.dart';

class RteSpeciesDetailCubit extends HydratedCubit<RteSpeciesDetailState> {
  RteSpeciesDetailCubit({
    RteSpecies? rteSpecies,
  }) : super(
          RteSpeciesDetailState(
            rteSpecies: rteSpecies ??
                RteSpecies(
                  rteSpeciesRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
                  isActive: true,
                  isMasterDataSynced: false,
                ),
          ),
        );

  Future<void> init() async {
    final activeFarm = await configService.getActiveFarm();
    final animalTypes = await cmoDatabaseMasterService.getAnimalTypeByGroupSchemeId(activeFarm?.groupSchemeId ?? 0);
    final speciesRanges = await cmoDatabaseMasterService.getSpeciesRangeByGroupSchemeId(activeFarm?.groupSchemeId ?? 0);

    emit(
      state.copyWith(
        activeFarm: activeFarm,
        speciesRanges: speciesRanges,
        animalTypes: animalTypes,
      ),
    );
  }

  void onChangeSpeciesType(AnimalType animalType) {
    emit(
      state.copyWith(
        rteSpecies: state.rteSpecies?.copyWith(
          animalTypeId: animalType.animalTypeId,
          animalTypeName: animalType.animalTypeName,
        ),
      ),
    );
  }

  void onChangeCommonName(String? commonName) {
    emit(
      state.copyWith(
        rteSpecies: state.rteSpecies?.copyWith(
          commonName: commonName,
        ),
      ),
    );
  }

  void onChangeScientificName(String? scientificName) {
    emit(
      state.copyWith(
        rteSpecies: state.rteSpecies?.copyWith(
          scientificName: scientificName,
        ),
      ),
    );
  }

  void onChangeSpeciesRange(SpeciesRange speciesRange) {
    emit(
      state.copyWith(
        rteSpecies: state.rteSpecies?.copyWith(
          speciesRangeId: speciesRange.speciesRangeId,
          speciesRangeName: speciesRange.speciesRangeName,
        ),
      ),
    );
  }

  void onChangeDateSpotted(DateTime? dateSpotted) {
    emit(
      state.copyWith(
        rteSpecies: state.rteSpecies?.copyWith(
          dateSpotted: dateSpotted
        ),
      ),
    );
  }

  void onChangeComment(String? comment) {
    emit(
      state.copyWith(
        rteSpecies: state.rteSpecies?.copyWith(
          comment: comment,
        ),
      ),
    );
  }

  Future<void> loadListWorkers() async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;

      if (state.activeFarm?.farmId == null) return;
      final data =
      await service.getFarmerWorkersByFarmId(state.activeFarm!.farmId);

      emit(
        state.copyWith(
          listWorkers: data,
          filterWorkers: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> loadListJobDescriptions() async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;
      final data = await service.getJobDescriptions();

      emit(
        state.copyWith(
          listJobDescriptions: data,
          filterJobDescriptions: data,
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
            filterWorkers: state.listWorkers,
          ),
        );
      } else {
        final filteredItems = state.listWorkers
            .where(
              (element) =>
          (element.firstName
              ?.toLowerCase()
              .contains(searchText.toLowerCase()) ??
              false) ||
              (element.surname
                  ?.toLowerCase()
                  .contains(searchText.toLowerCase()) ??
                  false),
        )
            .toList();

        emit(
          state.copyWith(
            filterWorkers: filteredItems,
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

  void searchJobDescription(String? searchText) {
    emit(state.copyWith(loading: true));
    try {
      if (searchText == null || searchText.isEmpty) {
        emit(
          state.copyWith(
            filterJobDescriptions: state.listJobDescriptions,
          ),
        );
      } else {
        final filteredItems = state.listJobDescriptions
            .where(
              (element) =>
          element.jobDescriptionName
              ?.toLowerCase()
              .contains(searchText.toLowerCase()) ??
              false,
        )
            .toList();

        emit(
          state.copyWith(
            filterJobDescriptions: filteredItems,
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

  Future<void> onRemoveLabour(FarmerWorker worker) async {
    await cmoDatabaseMasterService.removeFarmerWorker(worker.id);
    showSnackSuccess(
      msg: '${LocaleKeys.remove.tr()} ${worker.id}!',
    );

    await loadListWorkers();
  }

  @override
  RteSpeciesDetailState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(RteSpeciesDetailState state) {
    return null;
  }
}
