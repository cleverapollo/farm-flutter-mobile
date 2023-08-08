import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/accident_and_incident.dart';
import 'package:cmo/state/aai_cubit/aai_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/aai/adding_aai_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AAIScreen extends StatefulWidget {
  const AAIScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_){
      return BlocProvider(
        create: (_) => AAICubit(),
        child: const AAIScreen(),
      );
      },
    ),);
  }

  @override
  State<AAIScreen> createState() => _AAIScreenState();
}

class _AAIScreenState extends State<AAIScreen> {
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
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () async {
          await AddingAAIScreen.push(context);
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
                              final result = await AddingAAIScreen.push(context,
                                  aai: item);
                              if (result == null) return;
                              filteredItems[index] = result;
                              setState(() {});
                            },
                            child: _AAIItem(item));
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _AAIItem extends StatelessWidget {
  static const double _itemHorizontalPadding = 4;

  final AccidentAndIncident aai;

  const _AAIItem(this.aai, {Key? key}) : super(key: key);

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
              '${LocaleKeys.asi_no.tr()}: ${aai.accidentAndIncidentRegisterNo}',
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
          Container(
            color: context.colors.greyLight1,
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.worker.tr(),
                    style: context.textStyles.bodyNormal,
                  ),
                  Text(
                    aai.workerName ?? '',
                    style: context.textStyles.bodyNormal,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.jobDescription.tr(),
                  style: context.textStyles.bodyNormal,
                ),
                Text(
                  aai.jobDescriptionName ?? '',
                  style: context.textStyles.bodyNormal,
                )
              ],
            ),
          ),
          Container(
            color: context.colors.greyLight1,
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.nature_of_injury.tr(),
                    style: context.textStyles.bodyNormal,
                  ),
                  Text(
                    aai.natureOfInjuryName ?? '',
                    style: context.textStyles.bodyNormal,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.date_of_incident.tr(),
                  style: context.textStyles.bodyNormal,
                ),
                Text(
                  aai.dateOfIncident?.ddMMYyyy() ?? '',
                  style: context.textStyles.bodyNormal,
                )
              ],
            ),
          ),
          Container(
            color: context.colors.greyLight1,
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.date_reported.tr(),
                    style: context.textStyles.bodyNormal,
                  ),
                  Text(
                    aai.dateRecieved.ddMMYyyy() ?? '',
                    style: context.textStyles.bodyNormal,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.resumed_work_on.tr(),
                  style: context.textStyles.bodyNormal,
                ),
                Text(
                  aai.dateResumeWork?.ddMMYyyy() ?? '',
                  style: context.textStyles.bodyNormal,
                )
              ],
            ),
          ),
          Container(
            color: context.colors.greyLight1,
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.lost_time_in_days.tr(),
                    style: context.textStyles.bodyNormal,
                  ),
                  Text(
                    aai.dateResumeWork != null && aai.dateOfIncident != null
                        ? aai.dateResumeWork!
                            .difference(aai.dateOfIncident!)
                            .inDays
                            .toString()
                        : '',
                    style: context.textStyles.bodyNormal,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.worker_disabled.tr(),
                  style: context.textStyles.bodyNormal,
                ),
                Text(
                  aai.workerDisabled == true
                      ? LocaleKeys.yes.tr()
                      : LocaleKeys.no.tr(),
                  style: context.textStyles.bodyNormal,
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.general_comments.tr(),
                  style: context.textStyles.bodyNormal,
                ),
                Text(
                  aai.comment ?? '',
                  style: context.textStyles.bodyNormal,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
