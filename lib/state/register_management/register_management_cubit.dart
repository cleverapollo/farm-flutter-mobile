import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/cmo_database_master_service.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'register_management_state.dart';

class RegisterManagementCubit extends Cubit<RegisterManagementState> {
  RegisterManagementCubit()
      : super(
          RegisterManagementState(),
        ) {
    _onInit();
  }

  final masterService = CmoDatabaseMasterService();
  Future<void> _onInit() async {
    try {
      final farm = await configService.getActiveFarm();
      final farmId = farm?.farmId ?? '';
      final aaiCount = await masterService.getCountAccidentAndIncidentRegistersByFarmId(farmId);
      final asiCount = await masterService.getCountAsiRegisterByFarmId(farmId);
      final accidentIncidentsCount = await masterService.getCountBiologicalControlAgentByFarmId(farmId);
      final employeeGrievanceCount = await masterService.getCountEmployeeGrievancesByFarmId(farmId);

      emit(
        state.copyWith(
          isDataReady: true,
          accidentIncidents: aaiCount,
          asi: asiCount,
          biologicalControlAgents: accidentIncidentsCount,
          employeeGrievance: employeeGrievanceCount,
          farmId: farmId,
        ),
      );
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(isDataReady: true));
    }
  }

  Future<void> onCountAsi() async {
    final asiCount = await masterService.getCountAsiRegisterByFarmId(state.farmId);
    emit(
      state.copyWith(
        asi: asiCount,
      ),
    );
  }
  Future<void> onCountAAI() async {
    final aaiCount = await masterService.getCountAccidentAndIncidentRegistersByFarmId(state.farmId);
    emit(
      state.copyWith(
        accidentIncidents: aaiCount,
      ),
    );
  }

  Future<void> onCountBiologicalControlAgent() async {
    final accidentIncidentsCount = await masterService.getCountBiologicalControlAgentByFarmId(state.farmId);
    emit(
      state.copyWith(
        accidentIncidents: accidentIncidentsCount,
      ),
    );
  }

  Future<void> onCountEmployeeGrievance() async {
    final employeeGrievanceCount = await masterService.getCountEmployeeGrievancesByFarmId(state.farmId);
    emit(
      state.copyWith(
        employeeGrievance: employeeGrievanceCount,
      ),
    );
  }

}
