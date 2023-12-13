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
      final disciplinaryCount = await _onCountSanctionRegisters(isRefreshUI: false);
      final trainingCount = await _onCountTraining(isRefreshUI: false);
      final fireCount = await _onCountFire(isRefreshUI: false);
      final pestAndDiseasesCount = await _onCountPestAndDiseases(isRefreshUI: false);
      final rteCount = await _onCountRte(isRefreshUI: false);
      final complaints = await _onCountComplaint(isRefreshUI: false);
      final chemicalCount = await _onCountChemical(isRefreshUI: false);

      emit(
        state.copyWith(
          isDataReady: true,
          accidentIncidents: aaiCount,
          asi: asiCount,
          biologicalControlAgents: biologicalCount,
          employeeGrievance: employeeGrievanceCount,
          training: trainingCount,
          fire: fireCount,
          rteSpecies: rteCount,
          chemicals: chemicalCount,
          disciplinaries: disciplinaryCount,
          stakeholderComplaints: complaints,
          pestsDiseases: pestAndDiseasesCount,
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
        _onCountChemical();
        break;
      case ManagementType.disciplinaries:
        _onCountSanctionRegisters();
        break;
      case ManagementType.employeeGrievance:
        _onCountEmployeeGrievance();
        break;
      case ManagementType.fire:
        _onCountFire();
        break;
      case ManagementType.pestsDiseases:
        _onCountPestAndDiseases();
        break;
      case ManagementType.rteSpecies:
        _onCountRte();
        break;
      case ManagementType.stakeholderComplaints:
        _onCountComplaint();
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

  Future<int> _onCountSanctionRegisters({bool isRefreshUI = true}) async {
    final total = await masterService.getCountSanctionRegistersByFarmId(farmId);
    if (isRefreshUI) {
      emit(
        state.copyWith(
          disciplinaries: total,
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

  Future<int> _onCountFire({bool isRefreshUI = true}) async {
    final total = await masterService.countFireRegistersByFarmId( farmId);
    if (isRefreshUI) {
      emit(
        state.copyWith(
          fire: total,
        ),
      );
    }
    return total;
  }

  Future<int> _onCountPestAndDiseases({bool isRefreshUI = true}) async {
    final total = await masterService.countPestsAndDiseasesByFarmId( farmId);
    if (isRefreshUI) {
      emit(
        state.copyWith(
          pestsDiseases: total,
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
          rteSpecies: total.length,
        ),
      );
    }
    return total.length;
  }

  Future<int> _onCountComplaint({bool isRefreshUI = true}) async {
    final total = await masterService.getComplaintsAndDisputesRegisterByFarmId(farmId);
    if (isRefreshUI) {
      emit(
        state.copyWith(
          stakeholderComplaints: total.length,
        ),
      );
    }

    return total.length;
  }

  Future<int> _onCountChemical({bool isRefreshUI = true}) async {
    final total = await masterService.countChemicalRegisterByFarmId(int.tryParse(farmId));
    if (isRefreshUI) {
      emit(
        state.copyWith(
          chemicals: total,
        ),
      );
    }
    return total;
  }

}
