import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';

part 'rte_species_detail_state.dart';

class RteSpeciesDetailCubit extends HydratedCubit<RteSpeciesDetailState> {
  RteSpeciesDetailCubit({
    RteSpecies? rteSpecies,
  }) : super(
          RteSpeciesDetailState(
            rteSpecies: rteSpecies ??
                RteSpecies(
                  rteSpeciesRegisterNo:
                      DateTime.now().millisecondsSinceEpoch.toString(),
                  isActive: true,
                  isMasterDataSynced: false,
                ),
          ),
        );

  Future<void> init({
    LocationModel? locationModel,
  }) async {
    final activeFarm = await configService.getActiveFarm();
    final animalTypes = await cmoDatabaseMasterService
        .getAnimalTypeByGroupSchemeId(activeFarm?.groupSchemeId ?? 0);
    final speciesRanges = await cmoDatabaseMasterService
        .getSpeciesRangeByGroupSchemeId(activeFarm?.groupSchemeId ?? 0);
    final rtePhotos = await cmoDatabaseMasterService
        .getAllRteSpeciesRegisterPhotoByRteSpeciesRegisterNo(
            state.rteSpecies?.rteSpeciesRegisterNo);
    emit(
      state.copyWith(
        activeFarm: activeFarm,
        speciesRanges: speciesRanges,
        animalTypes: animalTypes,
        rtePhotos: rtePhotos,
        rteSpecies: state.rteSpecies?.copyWith(
          farmId: state.rteSpecies?.farmId ?? activeFarm?.farmId,
          createDT: state.rteSpecies?.createDT ?? DateTime.now(),
          updateDT: DateTime.now(),
        ),
      ),
    );

    if (locationModel != null) {
      onChangeLocationAndPhoto(locationModel);
    }
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
        isCommonNameError: false,
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
        rteSpecies: state.rteSpecies?.copyWith(dateSpotted: dateSpotted),
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

  void onChangeLocationAndPhoto(LocationModel locationModel) {
    if (locationModel.latitude != null) {
      emit(
        state.copyWith(
          rteSpecies: state.rteSpecies?.copyWith(
            longitude: locationModel.longitude,
            latitude: locationModel.latitude,
          ),
        ),
      );
    }

    if (locationModel.listImage.isNotBlank) {
      var randomId = generatorInt32Id();
      final listPhotos = <RteSpeciesPhotoModel>[];
      for (final image in locationModel.listImage) {
        final rtePhoto = RteSpeciesPhotoModel(
          farmId: state.activeFarm?.farmId,
          isMasterdataSynced: false,
          photo: image,
          rteSpeciesRegisterPhotoNo:
              DateTime.now().millisecondsSinceEpoch.toString(),
          rteSpeciesRegisterPhotoId: randomId++,
          rteSpeciesNo: state.rteSpecies?.rteSpeciesRegisterNo,
          rteSpeciesId: state.rteSpecies?.rteSpeciesRegisterId,
          photoName: DateTime.now().millisecondsSinceEpoch.toString(),
          isActive: true,
          isLocal: true,
        );

        listPhotos.add(rtePhoto);
      }

      emit(state.copyWith(rtePhotos: state.rtePhotos + listPhotos));
    }
  }

  void onUpdatePhoto(RteSpeciesPhotoModel rteSpeciesPhotoModel) {
    final rtePhotos = state.rtePhotos;
    rtePhotos.removeWhere((element) => element.rteSpeciesRegisterPhotoNo == rteSpeciesPhotoModel.rteSpeciesRegisterPhotoNo);
    rtePhotos.add(rteSpeciesPhotoModel);
    emit(state.copyWith(rtePhotos: rtePhotos));
  }

  void onRemovePhoto(RteSpeciesPhotoModel rteSpeciesPhotoModel) {
    final rtePhotos = state.rtePhotos;
    rtePhotos.remove(rteSpeciesPhotoModel);
    final removedRtePhotos = <RteSpeciesPhotoModel>[...state.removedRtePhotos];
    removedRtePhotos.add(rteSpeciesPhotoModel);
    emit(
      state.copyWith(
        rtePhotos: rtePhotos,
        removedRtePhotos: removedRtePhotos,
      ),
    );
  }

  bool onValidateRequiredField() {
    if (state.rteSpecies?.commonName == null || state.rteSpecies!.commonName.isBlank) {
      emit(state.copyWith(isCommonNameError: true));
      return false;
    }

    return true;
  }

  Future<void> onSave({
    required VoidCallback onSuccess,
  }) async {
    try {
      if(!onValidateRequiredField()) {
        return;
      }

      emit(state.copyWith(loading: true));
      int? rteSpeciesId;
      rteSpeciesId = await cmoDatabaseMasterService.cacheRteSpecies(
        isDirect: false,
        state.rteSpecies!.copyWith(
          rteSpeciesRegisterNo: state.rteSpecies?.rteSpeciesRegisterNo ??
              DateTime.now().millisecondsSinceEpoch.toString(),
          updateDT: DateTime.now(),
          createDT: state.rteSpecies?.createDT ?? DateTime.now(),
        ),
      );

      for (final item in state.removedRtePhotos) {
        await cmoDatabaseMasterService.removeRteSpeciesPhotoModel(item.id);
      }

      for (final item in state.rtePhotos) {
        await cmoDatabaseMasterService.cacheRteSpeciesPhotoModel(item);
      }

      showSnackSuccess(
        msg:
            '${state.rteSpecies == null ? LocaleKeys.addRteSpecies.tr() : LocaleKeys.edit_rte_species.tr()} $rteSpeciesId',
      );

      onSuccess();
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
