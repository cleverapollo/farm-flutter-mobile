import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'asi_detail_state.dart';

class AsiDetailCubit extends Cubit<AsiDetailState> {
  AsiDetailCubit(
    String farmId, {
    LocationModel? locationModel,
    String? campId,
  }) : super(AsiDetailState(
          farmId: farmId,
          locationModel: locationModel,
          campId: campId,
        ));

  Future fetchData() async {
    final userRole = await configService.getActiveUserRole();
    List<AsiType>? types;
    if (userRole == UserRoleEnum.farmerMember) {
      types = await cmoPerformApiService.fetchFarmerAsiType();
    } else {
      types = await cmoPerformApiService.fetchRMAsiType();
    }

    final compartments = await cmoDatabaseMasterService.getCompartmentByFarmId(state.farmId);
    emit(
      state.copyWith(
        types: types,
        compartments: compartments,
      ),
    );
  }

  Future<void> saveAsi(
    Asi asi,
    String? imageUri,
  ) async {
    final asiId = DateTime.now().millisecondsSinceEpoch.toString();
    final savingAsi = asi.copyWith(
      farmId: state.farmId,
      campId: state.campId,
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
