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
            label: 'Unsynced',
            count: data?.annualProductionUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Annual Productions',
            count: data?.annualProductionTotal,
          ),
        ],
      );
  Widget _buildAnnualBudgets(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: 'Unsynced',
            count: data?.annualBudgetsProductionUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Annual Budgets Productions',
            count: data?.annualBudgetsProductionTotal,
          ),
        ],
      );
  Widget _buildAnnualBudgetTransactions(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: 'Unsynced',
            count: data?.annualBudgetTransactionsUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Annual Budgets Productions',
            count: data?.annualBudgetTransactionsTotal,
          ),
        ],
      );
  Widget _buildCamps(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: 'Unsynced',
            count: data?.campsUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Camps',
            count: data?.campsTotal,
          ),
        ],
      );
  Widget _buildScheduler(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: 'Unsynced',
            count: data?.schedulerUnsynced,
          ),
          SyncItemWidget(
            label: 'Upcoming Events',
            count: data?.upcomingEvent,
          ),
        ],
      );
  Widget _buildMasterData(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: 'Biological Control Agent Types',
            count: data?.biologicalControlAgentTypes,
          ),
          SyncItemWidget(
            label: 'Annual Farm Budget Transaction Category',
            count: data?.annualFarmBudgetTransactionCategory,
          ),
          SyncItemWidget(
            label: 'ASI Types',
            count: data?.asiType,
          ),
          SyncItemWidget(
            label: 'Chemical Application Methods',
            count: data?.chemicalApplicationMethods,
          ),
          SyncItemWidget(
            label: 'Chemical Types',
            count: data?.chemicalTypes,
          ),
          SyncItemWidget(
            label: 'Countries',
            count: data?.countries,
          ),
          SyncItemWidget(
            label: 'Fire Causes',
            count: data?.fireCause,
          ),
          SyncItemWidget(
            label: 'Gender',
            count: data?.gender,
          ),
          SyncItemWidget(
            label: 'Grievance Issue',
            count: data?.grievanceIssue,
          ),
          SyncItemWidget(
            label: 'Group Scheme',
            count: data?.groupScheme,
          ),
          SyncItemWidget(
            label: 'Disciplinaries Issues',
            count: data?.disciplinariesIssues,
          ),
          SyncItemWidget(
            label: 'Job Description',
            count: data?.jobDescription,
          ),
          SyncItemWidget(
            label: 'Monitoring Requirement',
            count: data?.monitoringRequirement,
          ),
          SyncItemWidget(
            label: 'Nature of Injury',
            count: data?.natureOfInjury,
          ),
          SyncItemWidget(
            label: 'Pets and Disease Type',
            count: data?.petsAndDiseaseType,
          ),
          SyncItemWidget(
            label: 'Pets and Disease Type Treatment Method',
            count: data?.petsAndDiseaseTypeTreatmentMethod,
          ),
          SyncItemWidget(
            label: 'Property Damaged',
            count: data?.propertyDamaged,
          ),
          SyncItemWidget(
            label: 'Reject Reasons',
            count: data?.rejectReasons,
          ),
          SyncItemWidget(
            label: 'Schedule Activity',
            count: data?.scheduleActivity,
          ),
          SyncItemWidget(
            label: 'Species Range',
            count: data?.speciesRange,
          ),
          SyncItemWidget(
            label: 'Species Types',
            count: data?.speciesTypes,
          ),
          SyncItemWidget(
            label: 'Training Type',
            count: data?.trainingType,
          ),
          SyncItemWidget(
            label: 'Treatment Method',
            count: data?.treatmentMethod,
          ),
        ],
      );
  Widget _buildStakeHolder(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: 'Unsynced',
            count: data?.stakeholderUnsynced,
          ),
          SyncItemWidget(
            label: 'Customary Use Rights',
            count: data?.customaryUseRights,
          ),
          SyncItemWidget(
            label: 'Farm Stakeholders',
            count: data?.farmStakeHolders,
          ),
          SyncItemWidget(
            label: 'Group Scheme Stakeholders',
            count: data?.groupSchemeStakeholders,
          ),
          SyncItemWidget(
            label: 'Social Upliftments',
            count: data?.socialUpliftments,
          ),
          SyncItemWidget(
            label: 'Special Sites',
            count: data?.specialSites,
          ),
          SyncItemWidget(
            label: 'Stakeholder Types',
            count: data?.stakeholderTypes,
          ),
        ],
      );
}
