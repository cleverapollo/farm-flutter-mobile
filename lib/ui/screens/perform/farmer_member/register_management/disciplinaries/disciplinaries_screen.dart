import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/sanction_register/sanction_register.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_cubit.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_state.dart';
import 'package:cmo/ui/components/search_field.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/disciplinaries/disciplinaries_add_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisciplinariesScreen extends BaseStatefulWidget {
  DisciplinariesScreen({super.key}) : super(screenName: LocaleKeys.disciplinary.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DisciplinariesScreen(),
      ),
    );
  }

  @override
  State<DisciplinariesScreen> createState() => _DisciplinariesScreenState();
}

class _DisciplinariesScreenState extends BaseStatefulWidgetState<DisciplinariesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DisciplinariesCubit>(
      create: (_) => DisciplinariesCubit()..initData(),
      child: BlocSelector<DisciplinariesCubit, DisciplinariesState, bool>(
        selector: (state) => state.isLoading,
        builder: (context, isLoading) {

          final cubit = context.read<DisciplinariesCubit>();

          return Scaffold(
            appBar: CmoAppBar(
              title: LocaleKeys.disciplinary.tr(),
              leading: Assets.icons.icBackButton.svgBlack,
              onTapLeading: Navigator.of(context).pop,
              trailing: Assets.icons.icUpdatedAddButton.svgBlack,
              onTapTrailing: () async {
                final shouldRefresh =
                await DisciplinariesAddScreen.push(context);
                if (shouldRefresh != null && context.mounted) {
                  await context.read<DisciplinariesCubit>().initData();
                }
              },
            ),
            body: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      SearchField(
                        searching: cubit.searching,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(21, 0, 21, 16),
                        child: StatusFilterWidget(
                          onSelectFilter: cubit.onFilterStatus,
                          statusFilter: cubit.state.statusFilterEnum,
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<DisciplinariesCubit,
                            DisciplinariesState>(
                          builder: (context, state) {
                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                              separatorBuilder: (_, index) => const SizedBox(height: 14),
                              itemCount: state.filterSanctionRegisters.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () async {
                                  final shouldRefresh =
                                      await DisciplinariesAddScreen.push(
                                          context,
                                          data: state.filterSanctionRegisters[index]);

                                  if (shouldRefresh != null) {
                                    await cubit.initData();
                                  }
                                },
                                child: _DisciplinariesItemWidget(
                                    state.filterSanctionRegisters[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
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
          _buildILineItem(context, '${LocaleKeys.dateIssued.tr()} : ',
              data.dateReceived.mmmDdYyyy()),
          _buildILineItem(context, '${LocaleKeys.camp_compartment.tr()} : ',
              data.campOrCompartment),
          _buildILineItem(context, '${LocaleKeys.disciplinaries_issue.tr()} : ',
              data.issueTypeName),
          _buildILineItem(
              context,
              '${LocaleKeys.disciplinaries_steps_taken.tr()} : ',
              data.descriptionOfSanction),
          _buildILineItem(context, '${LocaleKeys.signed.tr()} : ',
              DateTime.tryParse(data.signatureDate ?? '').mmmDdYyyy()),
          _buildILineItem(
              context, '${LocaleKeys.generalComments.tr()} : ', data.comment),
        ],
      ),
    );
  }

  Widget _buildILineItem(BuildContext context, String label, String? value) {
    if (value.isNullOrEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textStyles.bodyBold,
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
