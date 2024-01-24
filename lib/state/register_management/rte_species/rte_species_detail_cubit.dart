import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:cmo/ui/components/select_location/select_location_screen.dart';
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
        ) {
    init();
  }

  Future<void> init() async {
    final activeFarm = await configService.getActiveFarm();
    final animalTypes = await cmoDatabaseMasterService
        .getAnimalTypeByGroupSchemeId(activeFarm?.groupSchemeId ?? 0);
    final speciesRanges = await cmoDatabaseMasterService
        .getSpeciesRangeByGroupSchemeId(activeFarm?.groupSchemeId ?? 0);
    final rtePhotos = await cmoDatabaseMasterService
        .getAllRteSpeciesRegisterPhotoByRteSpeciesRegisterNo(
            state.rteSpecies?.rteSpeciesRegisterNo);

    final groupSchemeMasterSpecies = await cmoDatabaseMasterService.getAllGroupSchemeMasterSpecies();
    final selectedGroupSchemeMasterSpecies = groupSchemeMasterSpecies.firstWhereOrNull((element) => element.groupSchemeMasterSpeciesId == state.rteSpecies?.groupSchemeMasterSpeciesId);

    emit(
      state.copyWith(
        activeFarm: activeFarm,
        speciesRanges: speciesRanges,
        animalTypes: animalTypes,
        rtePhotos: rtePhotos,
        groupSchemeMasterSpecies: groupSchemeMasterSpecies,
        filterGroupSchemeMasterSpecies: groupSchemeMasterSpecies,
        selectedGroupSchemeMasterSpecies: selectedGroupSchemeMasterSpecies,
        rteSpecies: state.rteSpecies?.copyWith(
          farmId: state.rteSpecies?.farmId ?? activeFarm?.farmId,
          createDT: state.rteSpecies?.createDT ?? DateTime.now(),
          updateDT: DateTime.now(),
        ),
      ),
    );
  }

  Future<void> updateSelectedGroupSchemeMasterSpecies(
    GroupSchemeMasterSpecies groupSchemeMasterSpecies,
  ) async {
    emit(
      state.copyWith(
        selectedGroupSchemeMasterSpecies: groupSchemeMasterSpecies,
        filterGroupSchemeMasterSpecies: state.groupSchemeMasterSpecies,
        rteSpecies: state.rteSpecies?.copyWith(
          groupSchemeMasterSpeciesId:
              groupSchemeMasterSpecies.groupSchemeMasterSpeciesId,
        ),
      ),
    );
  }

  void searchGroupSchemeMasterSpecies(String? searchText) {
    emit(state.copyWith(loading: true));
    try {
      if (searchText == null || searchText.isEmpty) {
        emit(
          state.copyWith(
            filterGroupSchemeMasterSpecies: state.groupSchemeMasterSpecies,
          ),
        );
      } else {
        final filteredItems = state.groupSchemeMasterSpecies
            .where(
              (element) =>
                  element.commonName
                      ?.toLowerCase()
                      .contains(searchText.toLowerCase()) ??
                  false,
            )
            .toList();

        emit(
          state.copyWith(
            filterGroupSchemeMasterSpecies: filteredItems,
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

  void onChangeLocation(LocationModel locationModel) {
    emit(
      state.copyWith(
        rteSpecies: state.rteSpecies?.copyWith(
          longitude: locationModel.longitude,
          latitude: locationModel.latitude,
        ),
      ),
    );
  }

  void onUpdatePhoto(String base64Image) {
    var randomId = generatorInt32Id();
    final rtePhoto = RteSpeciesRegisterPhoto(
      isMasterdataSynced: false,
      photo: base64Image,
      rteSpeciesRegisterPhotoNo: DateTime.now().millisecondsSinceEpoch.toString(),
      rteSpeciesRegisterPhotoId: randomId++,
      rteSpeciesRegisterNo: state.rteSpecies?.rteSpeciesRegisterNo,
      rteSpeciesRegisterId: state.rteSpecies?.rteSpeciesRegisterId,
      isActive: true,
      createDT: DateTime.now(),
      updateDT: DateTime.now(),
    );

    emit(state.copyWith(rtePhotos: state.rtePhotos + [rtePhoto]));
  }

  void onRemovePhoto(RteSpeciesRegisterPhoto rteSpeciesPhotoModel) {
    final rtePhotos = state.rtePhotos;
    rtePhotos.removeWhere((element) => element.rteSpeciesRegisterPhotoId == rteSpeciesPhotoModel.rteSpeciesRegisterPhotoId);
    emit(
      state.copyWith(
        rtePhotos: rtePhotos,
      ),
    );
  }

  bool onValidateRequiredField() {
    return state.selectedGroupSchemeMasterSpecies != null && state.rteSpecies?.latitude != null;
  }

  Future<void> onSave({
    required void Function(int?) onSuccess,
  }) async {
    try {
      if(!onValidateRequiredField()) {
        return;
      }

      emit(state.copyWith(loading: true));
      await cmoDatabaseMasterService.removeRteSpeciesPhotoModelsByRteSpeciesRegisterNo(state.rteSpecies?.rteSpeciesRegisterNo);

      for (final item in state.rtePhotos) {
        await cmoDatabaseMasterService.cacheRteSpeciesPhotoModel(
          item.copyWith(
            isMasterdataSynced: false,
          ),
        );
      }

      final rteSpeciesId = await cmoDatabaseMasterService.cacheRteSpecies(
        isDirect: false,
        state.rteSpecies!.copyWith(
          isMasterDataSynced: false,
          createDT: state.rteSpecies?.createDT ?? DateTime.now(),
          updateDT: DateTime.now(),
        ),
      );

      onSuccess(rteSpeciesId);
    } catch (e) {
      logger.e('Cannot save RTE species $e');
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  bool reactMaximumUploadedPhoto() {
    return state.rtePhotos.length >= Constants.MAX_UPLOADED_PHOTOS_RTE_SPECIES;
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
