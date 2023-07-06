import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/sanction_register/sanction_register.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_cubit.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/disciplinaries/disciplinaries_add_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisciplinariesScreen extends StatefulWidget {
  const DisciplinariesScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => const DisciplinariesScreen()));
  }

  @override
  State<DisciplinariesScreen> createState() => _DisciplinariesScreenState();
}

class _DisciplinariesScreenState extends State<DisciplinariesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DisciplinariesCubit>(
      create: (_) => DisciplinariesCubit(),
      child: Scaffold(
        appBar: CmoAppBarV2(
          title: LocaleKeys.disciplinary.tr(),
          showLeading: true,
          showAdding: true,
          onTapAdding: () => DisciplinariesAddScreen.push(context),
        ),
        body: BlocBuilder<DisciplinariesCubit, DisciplinariesState>(
          builder: (context, state) {
            final cubit = context.read<DisciplinariesCubit>();
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          cubit.onChangeStatus(true);
                        },
                        child: _StatusFilterWidget(
                          text: LocaleKeys.open.tr(),
                          isSelected: state.isOpen,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          cubit.onChangeStatus(false);
                        },
                        child: _StatusFilterWidget(
                          text: LocaleKeys.close.tr(),
                          isSelected: !state.isOpen,
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 18),
                      separatorBuilder: (_, index) =>
                          const SizedBox(height: 14),
                      itemCount: state.sanctionRegisters.length,
                      itemBuilder: (context, index) =>
                          _DisciplinariesItemWidget(
                              state.sanctionRegisters[index])),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _StatusFilterWidget extends StatelessWidget {
  const _StatusFilterWidget({
    required this.text,
    this.isSelected = false,
    super.key,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? context.colors.blue : context.colors.white,
        border: isSelected ? null : Border.all(color: context.colors.black),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
      alignment: Alignment.center,
      child: Text(
        text,
        style: context.textStyles.bodyNormal.copyWith(
          fontSize: 12,
          color: isSelected ? context.colors.white : context.colors.black,
        ),
      ),
    );
  }
}

class _DisciplinariesItemWidget extends StatelessWidget {
  static const double _itemHorizontalPadding = 4;

  final SanctionRegister data;

  const _DisciplinariesItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.greyD9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _itemHorizontalPadding,
            ),
            child: Text(
              '${LocaleKeys.disciplinary_no.tr()} : ${data.sanctionRegisterId}',
              style: context.textStyles.bodyBold
                  .copyWith(color: context.colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _itemHorizontalPadding * 2,
              vertical: 6,
            ),
            child: Container(
              height: 1,
              color: context.colors.black,
            ),
          ),
          _buildILineItem(
              context, '${LocaleKeys.worker.tr()}: ', data.displayWorkerName),
          _buildILineItem(context, '${LocaleKeys.dateIssued.tr()} :',
              data.dateReceived.yMd()),
          _buildILineItem(context, '${LocaleKeys.camp_compartment.tr()} :',
              data.campOrCompartment),
          _buildILineItem(context, '${LocaleKeys.disciplinaries_issue.tr()} :',
              data.issueTypeName),
          _buildILineItem(
              context,
              '${LocaleKeys.disciplinaries_steps_taken.tr()} : ',
              data.descriptionOfSanction),
          _buildILineItem(
              context, '${LocaleKeys.signed.tr()} : ', data.signatureDate),
          _buildILineItem(
              context, '${LocaleKeys.generalComments.tr()} :', data.comment),
        ],
      ),
    );
  }

  Padding _buildILineItem(BuildContext context, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textStyles.bodyNormal,
          ),
          Expanded(
            child: Text(
              value ?? '',
              style: context.textStyles.bodyNormal,
            ),
          )
        ],
      ),
    );
  }
}
