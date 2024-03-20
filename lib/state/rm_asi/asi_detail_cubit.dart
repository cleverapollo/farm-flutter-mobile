import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/components/select_location/select_location_screen.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmo/state/rm_asi/asi_detail_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AsiDetailCubit extends Cubit<AsiDetailState> {
  AsiDetailCubit({
    Asi? asi,
    String? farmId,
    String? campId,
  }) : super(
          AsiDetailState(
            asi: asi ?? Asi(
              farmId: farmId,
              campId: campId,
              date: DateTime.now(),
              asiRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
            ),
          ),
        ) {
    fetchData();
  }

  Future<void> fetchData() async {
    final userRole = await configService.getActiveUserRole();

    var asiTypes = <AsiType>[];
    switch (userRole) {
      case UserRoleEnum.regionalManager:
        final activeGroupScheme = await configService.getActiveGroupScheme();
        asiTypes = await cmoDatabaseMasterService.getAsiTypeByGroupSchemeId(activeGroupScheme?.groupSchemeId);
        break;
      case UserRoleEnum.farmerMember:
        final activeFarm = await configService.getActiveFarm();
        asiTypes = await cmoDatabaseMasterService.getAsiTypeByGroupSchemeId(activeFarm?.groupSchemeId);
        break;
      case UserRoleEnum.behave:
      default:
        break;
    }

    if (state.asi.asiTypeId != null) {
      final selectedAsiType = asiTypes.firstWhereOrNull(
          (element) => element.asiTypeId == state.asi.asiTypeId);
      emit(
        state.copyWith(
          asi: state.asi.copyWith(asiTypeName: selectedAsiType?.asiTypeName),
        ),
      );
    }

    final compartments = await cmoDatabaseMasterService.getCompartmentByFarmId(
      state.asi.farmId ?? '',
    );

    if (state.asi.latitude != null &&
        state.asi.longitude != null &&
        compartments.isNotBlank &&
        state.asi.managementUnitId.isBlank) {
      final initCompartment = compartments.firstWhereOrNull((compartment) {
        final latLng = LatLng(
          state.asi.latitude!,
          state.asi.longitude!,
        );

        final polygons = compartment.getPolygonLatLng();
        return MapUtils.checkPositionInsidePolygon(latLng: latLng, polygon: polygons);
      });

      if (initCompartment != null) {
        onCompartmentChanged(initCompartment);
      }
    }

    final listAsiPhotos = await cmoDatabaseMasterService.getAllAsiPhotoByAsiRegisterNo(state.asi.asiRegisterNo);

    emit(
      state.copyWith(
        types: asiTypes,
        userRole: userRole,
        compartments: compartments,
        listAsiPhotos: listAsiPhotos,
      ),
    );
  }

  bool reactMaximumUploadedPhoto() {
    return state.listAsiPhotos.length >= Constants.MAX_UPLOADED_REGISTER_PHOTOS;
  }

  void onUpdatePhoto(String base64Image) {
    final asiPhoto = AsiPhoto(
      photo: base64Image,
      asiRegisterPhotoNo: generatorInt32Id().toString(),
      asiRegisterNo: state.asi.asiRegisterNo,
      asiRegisterId: state.asi.asiRegisterId,
      isMasterdataSynced: false,
      isActive: true,
      createDT: DateTime.now(),
      updateDT: DateTime.now(),
    );

    emit(
      state.copyWith(
        listAsiPhotos: state.listAsiPhotos + [asiPhoto],
      ),
    );
  }

  void onRemovePhoto(int? asiRegisterPhotoNo) {
    final removedPhoto = state.listAsiPhotos.firstWhereOrNull((element) => element.asiRegisterPhotoNo == asiRegisterPhotoNo?.toString());
    if (removedPhoto != null) {
      final listAsiPhotos = List<AsiPhoto>.from(state.listAsiPhotos);
      final removedPhotos = List<AsiPhoto>.from(state.removedPhotos);
      removedPhotos.add(removedPhoto);
      listAsiPhotos.remove(removedPhoto);

      emit(
        state.copyWith(
          listAsiPhotos: listAsiPhotos,
          removedPhotos: removedPhotos,
        ),
      );
    }
  }

  Future<void> saveAsi() async {
    try {
      emit(state.copyWith(isLoading: true));
      await cmoDatabaseMasterService.cacheAsi(
        state.asi.copyWith(
          isMasterdataSynced: false,
          createDT: state.asi.createDT ?? DateTime.now(),
          updateDT: DateTime.now(),
        ),
      );

      if (state.listAsiPhotos.isNotBlank) {
        for (final asiPhoto in state.listAsiPhotos) {
          await cmoDatabaseMasterService.cacheAsiPhoto(
            asiPhoto.copyWith(
              asiRegisterNo: state.asi.asiRegisterNo,
              asiRegisterId: state.asi.asiRegisterId,
              isMasterdataSynced: false,
            ),
          );
        }
      }

      if (state.removedPhotos.isNotBlank) {
        for (final asiPhoto in state.removedPhotos) {
          if (asiPhoto.isMasterdataSynced ?? false) {
            await cmoDatabaseMasterService.cacheAsiPhoto(
              asiPhoto.copyWith(
                asiRegisterNo: state.asi.asiRegisterNo,
                asiRegisterId: state.asi.asiRegisterId,
                isMasterdataSynced: false,
                isActive: false,
              ),
            );
          } else {
            await cmoDatabaseMasterService.removeAsiPhoto(asiPhoto.id);
          }
        }
      }

    } catch (e) {
      logger.e('Cannot saveASI $e');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onCommentChanged(String? comment) {
    state.asi = state.asi.copyWith(comment: comment);
  }

  void onCompartmentChanged(Compartment? compartment) {
    emit(
      state.copyWith(
        asi: state.asi.copyWith(
          managementUnitId: compartment?.managementUnitId,
          compartmentName: compartment?.unitNumber,
          localCompartmentId: compartment?.localCompartmentId,
        ),
      ),
    );
  }

  void onAsiTypeChanged({
    required int? asiTypeId,
    required String? asiTypeName,
  }) {
    emit(
      state.copyWith(
        asi: state.asi.copyWith(
          asiTypeId: asiTypeId,
          asiTypeName: asiTypeName,
        ),
      ),
    );
  }

  void onDateChanged(DateTime? date) {
    emit(
      state.copyWith(
        asi: state.asi.copyWith(date: date),
      ),
    );
  }

  void onSelectLocation(Asi asi) {
    emit(state.copyWith(asi: asi));
    final selectedCompartment = state.compartments.firstWhereOrNull((element) => element.localCompartmentId == asi.localCompartmentId);
    if (selectedCompartment != null) {
      onCompartmentChanged(selectedCompartment);
    }
  }
}
