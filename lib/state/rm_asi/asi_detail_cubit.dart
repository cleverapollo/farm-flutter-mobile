import 'package:cmo/di.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'asi_detail_state.dart';

class AsiDetailCubit extends Cubit<AsiDetailState> {
  AsiDetailCubit(
    String farmId, {
    LocationModel? locationModel,
  }) : super(AsiDetailState(
          farmId: farmId,
          locationModel: locationModel,
        ));

  Future fetchData() async {
    final types = await cmoPerformApiService.fetchRMAsiType();
    emit(state.copyWith(types: types));
  }

  Future saveAsi(Asi asi) async {
    final asiId = DateTime.now().millisecondsSinceEpoch.toString();
    final savingAsi = asi.copyWith(
      farmId: state.farmId,
      latitude: state.locationModel?.latitude,
      longitude: state.locationModel?.longitude,
      isActive: true,
      asiRegisterId: asiId,
    );
    await cmoDatabaseMasterService.cacheAsi(savingAsi);
    await cmoDatabaseMasterService.cacheAsiPhoto(
      AsiPhoto(
        asiRegisterPhotoId: DateTime.now().millisecondsSinceEpoch,
        asiRegisterId: asiId,
        photo: state.locationModel?.imageUri,
      ),
    );
  }
}
