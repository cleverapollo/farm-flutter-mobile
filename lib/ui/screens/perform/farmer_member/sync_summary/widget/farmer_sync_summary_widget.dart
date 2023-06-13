import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_cubit.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_state.dart';
import 'package:cmo/ui/components/sync_summary_component/sync_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/sync_summary/farmer_sync_summary_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmerSyncSummaryWidget extends StatefulWidget {
  const FarmerSyncSummaryWidget({super.key, required this.type});

  final FarmerSyncSummaryEnum type;

  @override
  State<FarmerSyncSummaryWidget> createState() =>
      _FarmerSyncSummaryWidgetState();
}

class _FarmerSyncSummaryWidgetState extends State<FarmerSyncSummaryWidget> {
  @override
  Widget build(BuildContext context) {
    return _handleBuildWidget();
  }

  Widget _handleBuildWidget() {
    return BlocSelector<FarmerSyncSummaryCubit, FarmerSyncSummaryState,
        FarmerSyncSummaryModel?>(
      selector: (state) => state.data,
      builder: (context, data) {
        switch (widget.type) {
          case FarmerSyncSummaryEnum.workers:
            return _buildWorkers(data);
          case FarmerSyncSummaryEnum.registers:
            return _buildRegisters(data);
          case FarmerSyncSummaryEnum.annualProductions:
            return _buildAnnualProduction(data);
          case FarmerSyncSummaryEnum.annualBudgets:
            return _buildAnnualBudgets(data);
          case FarmerSyncSummaryEnum.annualBudgetTransactions:
            return _buildAnnualBudgetTransactions(data);
          case FarmerSyncSummaryEnum.camps:
            return _buildCamps(data);
          case FarmerSyncSummaryEnum.scheduler:
            return _buildScheduler(data);
          case FarmerSyncSummaryEnum.masterData:
            return _buildMasterData(data);
          case FarmerSyncSummaryEnum.stakeHolder:
            return _buildStakeHolder(data);
          case FarmerSyncSummaryEnum.all:
            return const SizedBox();
        }
      },
    );
  }

