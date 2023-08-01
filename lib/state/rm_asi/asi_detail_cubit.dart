import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmo/state/rm_asi/asi_detail_state.dart';

class AsiDetailCubit extends Cubit<AsiDetailState> {
  AsiDetailCubit({
    required Asi asi,
    required LocationModel? locationModel,
  }) : super(
          AsiDetailState(
            asi: asi,
            locationModel: locationModel,
          ),
        );

  Future<void> fetchData() async {
    final userRole = await configService.getActiveUserRole();

    List<AsiType>? types;
    if (userRole == UserRoleEnum.farmerMember) {
      types = await cmoPerformApiService.fetchFarmerAsiType();
    } else {
      types = await cmoPerformApiService.fetchRMAsiType();
    }

    final compartments = await cmoDatabaseMasterService.getCompartmentByFarmId(
      state.asi.farmId ?? '',
    );
    emit(
      state.copyWith(
        types: types,
        compartments: compartments,
      ),
    );
  }

  Future<void> saveAsi(
    List<String>? listImage,
  ) async {
    var asiId = state.asi.asiRegisterId;
    asiId ??= DateTime.now().millisecondsSinceEpoch.toString();
    state.asi = state.asi.copyWith(
      isActive: true,
      asiRegisterId: asiId,
    );
    await cmoDatabaseMasterService.cacheAsi(state.asi);
    await cmoDatabaseMasterService.cacheAsiPhoto(
      AsiPhoto(
        asiRegisterPhotoId: DateTime.now().millisecondsSinceEpoch,
        asiRegisterId: asiId,
        photo: state.locationModel?.imageUri,
        asiRegisterPhotoNo: state.photoName,
      ),
    );

    // if (listImage.isNotBlank) {
    //   for (final image in listImage!) {
    //     await cmoDatabaseMasterService.cacheAsiPhoto(
    //       AsiPhoto(
    //         asiRegisterPhotoId: DateTime.now().millisecondsSinceEpoch,
    //         asiRegisterId: asiId,
    //         photo: image,
    //       ),
    //     );
    //   }
    // }
  }

  void onPhotoNameChanged(String text) {
    emit(state.copyWith(photoName: text));
  }

  void onCommentChanged({required String? comment}) {
    state.asi = state.asi.copyWith(comment: comment);
  }

  void onAsiRegisterNoChanged({required String? asiRegisterNo}) {
    state.asi = state.asi.copyWith(asiRegisterNo: asiRegisterNo);
  }

  void onCompartmentChanged({
    required int? compartmentId,
    required String? compartmentName,
  }) {
    emit(
      state.copyWith(
        asi: state.asi.copyWith(
          compartmentId: compartmentId,
          compartmentName: compartmentName,
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

  void onRemoveLocationImageUri() {
    final location = state.locationModel;
    location?.imageUri = null;
    emit(
      state.copyWith(locationModel: location),
    );
  }

  void onRemoveLocationImage(String image) {
    final location = state.locationModel;
    location?.listImage.remove(image);
    emit(
      state.copyWith(locationModel: location),
    );
  }

  void onUpdateLocationImage(String image) {
    final location = state.locationModel;
    location?.imageUri = image;
    emit(
      state.copyWith(locationModel: location),
    );
  }
}
