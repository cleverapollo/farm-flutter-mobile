import 'dart:async';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/accident_and_incident/accident_and_incident.dart';
import 'package:cmo/state/aai_cubit/aai_cubit.dart';
import 'package:cmo/ui/components/search_field.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/aai/aai_detail_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/register_item.dart';

class AAIScreen extends BaseStatefulWidget {
  AAIScreen({super.key}) : super(screenName: LocaleKeys.accident_incidents.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AAICubit(),
            child: AAIScreen(),
          );
        },
      ),
    );
  }

  @override
  State<AAIScreen> createState() => _AAIScreenState();
}

class _AAIScreenState extends BaseStatefulWidgetState<AAIScreen> {

  late AAICubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AAICubit>();
  }

  Future<void> onNavigateToDetail({AccidentAndIncident? aai}) async {
    await AAIDetailScreen.push(context, aai: aai);
    await cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.accident_incidents.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedAddButton.svgBlack,
        onTapTrailing: onNavigateToDetail,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            SearchField(
              searching: cubit.searching,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 0, 21, 16),
              child: StatusFilterWidget(
                onSelectFilter: cubit.onFilterStatus,
                statusFilter: cubit.state.statusFilter,
              ),
            ),
            Expanded(
              child: BlocBuilder<AAICubit, AAIState>(
                builder: (context, state) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 22,
                    ),
                    itemCount: state.filteredItems.length,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 21,
                    ),
                    itemBuilder: (context, index) {
                      final item = state.filteredItems[index];
                      return GestureDetector(
                        onTap: () => onNavigateToDetail(aai: item),
                        child: RegisterItem(
                          title:
                              '${LocaleKeys.aai_no.tr()}: ${item.accidentAndIncidentRegisterNo}',
                          mapData: generateInformationMapData(item),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, String?> generateInformationMapData(AccidentAndIncident registerItem) {
    return {
      LocaleKeys.worker.tr(): cubit.getWorkerNameByWorkerId(registerItem.workerId),
      LocaleKeys.jobDescription.tr(): registerItem.jobDescriptionName,
      LocaleKeys.nature_of_injury.tr(): registerItem.natureOfInjuryName,
      LocaleKeys.date_of_incident.tr(): convertDateTimeToLunar(registerItem.dateOfIncident).ddMMYyyy(),
      LocaleKeys.date_reported.tr(): convertDateTimeToLunar(registerItem.dateRecieved).ddMMYyyy(),
      LocaleKeys.resumed_work_on.tr(): convertDateTimeToLunar(registerItem.dateResumeWork).ddMMYyyy(),
      LocaleKeys.lost_time_in_days.tr(): registerItem.dateResumeWork != null &&
          registerItem.dateOfIncident != null
          ? registerItem.dateResumeWork!
          .difference(registerItem.dateOfIncident!)
          .inDays
          .toString()
          : '',
      LocaleKeys.worker_disabled.tr(): registerItem.workerDisabled == true
          ? LocaleKeys.yes.tr()
          : LocaleKeys.no.tr(),
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
  }
}
