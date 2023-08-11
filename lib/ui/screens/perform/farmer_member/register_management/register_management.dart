import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/register_management/register_management_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/aai/aai_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/asi/asi_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/biological_control_agents/biological_control_agents_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/chemicals/chemicals_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/disciplinaries/disciplinaries_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/pets_and_disease/pets_and_disease_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/employee_grievance/employee_grievance_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/fire/fire_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/rte_species/rte_species_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/stake_holder_complaint/stake_holder_complaint_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/training/training_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/stake_holder_management_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ManagementType {
  accidentIncidents,
  asi,
  biologicalControlAgents,
  chemicals,
  disciplinaries,
  employeeGrievance,
  fire,
  pestsDiseases,
  rteSpecies,
  stakeholderComplaints,
  stakeholderManagement,
  training,
}

class RegisterManagement extends StatefulWidget {
  const RegisterManagement({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => RegisterManagementCubit(),
          child: const RegisterManagement(),
        ),
      ),
    );
  }
  @override
  State<RegisterManagement> createState() => _RegisterManagementState();
}

class _RegisterManagementState extends State<RegisterManagement> {
  late final RegisterManagementCubit cubit;

  int _blocSelector(ManagementType type, RegisterManagementState state) {
    switch (type) {
      case ManagementType.accidentIncidents:
        return state.accidentIncidents;
      case ManagementType.asi:
        return state.asi;
      case ManagementType.biologicalControlAgents:
        return state.biologicalControlAgents;
      case ManagementType.chemicals:
        return state.chemicals;
      case ManagementType.disciplinaries:
        return state.disciplinaries;
      case ManagementType.employeeGrievance:
        return state.employeeGrievance;
      case ManagementType.fire:
        return state.fire;
      case ManagementType.pestsDiseases:
        return state.pestsDiseases;
      case ManagementType.rteSpecies:
        return state.rteSpecies;
      case ManagementType.stakeholderComplaints:
        return state.stakeholderComplaints;
      case ManagementType.stakeholderManagement:
        return state.stakeholderManagement;
      case ManagementType.training:
        return state.training;
    }
  }

  Future<void> _onNavigateTo(BuildContext context, ManagementType type) async {
    switch (type) {
      case ManagementType.accidentIncidents:
        await AAIScreen.push(context);
        break;
      case ManagementType.asi:
        await AsiScreen.push(context);
        break;
      case ManagementType.biologicalControlAgents:
        await BiologicalControlAgentsScreen.push(context);
        break;
      case ManagementType.chemicals:
        await ChemicalsScreen.push(context);
        break;
      case ManagementType.disciplinaries:
        await DisciplinariesScreen.push(context);
        break;
      case ManagementType.employeeGrievance:
        await EmployeeGrievanceScreen.push(context);
        break;
      case ManagementType.fire:
        await FireManagementScreen.push(context);
        break;
      case ManagementType.pestsDiseases:
        await PetsAndDiseaseScreen.push(context);
        break;
      case ManagementType.rteSpecies:
        await RteSpeciesScreen.push(context);
        break;
      case ManagementType.stakeholderComplaints:
        await StakeHolderComplaintScreen.push(context);
        break;
      case ManagementType.stakeholderManagement:
        await StakeHolderManagementScreen.push(context);
        break;
      case ManagementType.training:
        await TrainingScreen.push(context);
        break;
    }
    cubit.onRefreshItems(type);
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<RegisterManagementCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.register_management.tr(),
        showLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocSelector<RegisterManagementCubit, RegisterManagementState,
            bool>(
          selector: (state) => state.isDataReady,
          builder: (context, isDataReady) {
            if (!isDataReady) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildItem(
                    context: context,
                    type: ManagementType.accidentIncidents,
                    title: LocaleKeys.accident_incidents.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.asi,
                    title: LocaleKeys.asi.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.biologicalControlAgents,
                    title: LocaleKeys.biological_control_agents.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.chemicals,
                    title: LocaleKeys.chemicals.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.disciplinaries,
                    title: LocaleKeys.disciplinaries.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.employeeGrievance,
                    title: LocaleKeys.employee_grievance.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.fire,
                    title: LocaleKeys.fire.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.pestsDiseases,
                    title: LocaleKeys.pests_diseases.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.rteSpecies,
                    title: LocaleKeys.rte_species.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.stakeholderComplaints,
                    title: LocaleKeys.stakeholder_complaints.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.stakeholderManagement,
                    title: LocaleKeys.stakeholder_management.tr(),
                  ),
                  _buildItem(
                    context: context,
                    type: ManagementType.training,
                    title: LocaleKeys.training.tr(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required ManagementType type,
    required String title,
  }) {
    return BlocSelector<RegisterManagementCubit, RegisterManagementState, int>(
      selector: (state) => _blocSelector(type, state),
      builder: (context, value) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _ItemWidget(
            onTapped: () => _onNavigateTo(context, type),
            title: title,
            subTitle: LocaleKeys.pending.tr(),
            value: value.toString(),
          ),
        );
      },
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.title,
    required this.onTapped,
    this.subTitle,
    this.value,
  });

  final String title;
  final String? subTitle;
  final String? value;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.blueDark1,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: context.textStyles.bodyBold
                    .apply(color: context.colors.white),
              ),
            ),
            Text(
              value ?? '',
              style: context.textStyles.bodyNormal.copyWith(color: context.colors.white),
            ),
            const SizedBox(width: 32,),
            Assets.icons.icArrowRight.svgWhite,
          ],
        ),
      ),
    );
  }
}
