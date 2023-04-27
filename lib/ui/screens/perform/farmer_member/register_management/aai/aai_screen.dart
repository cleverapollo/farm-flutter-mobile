import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/accident_and_incident.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/aai/adding_aai_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/asi/adding_asi_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AAIScreen extends StatefulWidget {
  final mockAAIs = <AccidentAndIncident>[
    AccidentAndIncident(
      accidentAndIncidentRegisterNo: '2324',
      workerName: 'Test',
      jobDescription: 'Felling',
      natureOfInjury: 'Foot',
      dateOfIncident: DateTime.now(),
      createDT: DateTime.now().subtract(const Duration(days: 100)),
      comment: 'Test comment',
    ),
    AccidentAndIncident(
      accidentAndIncidentRegisterNo: '1111',
      workerName: 'Test',
      jobDescription: 'Felling',
      natureOfInjury: 'Foot',
      dateOfIncident: DateTime.now(),
      createDT: DateTime.now().subtract(const Duration(days: 100)),
      comment: 'Test comment',
    ),
    AccidentAndIncident(
      accidentAndIncidentRegisterNo: '2222',
      workerName: 'Test',
      jobDescription: 'Felling',
      natureOfInjury: 'Foot',
      dateOfIncident: DateTime.now(),
      createDT: DateTime.now().subtract(const Duration(days: 23)),
      comment: 'Test comment',
    ),
    AccidentAndIncident(
      accidentAndIncidentRegisterNo: '3333',
      workerName: 'Test',
      jobDescription: 'Felling',
      natureOfInjury: 'Foot',
      dateOfIncident: DateTime.now(),
      createDT: DateTime.now().subtract(const Duration(days: 34)),
      comment: 'Test comment',
    ),
    AccidentAndIncident(
      accidentAndIncidentRegisterNo: '4444',
      workerName: 'Test',
      jobDescription: 'Felling',
      natureOfInjury: 'Foot',
      dateOfIncident: DateTime.now(),
      createDT: DateTime.now().subtract(const Duration(days: 55)),
      comment: 'Test comment',
    ),
  ];

  AAIScreen({Key? key}) : super(key: key);

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => AAIScreen()));
  }

  @override
  State<AAIScreen> createState() => _AAIScreenState();
}

class _AAIScreenState extends State<AAIScreen> {
  List<AccidentAndIncident> filteredAAIs = [];
  bool _isOpenSelected = true;
  Timer? _debounceSearching;

  @override
  void initState() {
    super.initState();
    filteredAAIs = widget.mockAAIs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.accident_incidents.tr(),
        showLeading: true,
        showTrailing: true,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AddingAAIScreen.push(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            child: CmoTextField(
              onChanged: _search,
              name: LocaleKeys.search.tr(),
              prefixIcon: Assets.icons.icSearch.svg(),
              hintText: LocaleKeys.search.tr(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setState(() => _isOpenSelected = true),
                child: _StatusFilterWidget(
                  text: LocaleKeys.open.tr(),
                  isSelected: _isOpenSelected,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => _isOpenSelected = false),
                child: _StatusFilterWidget(
                  text: LocaleKeys.close.tr(),
                  isSelected: !_isOpenSelected,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              itemCount: filteredAAIs.length,
              separatorBuilder: (_, index) => const SizedBox(height: 14),
              itemBuilder: (_, index) => _AAIItem(filteredAAIs[index]),
            ),
          ),
        ],
      ),
    );
  }

  void _search(String? value) {
    _debounceSearching?.cancel();
    _debounceSearching = Timer(
      const Duration(milliseconds: 300),
      () {
        if (value?.isEmpty ?? true) {
          filteredAAIs = widget.mockAAIs;
        } else {
          filteredAAIs = widget.mockAAIs
              .where(
                  (element) => element.accidentAndIncidentRegisterNo?.contains(value!) ?? false)
              .toList();
        }
        setState(() {});
      },
    );
  }
}

class _StatusFilterWidget extends StatelessWidget {
  final bool isSelected;
  final String text;

  const _StatusFilterWidget({
    required this.text,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

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
                  aai.jobDescription ?? '',
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
                    aai.natureOfInjury ?? '',
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
                    aai.createDT?.ddMMYyyy() ?? '',
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
                  aai.workerDisabled == true ? LocaleKeys.yes.tr() : LocaleKeys.no.tr(),
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
