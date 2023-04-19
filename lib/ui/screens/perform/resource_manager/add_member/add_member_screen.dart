import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_membership_contract_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_chip_item_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_circle_item_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_collapse_title_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class AddMemberScreen extends StatelessWidget {
  const AddMemberScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const AddMemberScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.addMember.tr(),
        subtitle: LocaleKeys.siteName.tr(),
        showTrailing: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 8),
            _SLIMFComplianceWidget(),
            SizedBox(height: 12),
            _MemberPropertyOwnershipWidget(),
            SizedBox(height: 12),
            _MemberDetailsWidget(),
            SizedBox(height: 12),
            _SideDetailsWidget(),
            SizedBox(height: 12),
            _MemberRickAssessmentWidget(),
            SizedBox(height: 12),
            _MemberFarmObjectivesWidget(),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _MemberFarmObjectivesWidget extends StatelessWidget {
  const _MemberFarmObjectivesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CmoCollapseTitle(
        title: 'Member Farm Objectives',
        child: Container(
            height: size.height * 0.8,
            width: double.maxFinite,
            padding: const EdgeInsets.all(12),
            color: context.colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('*Are there any chemical being used on the FME?',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black, fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Spacer(),
                    CmoChipItemWidget(title: 'Primary', isActive: true),
                    SizedBox(width: 4),
                    CmoChipItemWidget(title: 'Secondary'),
                    SizedBox(width: 4),
                    CmoChipItemWidget(title: 'N/A'),
                    Spacer(),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(thickness: 1),
                const SizedBox(height: 8),
                Text('*HCVs present?',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black, fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Spacer(),
                    CmoChipItemWidget(title: 'Primary', isActive: true),
                    SizedBox(width: 4),
                    CmoChipItemWidget(title: 'Secondary'),
                    SizedBox(width: 4),
                    CmoChipItemWidget(title: 'N/A'),
                    Spacer(),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(thickness: 1),
                const SizedBox(height: 8),
                Text('*Rivers on FMU',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black, fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Spacer(),
                    CmoChipItemWidget(title: 'Primary'),
                    SizedBox(width: 4),
                    CmoChipItemWidget(title: 'Secondary', isActive: true),
                    SizedBox(width: 4),
                    CmoChipItemWidget(title: 'N/A'),
                    Spacer(),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(thickness: 1),
                const SizedBox(height: 8),
                Text('*Are there any communities in or neighbouring the FME?',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black, fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Spacer(),
                    CmoChipItemWidget(title: 'Primary'),
                    SizedBox(width: 4),
                    CmoChipItemWidget(title: 'Secondary'),
                    SizedBox(width: 4),
                    CmoChipItemWidget(title: 'N/A', isActive: true),
                    Spacer(),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(thickness: 1),
                const SizedBox(height: 8),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CmoFilledButton(title: 'Finalise Later', onTap: () {}),
                    CmoFilledButton(
                        title: 'Next',
                        onTap: () {
                          AddMemberMembershipContractScreen.push(context);
                        }),
                  ],
                ),
              ],
            )));
  }
}

class _MemberRickAssessmentWidget extends StatelessWidget {
  const _MemberRickAssessmentWidget();

