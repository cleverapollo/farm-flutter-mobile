import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
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
        rteSpecies: state.rteSpecies?.copyWith(
          farmId: state.rteSpecies?.farmId ?? activeFarm?.farmId,
        ),
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

  Future<void> onSave() async {
    try {
      emit(state.copyWith(loading: true));
      int? rteSpeciesId;
      await (await cmoDatabaseMasterService.db).writeTxn(() async {
        rteSpeciesId = await cmoDatabaseMasterService.cacheRteSpecies(
          state.rteSpecies!.copyWith(
            rteSpeciesRegisterNo: state.rteSpecies?.rteSpeciesRegisterNo ??
                DateTime.now().millisecondsSinceEpoch.toString(),
          ),
        );

        // for (final item in rtePhotos) {
        //   futures.add(cmoDatabaseMasterService.cacheRteSpeciesPhotoModel(
        //       item.copyWith(rteSpeciesNo: rteSpecies.rteSpeciesRegisterNo)));
        // }
      });

      showSnackSuccess(
        msg: '${state.rteSpecies == null ? LocaleKeys.addRteSpecies.tr() : 'Edit RTE Species'} $rteSpeciesId',
      );
    } catch (e) {
      logger.e('Cannot save RTE species $e');
    } finally {
      emit(state.copyWith(loading: false));
    }
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
