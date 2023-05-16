import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_membership_contract_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_circle_item_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_collapse_title_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMemberScreen extends StatelessWidget {
  const AddMemberScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const AddMemberScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMemberCubit>(
        create: (_) => AddMemberCubit(),
        child: Scaffold(
          appBar: CmoAppBarV2(
            title: LocaleKeys.addMember.tr(),
            subtitle: LocaleKeys.siteName.tr(),
            showTrailing: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(height: 8),
                _AddMemberSLIMF(),
                SizedBox(height: 12),
                _AddMemberMPO(),
                SizedBox(height: 12),
                _AddMemberMDetails(),
                SizedBox(height: 12),
                _AddMemberSDetails(),
                SizedBox(height: 12),
                _AddMemberMRA(),
                SizedBox(height: 12),
                _AddMemberMFO(),
                SizedBox(height: 12),
              ],
            ),
          ),
        ));
  }
}

class _AddMemberMFO extends StatelessWidget {
  const _AddMemberMFO({
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
                _buildAnswerWidget(),
                _buildDivider(),
                Text('*HCVs present?',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black, fontSize: 16)),
                const SizedBox(height: 8),
                _buildAnswerWidget(),
                _buildDivider(),
                Text('*Rivers on FMU',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black, fontSize: 16)),
                const SizedBox(height: 8),
                _buildAnswerWidget(),
                _buildDivider(),
                Text('*Are there any communities in or neighbouring the FME?',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black, fontSize: 16)),
                const SizedBox(height: 8),
                _buildAnswerWidget(),
                _buildDivider(),
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

  Widget _buildDivider() {
    return Column(
      children: const [
        SizedBox(height: 8),
        Divider(thickness: 1),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildAnswerWidget({void Function()? onTap, bool? isSelect = false}) {
    return Row(
      children: [
        const Spacer(),
        CmoChipAnswerWidget.primary(onTap: onTap, isSelect: isSelect),
        const SizedBox(width: 4),
        CmoChipAnswerWidget.secondary(onTap: onTap, isSelect: isSelect),
        const SizedBox(width: 4),
        CmoChipAnswerWidget.na(onTap: onTap, isSelect: isSelect),
        const Spacer(),
      ],
    );
  }
}

class _AddMemberMRA extends StatelessWidget {
  const _AddMemberMRA();

  @override
  Widget build(BuildContext context) {
    return CmoCollapseTitle(
      title: 'Member Risk Assessment',
      showTick: true,
      child: Container(
          padding: const EdgeInsets.all(12),
          color: context.colors.white,
          child: BlocSelector<AddMemberCubit, AddMemberState, AddMemberMRA?>(
              selector: (state) => state.addMemberMRA,
              builder: (context, AddMemberMRA? value) {
                final cubit = context.read<AddMemberCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('*Are there any chemical being used on the FME?',
                        style: context.textStyles.bodyNormal.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    _buildAnswerWidget(context,
                        isSelect: value?.firstAnswer,
                        onTap: () =>
                            cubit.onTapMRA(firstAnswer: value?.firstAnswer)),
                    _buildDivider(),
                    Text('*HCVs present?',
                        style: context.textStyles.bodyNormal.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    _buildAnswerWidget(context,
                        isSelect: value?.secondAnswer,
                        onTap: () =>
                            cubit.onTapMRA(secondAnswer: value?.secondAnswer)),
                    _buildDivider(),
                    Text('*Rivers on FMU',
                        style: context.textStyles.bodyNormal.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    _buildAnswerWidget(context,
                        isSelect: value?.thirdAnswer,
                        onTap: () =>
                            cubit.onTapMRA(thirdAnswer: value?.thirdAnswer)),
                    _buildDivider(),
                    Text(
                        '*Are there any communities in or neighbouring the FME?',
                        style: context.textStyles.bodyNormal.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    _buildAnswerWidget(context,
                        isSelect: value?.fourthAnswer,
                        onTap: () =>
                            cubit.onTapMRA(fourthAnswer: value?.fourthAnswer)),
                    _buildDivider(),
                  ],
                );
              })),
    );
  }

  Widget _buildDivider() {
    return Column(
      children: const [
        SizedBox(height: 8),
        Divider(thickness: 1),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildAnswerWidget(BuildContext context,
      {bool? isSelect = false, void Function()? onTap}) {
    return Row(
      children: [
        const Spacer(),
        CmoChipAnswerWidget.yes(onTap: onTap, isSelect: isSelect),
        const SizedBox(width: 12),
        CmoChipAnswerWidget.no(onTap: onTap, isSelect: !(isSelect ?? false)),
        const Spacer(),
      ],
    );
  }
}

class _AddMemberSDetails extends StatelessWidget {
  const _AddMemberSDetails();

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

class _AddMemberMDetails extends StatelessWidget {
  const _AddMemberMDetails();

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

class _AddMemberMPO extends StatelessWidget {
  const _AddMemberMPO();

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

class _AddMemberSLIMF extends StatelessWidget {
  const _AddMemberSLIMF();

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
            _buildAnswerWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerWidget() {
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberSLIMF?>(
        selector: (state) => state.addMemberSLIMF,
        builder: (context, AddMemberSLIMF? data) {
          final isSelect = data?.isSlimfCompliant ?? true;

          return Row(
            children: [
              const Spacer(),
              CmoChipAnswerWidget.c(
                onTap: () {
                  context.read<AddMemberCubit>().onTapSlimf(isSlimf: true);
                },
                isSelect: isSelect,
              ),
              const SizedBox(width: 36),
              CmoChipAnswerWidget.nc(
                onTap: () {
                  context.read<AddMemberCubit>().onTapSlimf(isSlimf: false);
                },
                isSelect: !isSelect,
              ),
              const Spacer(),
            ],
          );
        });
  }
}
