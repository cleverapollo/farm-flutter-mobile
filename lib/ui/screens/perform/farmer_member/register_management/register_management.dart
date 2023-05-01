import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/aai/aai_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/asi/asi_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/biological_control_agents/biological_control_agents_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/chemicals/chemicals_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/disciplinaries/disciplinaries_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/pets_and_disease/pets_and_disease_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/employee_grievance/employee_grievance_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/fire/fire_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/stake_holder_complaint/stake_holder_complaint_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/training/training_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/stake_holder_management_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class RegisterManagement extends StatelessWidget {
  static final RegisterManagementModel _registerManagementModel =
      RegisterManagementModel()
        ..accident_incidents = 10
        ..asi = 14
        ..biological_control_agents = 15
        ..chemicals = 43
        ..disciplinaries = 153
        ..employee_grievance = 10
        ..fire = 10
        ..pests_diseases = 10
        ..rte_species = 10
        ..stakeholder_complaints = 10
        ..stakeholder_management = 10
        ..training = 10;

  const RegisterManagement({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const RegisterManagement()));
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _ItemWidget(
                onTapped: () => AAIScreen.push(context),
                title: LocaleKeys.accident_incidents.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value: _registerManagementModel.accident_incidents.toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => AsiScreen.push(context),
                title: LocaleKeys.asi.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value: _registerManagementModel.asi.toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => BiologicalControlAgentsScreen.push(context),
                title: LocaleKeys.biological_control_agents.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value: _registerManagementModel.biological_control_agents
                    .toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => ChemicalsScreen.push(context),
                title: LocaleKeys.chemicals.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value: _registerManagementModel.chemicals.toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => DisciplinariesScreen.push(context),
                title: LocaleKeys.disciplinaries.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value: _registerManagementModel.disciplinaries.toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => EmployeeGrievanceScreen.push(context),
                title: LocaleKeys.employee_grievance.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value: _registerManagementModel.employee_grievance.toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => FireManagementScreen.push(context),
                title: LocaleKeys.fire.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value: _registerManagementModel.fire.toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => PetsAndDiseaseScreen.push(context),
                title: LocaleKeys.pests_diseases.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value: _registerManagementModel.pests_diseases.toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => print("Tapped"),
                title: LocaleKeys.rte_species.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value: _registerManagementModel.rte_species.toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => StakeHolderComplaintScreen.push(context),
                title: LocaleKeys.stakeholder_complaints.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value:
                    _registerManagementModel.stakeholder_complaints.toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => StakeHolderManagementScreen.push(context),
                title: LocaleKeys.stakeholder_management.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value:
                    _registerManagementModel.stakeholder_management.toString(),
              ),
              const SizedBox(height: 8),
              _ItemWidget(
                onTapped: () => TrainingScreen.push(context),
                title: LocaleKeys.training.tr(),
                subTitle: LocaleKeys.pending.tr(),
                value: _registerManagementModel.training.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? value;
  final VoidCallback onTapped;

  const _ItemWidget({
    required this.title,
    required this.onTapped,
    this.subTitle,
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.greyLight1,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 8, top: 4, right: 13, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textStyles.bodyBold
                        .apply(color: context.colors.blue),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          subTitle ?? '',
                          style: context.textStyles.bodyNormal,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          value ?? '',
                          style: context.textStyles.bodyNormal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Assets.icons.icArrowRight.svgBlack,
          ],
        ),
      ),
    );
  }
}

class RegisterManagementModel {
  int? accident_incidents;
  int? asi;
  int? biological_control_agents;
  int? chemicals;
  int? disciplinaries;
  int? employee_grievance;
  int? fire;
  int? pests_diseases;
  int? rte_species;
  int? stakeholder_complaints;
  int? stakeholder_management;
  int? training;
}
