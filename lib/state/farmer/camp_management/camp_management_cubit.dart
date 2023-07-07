import 'package:cmo/di.dart';
import 'package:cmo/state/farmer/camp_management/camp_management_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CampManagementCubit extends Cubit<CampManagementState> {
  CampManagementCubit(): super(CampManagementState());

  Future init() async {
    final activeFarm = await configService.getActiveFarm();
    final camps = await cmoDatabaseMasterService.getCampByFarmId(activeFarm?.id ?? 0);
    emit(state.copyWith(camps: camps, farm: activeFarm));
  }
}