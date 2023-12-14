import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/accident_and_incident.dart';
import 'package:cmo/state/aai_cubit/aai_cubit.dart';
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
  final List<AccidentAndIncident> items = [];
  bool isLoading = true;

  Timer? _debounceInputTimer;
  late List<AccidentAndIncident> filteredItems;
  late StatusFilterEnum statusFilter = StatusFilterEnum.open;
  String? inputSearch;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    items.clear();
    final farm = await configService.getActiveFarm();
    items.addAll(await cmoDatabaseMasterService
        .getAccidentAndIncidentRegistersByFarmId(farm!.farmId));
    isLoading = false;

    filteredItems = items;
    inputSearch = '';
    applyFilter();
  }

  void searching(String? input) {
    inputSearch = input;
    if (input == null || input.isEmpty) {
      applyFilter();
    } else {
      filteredItems = items.where((element) {
        final containName = element.accidentAndIncidentRegisterNo
                ?.toLowerCase()
                .contains(input.toLowerCase()) ??
            false;
        var isFilter = false;
        switch (statusFilter) {
          case StatusFilterEnum.open:
            isFilter = element.dateResumeWork == null;
            break;
          case StatusFilterEnum.closed:
            isFilter = element.dateResumeWork != null;
            break;
        }

        return containName && isFilter;
      }).toList();
      setState(() {});
    }
  }

  void applyFilter() {
    if (inputSearch == null || inputSearch!.isEmpty) {
      switch (statusFilter) {
        case StatusFilterEnum.open:
          filteredItems =
              items.where((element) => element.dateResumeWork == null).toList();
          break;
        case StatusFilterEnum.closed:
          filteredItems =
              items.where((element) => element.dateResumeWork != null).toList();
          break;
      }
    } else {
      searching(inputSearch);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.accident_incidents.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedAddButton.svgBlack,
        onTapTrailing: () async {
          await AAIDetailScreen.push(context);
          await _init();
        },
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
                    child: CmoTextField(
                      name: LocaleKeys.search.tr(),
                      hintText: LocaleKeys.search.tr(),
                      suffixIcon: Assets.icons.icSearch.svg(),
                      onChanged: (input) {
                        _debounceInputTimer?.cancel();
                        _debounceInputTimer = Timer(
                            const Duration(milliseconds: 200),
                            () => searching(input));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 0, 21, 16),
                    child: StatusFilterWidget(
                      onSelectFilter: (statusFilterEnum) {
                        statusFilter = statusFilterEnum;
                        applyFilter();
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 22,
                      ),
                      itemCount: filteredItems.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 21,
                      ),
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return GestureDetector(
                            onTap: () async {
                              final result = await AAIDetailScreen.push(context,
                                  aai: item);
                              if (result == null) return;
                              filteredItems[index] = result;
                              setState(() {});
                            },
                            child: RegisterItem(
                              title: '${LocaleKeys.aai_no.tr()}: ${item.accidentAndIncidentRegisterNo}',
                              mapData: generateInformationMapData(item),
                            ),
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
      LocaleKeys.worker.tr(): registerItem.workerName,
      LocaleKeys.jobDescription.tr(): registerItem.jobDescriptionName,
      LocaleKeys.nature_of_injury.tr(): registerItem.natureOfInjuryName,
      LocaleKeys.date_of_incident.tr(): registerItem.dateOfIncident?.ddMMYyyy(),
      LocaleKeys.date_reported.tr(): registerItem.dateRecieved.ddMMYyyy(),
      LocaleKeys.resumed_work_on.tr(): registerItem.dateResumeWork?.ddMMYyyy(),
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