  Widget _buildWorkers(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.workersUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_workers.tr(),
            count: data?.workersTotal ?? 0,
          ),
        ],
      );
  Widget _buildRegisters(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced_accident_and_incident.tr(),
            count: data?.accidentAndIncidentUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_accident_and_incident.tr(),
            count: data?.accidentAndIncidentTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_accident_and_incident_property_damaged.tr(),
            count: data?.accidentAndIncidentPropertyDamagedUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_accident_and_incident_property_damaged.tr(),
            count: data?.accidentAndIncidentPropertyDamagedTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_asi.tr(),
            count: data?.asiUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_asi.tr(),
            count: data?.asiTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_asi_photos.tr(),
            count: data?.asiPhotosUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_asi_photos.tr(),
            count: data?.asiPhotosTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_biological_control_agents.tr(),
            count: data?.biologicalControlAgentsUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_biological_control_agents.tr(),
            count: data?.biologicalControlAgentsTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_chemicals.tr(),
            count: data?.chemicalsUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_chemicals.tr(),
            count: data?.chemicalsTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_disciplinaries.tr(),
            count: data?.disciplinariesUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_disciplinaries.tr(),
            count: data?.disciplinariesTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_stakeholder_complaints.tr(),
            count: data?.stakeholderComplaintsUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_stakeholder_complaint.tr(),
            count: data?.stakeholderComplaintsTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_employee_grievances.tr(),
            count: data?.employeeGrievancesUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_employee_grievances.tr(),
            count: data?.employeeGrievancesTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_fire.tr(),
            count: data?.fireUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_fire.tr(),
            count: data?.fireTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_pets_and_disease.tr(),
            count: data?.petsAndDiseaseUnsyced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_pets_and_disease.tr(),
            count: data?.petsAndDiseaseTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_pets_and_disease_treatment_methods.tr(),
            count: data?.petsAndDiseaseTreatmentMethodsUnsyced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_pets_and_disease_treatment_methods.tr(),
            count: data?.petsAndDiseaseTreatmentMethodsTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_rte_species_registers.tr(),
            count: data?.rteSpeciesRegistersUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_rte_species_registers.tr(),
            count: data?.rteSpeciesRegistersTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_rte_species_registers_photos.tr(),
            count: data?.rteSpeciesRegistersPhotosUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_rte_species_registers_photos.tr(),
            count: data?.rteSpeciesRegistersPhotosTotal,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_training.tr(),
            count: data?.trainingUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total.tr(),
            count: data?.trainingTotal,
          ),
        ],
      );
  Widget _buildAnnualProduction(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.annualProductionUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_annual_productions.tr(),
            count: data?.annualProductionTotal,
          ),
        ],
      );
  Widget _buildAnnualBudgets(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.annualBudgetsProductionUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_annual_budgets_productions.tr(),
            count: data?.annualBudgetsProductionTotal,
          ),
        ],
      );
  Widget _buildAnnualBudgetTransactions(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.annualBudgetTransactionsUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_annual_budgets_productions.tr(),
            count: data?.annualBudgetTransactionsTotal,
          ),
        ],
      );
  Widget _buildCamps(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.campsUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_camps.tr(),
            count: data?.campsTotal,
          ),
        ],
      );
  Widget _buildScheduler(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.schedulerUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.upcoming_events.tr(),
            count: data?.upcomingEvent,
          ),
        ],
      );
  Widget _buildMasterData(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.biological_control_agent_types.tr(),
            count: data?.biologicalControlAgentTypes,
          ),
          SyncItemWidget(
            label: LocaleKeys.annual_farm_budget_transaction_category.tr(),
            count: data?.annualFarmBudgetTransactionCategory,
          ),
          SyncItemWidget(
            label: LocaleKeys.asi_types.tr(),
            count: data?.asiType,
          ),
          SyncItemWidget(
            label: LocaleKeys.chemical_application_methods.tr(),
            count: data?.chemicalApplicationMethods,
          ),
          SyncItemWidget(
            label: LocaleKeys.chemical_types.tr(),
            count: data?.chemicalTypes,
          ),
          SyncItemWidget(
            label: LocaleKeys.countries.tr(),
            count: data?.countries,
          ),
          SyncItemWidget(
            label: LocaleKeys.fire_causes.tr(),
            count: data?.fireCause,
          ),
          SyncItemWidget(
            label: LocaleKeys.gender.tr(),
            count: data?.gender,
          ),
          SyncItemWidget(
            label: LocaleKeys.grievance_issue.tr(),
            count: data?.grievanceIssue,
          ),
          SyncItemWidget(
            label: LocaleKeys.group_scheme.tr(),
            count: data?.groupScheme,
          ),
          SyncItemWidget(
            label: LocaleKeys.disciplinaries_issues.tr(),
            count: data?.disciplinariesIssues,
          ),
          SyncItemWidget(
            label: LocaleKeys.job_description.tr(),
            count: data?.jobDescription,
          ),
          SyncItemWidget(
            label: LocaleKeys.monitoring_requirement.tr(),
            count: data?.monitoringRequirement,
          ),
          SyncItemWidget(
            label: LocaleKeys.nature_of_injury.tr(),
            count: data?.natureOfInjury,
          ),
          SyncItemWidget(
            label: LocaleKeys.pets_and_disease_type.tr(),
            count: data?.petsAndDiseaseType,
          ),
          SyncItemWidget(
            label: LocaleKeys.pets_and_disease_type_treatment_method.tr(),
            count: data?.petsAndDiseaseTypeTreatmentMethod,
          ),
          SyncItemWidget(
            label: LocaleKeys.property_damaged.tr(),
            count: data?.propertyDamaged,
          ),
          SyncItemWidget(
            label: LocaleKeys.reject_reasons.tr(),
            count: data?.rejectReasons,
          ),
          SyncItemWidget(
            label: LocaleKeys.schedule_activity.tr(),
            count: data?.scheduleActivity,
          ),
          SyncItemWidget(
            label: LocaleKeys.species_range.tr(),
            count: data?.speciesRange,
          ),
          SyncItemWidget(
            label: LocaleKeys.species_types.tr(),
            count: data?.speciesTypes,
          ),
          SyncItemWidget(
            label: LocaleKeys.training_type.tr(),
            count: data?.trainingType,
          ),
          SyncItemWidget(
            label: LocaleKeys.treatment_method.tr(),
            count: data?.treatmentMethod,
          ),
        ],
      );
  Widget _buildStakeHolder(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.stakeholderUnsynced,
          ),
          SyncItemWidget(
            label: LocaleKeys.customary_use_rights.tr(),
            count: data?.customaryUseRights,
          ),
          SyncItemWidget(
            label: LocaleKeys.farm_stakeholders.tr(),
            count: data?.farmStakeHolders,
          ),
          SyncItemWidget(
            label: LocaleKeys.group_scheme_stakeholders.tr(),
            count: data?.groupSchemeStakeholders,
          ),
          SyncItemWidget(
            label: LocaleKeys.social_upliftments.tr(),
            count: data?.socialUpliftments,
          ),
          SyncItemWidget(
            label: LocaleKeys.special_sites.tr(),
            count: data?.specialSites,
          ),
          SyncItemWidget(
            label: LocaleKeys.stakeholder_types.tr(),
            count: data?.stakeholderTypes,
          ),
        ],
      );
}
