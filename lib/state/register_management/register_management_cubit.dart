import 'package:cmo/di.dart';
import 'package:cmo/service/cmo_database_master_service.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/register_management.dart';
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
  late final String farmId;

  Future<void> _onInit() async {
    try {
      final farm = await configService.getActiveFarm();
      farmId = farm?.farmId ?? '';
      final aaiCount = await _onCountAAI(isRefreshUI: false);
      final asiCount = await _onCountAsi(isRefreshUI: false);
      final biologicalCount = await _onCountBiologicalControlAgent(isRefreshUI: false);
      final employeeGrievanceCount = await _onCountEmployeeGrievance(isRefreshUI: false);
      final trainingCount = await _onCountTraining(isRefreshUI: false);
      final rteCount = await _onCountRte();

      emit(
        state.copyWith(
          isDataReady: true,
          accidentIncidents: aaiCount,
          asi: asiCount,
          biologicalControlAgents: biologicalCount,
          employeeGrievance: employeeGrievanceCount,
          training: trainingCount,
          rteSpecies: rteCount,
        ),
      );
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(isDataReady: true));
    }
  }

  void onRefreshItems(ManagementType type) {
    switch(type) {
      case ManagementType.accidentIncidents:
        _onCountAAI();
        break;
      case ManagementType.asi:
        _onCountAsi();
        break;
      case ManagementType.biologicalControlAgents:
        _onCountBiologicalControlAgent();
        break;
      case ManagementType.chemicals:
        break;
      case ManagementType.disciplinaries:
        break;
      case ManagementType.employeeGrievance:
        _onCountEmployeeGrievance();
        break;
      case ManagementType.fire:
        break;
      case ManagementType.pestsDiseases:
        break;
      case ManagementType.rteSpecies:
        _onCountRte();
        break;
      case ManagementType.stakeholderComplaints:
        break;
      case ManagementType.stakeholderManagement:
        break;
      case ManagementType.training:
        _onCountTraining();
        break;
    }
  }

  Future<int> _onCountAsi({bool isRefreshUI = true}) async {
    final total = await masterService.getCountAsiRegisterByFarmId(farmId);
    if (isRefreshUI) {
      emit(
        state.copyWith(
          asi: total,
        ),
      );
    }
    return total;
  }

  Future<int> _onCountAAI({bool isRefreshUI = true}) async {
    final total = await masterService.getCountAccidentAndIncidentRegistersByFarmId(farmId);
    if (isRefreshUI) {
      emit(
        state.copyWith(
          accidentIncidents: total,
        ),
      );
    }
    return total;
  }

  Future<int> _onCountBiologicalControlAgent({bool isRefreshUI = true}) async {
    final total = await masterService.getCountBiologicalControlAgentByFarmId(farmId);
    if (isRefreshUI) {
      emit(
        state.copyWith(
          biologicalControlAgents: total,
        ),
      );
    }
    return total;
  }

  Future<int> _onCountEmployeeGrievance({bool isRefreshUI = true}) async {
    final total = await masterService.getCountEmployeeGrievancesByFarmId(farmId);
    if (isRefreshUI) {
      emit(
        state.copyWith(
          employeeGrievance: total,
        ),
      );
    }
    return total;
  }

  Future<int> _onCountTraining({bool isRefreshUI = true}) async {
    final total = await masterService.getCountTrainingByFarmId(farmId);
    if (isRefreshUI) {
      emit(
        state.copyWith(
          training: total,
        ),
      );
    }
    return total;
  }
  Future<int> _onCountRte({bool isRefreshUI = true}) async {
    final total = await masterService.getRteSpeciesByFarmId(farmId);
    if (isRefreshUI) {
      emit(
        state.copyWith(
          training: total.length,
        ),
      );
    }
    return total.length;
  }
}
