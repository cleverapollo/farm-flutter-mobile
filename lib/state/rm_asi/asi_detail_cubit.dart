import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmo/state/rm_asi/asi_detail_state.dart';
import 'package:maps_toolkit/maps_toolkit.dart';

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
              localId: DateTime.now().millisecondsSinceEpoch,
              asiRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
            ),
          ),
        );

  Future<void> fetchData() async {
    final userRole = await configService.getActiveUserRole();
    final activeGroupScheme = await configService.getActiveGroupScheme();

    List<AsiType>? types;
    if (userRole == UserRoleEnum.farmerMember) {
      types = await cmoPerformApiService.fetchFarmerAsiType();
    } else {
      types = await cmoDatabaseMasterService.getAsiTypeByGroupSchemeId(activeGroupScheme?.groupSchemeId);
    }

    final compartments = await cmoDatabaseMasterService.getCompartmentByFarmId(
      state.asi.farmId ?? '',
    );

    if (state.asi.latitude != null &&
        state.asi.longitude != null &&
        compartments.isNotBlank) {
      final initCompartment = compartments.firstWhereOrNull((compartment) {
        final latLng = LatLng(
          state.asi.latitude!,
          state.asi.longitude!,
        );

        final polygons = compartment.getPolygonLatLng();
        return PolygonUtil.containsLocation(
          latLng,
          polygons,
          false,
        );
      });

      if (initCompartment != null) {
        onCompartmentChanged(initCompartment);
      }
    }

    final listAsiPhotos = await cmoDatabaseMasterService.getAllAsiPhotoByAsiRegisterLocalId(state.asi.localId);

    emit(
      state.copyWith(
        types: types,
        compartments: compartments,
        listAsiPhotos: listAsiPhotos,
      ),
    );
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
              asiRegisterLocalId: state.asi.localId,
              asiRegisterNo: state.asi.asiRegisterNo,
              asiRegisterId: state.asi.asiRegisterId,
              isMasterdataSynced: false,
            ),
          );
        }
      }
    } catch (e) {
      logger.e('Cannot saveASI $e');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onPhotoNameChanged(String text) {
    emit(state.copyWith(photoName: text));
  }

  void onCommentChanged({required String? comment}) {
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

  void onDateChanged({required DateTime? date}) {
    emit(
      state.copyWith(
        asi: state.asi.copyWith(date: date),
      ),
    );
  }

  void onUpdateAsiPhoto(AsiPhoto asiPhoto) {
    final listAsiPhotos = state.listAsiPhotos;
    listAsiPhotos.removeWhere((element) => element.asiRegisterPhotoNo == asiPhoto.asiRegisterPhotoNo);
    listAsiPhotos.add(asiPhoto);
    emit(state.copyWith(listAsiPhotos: listAsiPhotos));
  }

  void onRemoveAsiPhoto(AsiPhoto asiPhoto) {
    final listAsiPhotos = state.listAsiPhotos;
    listAsiPhotos.remove(asiPhoto);
    emit(state.copyWith(listAsiPhotos: listAsiPhotos));
  }

  void onSelectLocation(LocationModel locationModel) {
    emit(
      state.copyWith(
        asi: state.asi.copyWith(
          latitude: locationModel.latitude,
          longitude: locationModel.longitude,
        ),
      ),
    );

    if (locationModel.listImage.isNotBlank) {
      var randomId = generatorInt32Id();

      final listAsiPhotos = <AsiPhoto>[];
      for (final imageBase64 in locationModel.listImage) {
        final asiPhoto = const AsiPhoto().copyWith(
          photo: imageBase64,
          photoName: DateTime.now().microsecondsSinceEpoch.toString(),
          asiRegisterPhotoNo: (randomId++).toString(),
        );

        listAsiPhotos.add(asiPhoto);
      }

      emit(
        state.copyWith(
          listAsiPhotos: state.listAsiPhotos + listAsiPhotos,
        ),
      );
    }
  }
}
