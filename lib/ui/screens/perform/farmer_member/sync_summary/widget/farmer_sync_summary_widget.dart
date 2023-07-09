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
            count: data?.accidentAndIncidentUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_accident_and_incident.tr(),
            count: data?.accidentAndIncidentTotal ?? 0,
          ),
          SyncItemWidget(
            label:
                LocaleKeys.unsynced_accident_and_incident_property_damaged.tr(),
            count: data?.accidentAndIncidentPropertyDamagedUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_accident_and_incident_property_damaged.tr(),
            count: data?.accidentAndIncidentPropertyDamagedTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_asi.tr(),
            count: data?.asiUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_asi.tr(),
            count: data?.asiTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_asi_photos.tr(),
            count: data?.asiPhotosUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_asi_photos.tr(),
            count: data?.asiPhotosTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_biological_control_agents.tr(),
            count: data?.biologicalControlAgentsUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_biological_control_agents.tr(),
            count: data?.biologicalControlAgentsTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_chemicals.tr(),
            count: data?.chemicalsUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_chemicals.tr(),
            count: data?.chemicalsTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_disciplinaries.tr(),
            count: data?.disciplinariesUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_disciplinaries.tr(),
            count: data?.disciplinariesTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_stakeholder_complaints.tr(),
            count: data?.stakeholderComplaintsUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_stakeholder_complaint.tr(),
            count: data?.stakeholderComplaintsTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_employee_grievances.tr(),
            count: data?.employeeGrievancesUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_employee_grievances.tr(),
            count: data?.employeeGrievancesTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_fire.tr(),
            count: data?.fireUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_fire.tr(),
            count: data?.fireTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_pets_and_disease.tr(),
            count: data?.petsAndDiseaseUnsyced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_pets_and_disease.tr(),
            count: data?.petsAndDiseaseTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_pets_and_disease_treatment_methods.tr(),
            count: data?.petsAndDiseaseTreatmentMethodsUnsyced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_pets_and_disease_treatment_methods.tr(),
            count: data?.petsAndDiseaseTreatmentMethodsTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_rte_species_registers.tr(),
            count: data?.rteSpeciesRegistersUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_rte_species_registers.tr(),
            count: data?.rteSpeciesRegistersTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_rte_species_registers_photos.tr(),
            count: data?.rteSpeciesRegistersPhotosUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_rte_species_registers_photos.tr(),
            count: data?.rteSpeciesRegistersPhotosTotal ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.unsynced_training.tr(),
            count: data?.trainingUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total.tr(),
            count: data?.trainingTotal ?? 0,
          ),
        ],
      );
  Widget _buildAnnualProduction(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.annualProductionUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_annual_productions.tr(),
            count: data?.annualProductionTotal ?? 0,
          ),
        ],
      );
  Widget _buildAnnualBudgets(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.annualBudgetsProductionUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_annual_budgets_productions.tr(),
            count: data?.annualBudgetsProductionTotal ?? 0,
          ),
        ],
      );
  Widget _buildAnnualBudgetTransactions(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.annualBudgetTransactionsUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_annual_budgets_productions.tr(),
            count: data?.annualBudgetTransactionsTotal ?? 0,
          ),
        ],
      );
  Widget _buildCamps(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.campsUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.total_camps.tr(),
            count: data?.campsTotal ?? 0,
          ),
        ],
      );
  Widget _buildScheduler(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.schedulerUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.upcoming_events.tr(),
            count: data?.upcomingEvent ?? 0,
          ),
        ],
      );
  Widget _buildMasterData(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.biological_control_agent_types.tr(),
            count: data?.biologicalControlAgentTypes ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.annual_farm_budget_transaction_category.tr(),
            count: data?.annualFarmBudgetTransactionCategory ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.asi_types.tr(),
            count: data?.asiType ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.chemical_application_methods.tr(),
            count: data?.chemicalApplicationMethods ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.chemical_types.tr(),
            count: data?.chemicalTypes ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.countries.tr(),
            count: data?.countries ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.fire_causes.tr(),
            count: data?.fireCause ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.gender.tr(),
            count: data?.gender ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.grievance_issue.tr(),
            count: data?.grievanceIssue ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.group_scheme.tr(),
            count: data?.groupScheme ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.disciplinaries_issues.tr(),
            count: data?.disciplinariesIssues ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.job_description.tr(),
            count: data?.jobDescription ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.monitoring_requirement.tr(),
            count: data?.monitoringRequirement ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.nature_of_injury.tr(),
            count: data?.natureOfInjury ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.pets_and_disease_type.tr(),
            count: data?.petsAndDiseaseType ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.pets_and_disease_type_treatment_method.tr(),
            count: data?.petsAndDiseaseTypeTreatmentMethod ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.property_damaged.tr(),
            count: data?.propertyDamaged ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.reject_reasons.tr(),
            count: data?.rejectReasons ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.schedule_activity.tr(),
            count: data?.scheduleActivity ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.species_range.tr(),
            count: data?.speciesRange ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.species_types.tr(),
            count: data?.speciesTypes ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.training_type.tr(),
            count: data?.trainingType ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.treatment_method.tr(),
            count: data?.treatmentMethod ?? 0,
          ),
        ],
      );
  Widget _buildStakeHolder(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: LocaleKeys.unsynced.tr(),
            count: data?.stakeholderUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.customary_use_rights.tr(),
            count: data?.customaryUseRights ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.farm_stakeholders.tr(),
            count: data?.farmStakeHolders ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.group_scheme_stakeholders.tr(),
            count: data?.groupSchemeStakeholders ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.social_upliftments.tr(),
            count: data?.socialUpliftments ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.special_sites.tr(),
            count: data?.specialSites ?? 0,
          ),
          SyncItemWidget(
            label: LocaleKeys.stakeholder_types.tr(),
            count: data?.stakeholderTypes ?? 0,
          ),
        ],
      );
}
