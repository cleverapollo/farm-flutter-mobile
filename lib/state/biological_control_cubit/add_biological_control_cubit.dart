import 'package:cmo/model/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cmo/di.dart';
import 'package:cmo/ui/snack/snack_helper.dart';

part 'add_biological_control_state.dart';

class AddBiologicalControlCubit extends Cubit<AddBiologicalControlState> {
  AddBiologicalControlCubit({
    required BiologicalControlAgent agent,
    required bool isAddNew,
  }) : super(
          AddBiologicalControlState(
            agent: agent,
            isAddNew: isAddNew,
            isDataReady: false,
          ),
        ) {
    onInit();
  }

  Future<void> onInit() async {
    try {
      final stakeHolders = <StakeHolder>[];
      final farm = await configService.getActiveFarm();

      final monitorings = await cmoDatabaseMasterService
          .getMonitoringRequirementByGroupSchemeId(farm?.groupSchemeId ?? 0);

      final agentTypes = await cmoDatabaseMasterService
          .getBiologicalControlAgentTypeByGroupSchemeId(
        farm?.groupSchemeId ?? 0,
      );

      final farmStakeHolders = await cmoDatabaseMasterService
          .getFarmStakeHolderByFarmId(farm?.farmId ?? '');

      for (final item in farmStakeHolders) {
        final stakeholders = await cmoDatabaseMasterService
            .getStakeHoldersByStakeHolderId(item.stakeHolderId ?? '');
        stakeHolders.addAll(stakeholders);
      }

      emit(
        state.copyWith(
          isDataReady: true,
          stakeHolders: stakeHolders,
          monitorings: monitorings,
          agentTypes: agentTypes,
        ),
      );
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(isDataReady: true));
    }
  }

  void onSelectControlAgent(BiologicalControlAgentType agentType) {
    emit(
      state.copyWith(
        isSelectControlAgentError: false,
        agent: state.agent.copyWith(
          biologicalControlAgentTypeId: agentType.biologicalControlAgentTypeId,
          biologicalControlAgentTypeName: agentType.biologicalControlAgentTypeName,
          biologicalControlAgentTypeCountryName: agentType.countryId.toString(),
          reasonForBioAgent: agentType.reasonForBioAgent,
          biologicalControlAgentTypeScientificName: agentType.biologicalControlAgentTypeScientificName,
        ),
      ),
    );
  }

  void onCarRaisedDateChanged(bool isSelected) {
    if (isSelected) {
      emit(
        state.copyWith(
          agent: state.agent.copyWith(
            carRaisedDate: DateTime.now().toIso8601String(),
          ),
        ),
      );
    } else {
      emit(state.copyWith(agent: state.agent.clearCARData(carRaised: true)));
    }
  }

  void onCarClosedDateChanged(bool isSelected) {
    if (isSelected) {
      emit(
        state.copyWith(
          agent: state.agent.copyWith(
            carClosedDate: DateTime.now().toIso8601String(),
          ),
        ),
      );
    } else {
      emit(state.copyWith(agent: state.agent.clearCARData(carClosed: true)));
    }
  }

  void onDateReleasedChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        agent: state.agent.copyWith(
          dateReleased: dateTime,
        ),
      ),
    );
  }

  void onStakeHolderChanged(StakeHolder? stakeHolder) {
    state.agent = state.agent.copyWith(
      stakeholderId: stakeHolder?.stakeHolderId,
      stakeholderName: stakeHolder?.stakeholderName,
    );
  }

  void onMonitoringChanged(MonitoringRequirement? monitoring) {
    state.agent = state.agent.copyWith(
      monitoringRequirementId: monitoring?.monitoringRequirementId,
      monitoringRequirementName: monitoring?.monitoringRequirementName,
    );

    emit(state.copyWith(
        agent: state.agent.copyWith(
          monitoringRequirementId: monitoring?.monitoringRequirementId,
          monitoringRequirementName: monitoring?.monitoringRequirementName,
        )
    ));

  }

  void onCommentChanged(String? comment) {
    state.agent = state.agent.copyWith(
      comment: comment,
    );
  }

  bool onValidateRequiredField() {
    if (state.agent.biologicalControlAgentTypeId == null) {
      emit(state.copyWith(isSelectControlAgentError: true));
      return false;
    }

    return true;
  }

  Future<bool> onSave() async {
    if (!onValidateRequiredField()) {
      return false;
    }

    final farm = await configService.getActiveFarm();
    var agent = state.agent;

    agent = agent.copyWith(
      farmId: farm?.farmId,
      isActive: true,
      isMasterDataSynced: false,
    );

    emit(state.copyWith(agent: agent));
    await cmoDatabaseMasterService.cacheBiologicalControlAgentsFromFarm(agent);
    return true;
  }
}
