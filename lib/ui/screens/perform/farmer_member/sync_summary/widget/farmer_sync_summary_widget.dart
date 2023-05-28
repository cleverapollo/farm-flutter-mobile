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
            label: 'Unsynced',
            count: data?.workersUnsynced ?? 0,
          ),
          SyncItemWidget(
            label: 'Total Workers',
            count: data?.workersTotal ?? 0,
          ),
        ],
      );
  Widget _buildRegisters(FarmerSyncSummaryModel? data) => Column(
        children: [
          SyncItemWidget(label: widget.type.getLabel, isTitle: true),
          SyncItemWidget(
            label: 'Unsynced Accident and Incident',
            count: data?.accidentAndIncidentUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Accident and Incident',
            count: data?.accidentAndIncidentTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced Accident and Incident Property Damaged',
            count: data?.accidentAndIncidentPropertyDamagedUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Accident and Incident Property Damaged',
            count: data?.accidentAndIncidentPropertyDamagedTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced ASI',
            count: data?.asiUnsynced,
          ),
          SyncItemWidget(
            label: 'Total ASI',
            count: data?.asiTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced ASI Photos',
            count: data?.asiPhotosUnsynced,
          ),
          SyncItemWidget(
            label: 'Total ASI Photos',
            count: data?.asiPhotosTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced Biological Control Agents',
            count: data?.biologicalControlAgentsUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Biological Control Agents',
            count: data?.biologicalControlAgentsTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced Chemicals',
            count: data?.chemicalsUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Chemicals',
            count: data?.chemicalsTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced Disciplinaries',
            count: data?.disciplinariesUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Disciplinaries',
            count: data?.disciplinariesTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced Stakeholder Complaints',
            count: data?.stakeholderComplaintsUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Stakeholder Complaint',
            count: data?.stakeholderComplaintsTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced Employee Grievances',
            count: data?.employeeGrievancesUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Employee Grievances',
            count: data?.employeeGrievancesTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced Fire',
            count: data?.fireUnsynced,
          ),
          SyncItemWidget(
            label: 'Total Fire',
            count: data?.fireTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced Pets and Disease',
            count: data?.petsAndDiseaseUnsyced,
          ),
          SyncItemWidget(
            label: 'Total Pets and Disease',
            count: data?.petsAndDiseaseTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced Pets and Disease Treatment Methods',
            count: data?.petsAndDiseaseTreatmentMethodsUnsyced,
          ),
          SyncItemWidget(
            label: 'Total Pets and Disease Treatment Methods',
            count: data?.petsAndDiseaseTreatmentMethodsTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced RTE Species Registers',
            count: data?.rteSpeciesRegistersUnsynced,
          ),
          SyncItemWidget(
            label: 'Total RTE Species Registers',
            count: data?.rteSpeciesRegistersTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced RTE Species Registers Photos',
            count: data?.rteSpeciesRegistersPhotosUnsynced,
          ),
          SyncItemWidget(
            label: 'Total RTE Species Registers Photos',
            count: data?.rteSpeciesRegistersPhotosTotal,
          ),
          SyncItemWidget(
            label: 'Unsynced Training',
            count: data?.trainingUnsynced,
          ),
          SyncItemWidget(
            label: 'Total ',
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