  @override
  Widget build(BuildContext context) {
    return CmoCollapseTitle(
      title: 'Member Risk Assessment',
      showTick: true,
      child: Container(
        padding: const EdgeInsets.all(12),
        color: context.colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('*Are there any chemical being used on the FME?',
                style: context.textStyles.bodyNormal
                    .copyWith(color: context.colors.black, fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Spacer(),
                CmoCircleItem.yes(isActive: true),
                const SizedBox(width: 12),
                CmoCircleItem.no(),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
            Text('*HCVs present?',
                style: context.textStyles.bodyNormal
                    .copyWith(color: context.colors.black, fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Spacer(),
                CmoCircleItem.yes(),
                const SizedBox(width: 12),
                CmoCircleItem.no(isActive: true),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
            Text('*Rivers on FMU',
                style: context.textStyles.bodyNormal
                    .copyWith(color: context.colors.black, fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Spacer(),
                CmoCircleItem.yes(),
                const SizedBox(width: 12),
                CmoCircleItem.no(isActive: true),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
            Text('*Are there any communities in or neighbouring the FME?',
                style: context.textStyles.bodyNormal
                    .copyWith(color: context.colors.black, fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Spacer(),
                CmoCircleItem.yes(),
                const SizedBox(width: 12),
                CmoCircleItem.no(isActive: true),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _SideDetailsWidget extends StatelessWidget {
  const _SideDetailsWidget();

  @override
  Widget build(BuildContext context) {
    return CmoCollapseTitle(
      title: 'Site Details',
      showTick: true,
      child: Container(
        padding: const EdgeInsets.all(12),
        color: context.colors.white,
        child: Column(
          children: [
            const CmoTextField(
              hintText: 'Site Name',
            ),
            const SizedBox(height: 12),
            const CmoTextField(
              hintText: 'Town',
            ),
            const SizedBox(height: 12),
            const CmoDropDownLayoutWidget(title: 'Province'),
            const SizedBox(height: 12),
            const CmoDropDownLayoutWidget(
                title: 'Site Location', showTick: true),
            const SizedBox(height: 12),
            const CmoDropDownLayoutWidget(
                title: 'Compartment/s', showTick: true),
            const SizedBox(height: 12),
            CmoDropDownLayoutWidget(
              title: 'ASI',
              onTap: () {
                ASIScreen.push(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _MemberDetailsWidget extends StatelessWidget {
  const _MemberDetailsWidget();

  @override
  Widget build(BuildContext context) {
    return CmoCollapseTitle(
      title: 'Member Details',
      showTick: true,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12),
        child: const CmoTextField(
          hintText: 'Member Details',
          maxLines: 4,
        ),
      ),
    );
  }
}

class _MemberPropertyOwnershipWidget extends StatelessWidget {
  const _MemberPropertyOwnershipWidget();

  @override
  Widget build(BuildContext context) {
    return CmoCollapseTitle(
      title: 'Member Property ownership',
      showTick: true,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Does the farmer have a title deed, lease or management contract on their property?',
                style: context.textStyles.bodyNormal
                    .copyWith(color: context.colors.black, fontSize: 16)),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, top: 12),
              child: Text('Property type',
                  style: context.textStyles.titleBold
                      .copyWith(color: context.colors.black, fontSize: 16)),
            ),
            const ExpansionTile(title: Text('Tribal Authority')),
          ],
        ),
      ),
    );
  }
}

class _SLIMFComplianceWidget extends StatelessWidget {
  const _SLIMFComplianceWidget();

  @override
  Widget build(BuildContext context) {
    return CmoCollapseTitle(
      title: 'SLIMF compliance',
      showTick: true,
      child: Container(
        padding:
            const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(5, 5), // changes position of shadow
            ),
            //BoxSh
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Is the farmer SLIMF compliant?',
                style: context.textStyles.titleBold
                    .copyWith(color: context.colors.black, fontSize: 16)),
            const SizedBox(height: 16),
            Text('LIMITATION 1: Harvest',
                style: context.textStyles.titleBold
                    .copyWith(color: context.colors.black, fontSize: 16)),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: context.textStyles.bodyNormal
                    .copyWith(color: context.colors.black, fontSize: 16)),
            const SizedBox(height: 12),
            Text('LIMITATION 2: 5000 M3',
                style: context.textStyles.titleBold
                    .copyWith(color: context.colors.black, fontSize: 16)),
            const SizedBox(height: 12),
            Row(
              children: const [
                Spacer(),
                CmoCircleItem(
                  letters: 'C',
                  color: Colors.green,
                ),
                SizedBox(width: 36),
                CmoCircleItem(letters: 'NC'),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
