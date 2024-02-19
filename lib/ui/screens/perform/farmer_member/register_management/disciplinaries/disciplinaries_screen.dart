import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/sanction_register/sanction_register.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_cubit.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_state.dart';
import 'package:cmo/ui/components/search_field.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/disciplinaries/disciplinaries_add_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/register_item.dart';
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
        builder: (_) => BlocProvider<DisciplinariesCubit>(
          create: (_) => DisciplinariesCubit()..initData(),
          child: DisciplinariesScreen(),
        ),
      ),
    );
  }

  @override
  State<DisciplinariesScreen> createState() => _DisciplinariesScreenState();
}

class _DisciplinariesScreenState extends BaseStatefulWidgetState<DisciplinariesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<DisciplinariesCubit, DisciplinariesState, bool>(
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
                                child: RegisterItem(
                                  title: '${LocaleKeys.disciplinary_no.tr()} : ${state.filterSanctionRegisters[index].sanctionRegisterId}',
                                  mapData: generateInformationMapData(state.filterSanctionRegisters[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
    );
  }

  Map<String, String?> generateInformationMapData(SanctionRegister registerItem) {
    return {
      LocaleKeys.worker.tr(): context.read<DisciplinariesCubit>().getWorkerName(registerItem.workerId),
      LocaleKeys.dateIssued.tr(): convertDateTimeToLunar(registerItem.dateReceived).mmmDdYyyy(),
      LocaleKeys.camp_compartment.tr(): registerItem.campOrCompartment,
      LocaleKeys.disciplinaries_issue.tr(): context.read<DisciplinariesCubit>().getIssueTypeName(registerItem.issueTypeId),
      LocaleKeys.disciplinaries_steps_taken.tr(): registerItem.descriptionOfSanction,
      LocaleKeys.signed.tr(): DateTime.tryParse(registerItem.signatureDate ?? '').mmmDdYyyy(),
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
  }
}
