import 'dart:async';

import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/fire/add_fire_management/add_fire_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comments_item.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/key_value_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

List<FireManagement> _mockData = [
  FireManagement(
    areaBurnt: 12.4,
    commercialAreaLoss: 113.4,
    dateDetected: DateTime(2023, 4, 20).toString(),
    dateExtinguished: DateTime(2023, 4, 26).toString(),
    fireCause: 'FC Fire',
    longitude: 132.4123141231,
    latitude: 123.32123123,
  ),
  FireManagement(
    areaBurnt: 12.4,
    commercialAreaLoss: 113.4,
    dateDetected: DateTime(2023, 4, 20).toString(),
    fireCause: 'FC Fire 1',
    longitude: 132.4123141231,
    latitude: 123.32123123,
  ),
  FireManagement(
    areaBurnt: 12.4,
    commercialAreaLoss: 113.4,
    dateDetected: DateTime(2023, 4, 20).toString(),
    fireCause: 'FC Fire 2',
    longitude: 132.4123141231,
    latitude: 123.32123123,
  ),
  FireManagement(
    areaBurnt: 12.4,
    commercialAreaLoss: 113.4,
    dateDetected: DateTime(2023, 4, 20).toString(),
    fireCause: 'FC Fire 3',
    longitude: 132.4123141231,
    latitude: 123.32123123,
  ),
  FireManagement(
    areaBurnt: 12.4,
    commercialAreaLoss: 113.4,
    dateDetected: DateTime(2023, 4, 20).toString(),
    fireCause: 'FC Fire 4',
    longitude: 132.4123141231,
    latitude: 123.32123123,
  ),
];

class FireManagementScreen extends StatefulWidget {
  const FireManagementScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FireManagementScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FireManagementScreen(),
      ),
    );
  }
}

class _FireManagementScreenState extends State<FireManagementScreen> {
  Timer? _debounceInputTimer;
  late List<FireManagement> filteredItems;
  late StatusFilterEnum statusFilter;
  String? inputSearch;

  @override
  void initState() {
    super.initState();
    filteredItems = _mockData;
    statusFilter = StatusFilterEnum.open;
    inputSearch = '';
    applyFilter();
  }

  void searching(String? input) {
    inputSearch = input;
    if (input == null || input.isEmpty) {
      applyFilter();
    } else {
      filteredItems = _mockData.where((element) {
        final containName = element.fireManagementId
                .toString()
                .toLowerCase()
                .contains(input.toLowerCase()) ??
            false;
        var isFilter = false;
        switch (statusFilter) {
          case StatusFilterEnum.open:
            isFilter = element.dateExtinguished.isNull ||
                (element.dateExtinguished?.isEmpty ?? false);
            break;
          case StatusFilterEnum.closed:
            isFilter = element.dateExtinguished?.isNotEmpty ?? false;
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
          filteredItems = _mockData
              .where(
                (element) =>
                    element.dateExtinguished.isNull ||
                    (element.dateExtinguished?.isEmpty ?? false),
              )
              .toList();
          break;
        case StatusFilterEnum.closed:
          filteredItems = _mockData
              .where((element) => element.dateExtinguished?.isNotEmpty ?? false)
              .toList();
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
          title: LocaleKeys.fire.tr(),
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icAdd.svgBlack,
          onTapTrailing: () => AddFireManagementScreen.push(context),
          ),
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
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
                  _debounceInputTimer = Timer(const Duration(milliseconds: 200),
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
                  return _FireManagementItem(
                    fireManagement: filteredItems[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FireManagementItem extends StatelessWidget {
  const _FireManagementItem({
    required this.fireManagement,
  });

  final FireManagement fireManagement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.colors.greyD9D9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${LocaleKeys.fireNo.tr()}: ${fireManagement.fireManagementId?.toString()}',
            style: context.textStyles.bodyBold.blue,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 6,
            ),
            child: Divider(
              color: context.colors.blueDark2,
              height: 1,
            ),
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.fireCause.tr(),
            valueLabel: fireManagement.fireCause,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateDetected.tr(),
            valueLabel: DateTime.tryParse(fireManagement.dateDetected ?? '')
                ?.ddMMYyyy(),
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateExtinguished.tr(),
            valueLabel: DateTime.tryParse(fireManagement.dateExtinguished ?? '')
                ?.ddMMYyyy(),
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.areaBurntHa.tr(),
            valueLabel: fireManagement.areaBurnt?.toString() ?? '',
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.commercialAreaLossHa.tr(),
            valueLabel: fireManagement.commercialAreaLoss?.toString() ?? '',
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateExtinguished.tr(),
            valueLabel: DateTime.tryParse(fireManagement.dateExtinguished ?? '')
                ?.ddMMYyyy(),
          ),
          GeneralCommentsItem(
            comment: fireManagement.generalComments,
          ),
        ],
      ),
    );
  }
}
