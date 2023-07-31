import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/fire/fire_register.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/fire/add_fire_management/add_fire_management_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comments_item.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/key_value_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

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
  final List<FireRegister> items = [];
  bool isLoading = true;

  Timer? _debounceInputTimer;
  late List<FireRegister> filteredItems;
  late StatusFilterEnum statusFilter;
  String? inputSearch;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    items.addAll(await cmoDatabaseMasterService.getFireRegisters());
    isLoading = false;

    filteredItems = items;
    statusFilter = StatusFilterEnum.open;
    inputSearch = '';
    applyFilter();
  }

  void searching(String? input) {
    inputSearch = input;
    if (input == null || input.isEmpty) {
      applyFilter();
    } else {
      filteredItems = items.where((element) {
        final containName = element.fireRegisterId
            .toString()
            .toLowerCase()
            .contains(input.toLowerCase());
        var isFilter = false;
        switch (statusFilter) {
          case StatusFilterEnum.open:
            isFilter = element.extinguished == null;
            break;
          case StatusFilterEnum.closed:
            isFilter = element.extinguished != null;
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
              items.where((element) => element.extinguished == null).toList();
          break;
        case StatusFilterEnum.closed:
          filteredItems =
              items.where((element) => element.extinguished != null).toList();
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
                        return _FireManagementItem(
                          fireRegister: filteredItems[index],
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
    required this.fireRegister,
  });

  final FireRegister fireRegister;

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
            '${LocaleKeys.fireNo.tr()}: ${fireRegister.fireRegisterNo?.toString()}',
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
            valueLabel: fireRegister.fireCauseName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateDetected.tr(),
            valueLabel: fireRegister.detected?.ddMMYyyy(),
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateExtinguished.tr(),
            valueLabel: fireRegister.extinguished?.ddMMYyyy(),
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.areaBurntHa.tr(),
            valueLabel: fireRegister.areaBurnt?.toString() ?? '',
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.commercialAreaLossHa.tr(),
            valueLabel: fireRegister.commercialAreaLoss?.toString() ?? '',
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateExtinguished.tr(),
            valueLabel: fireRegister.extinguished?.ddMMYyyy(),
          ),
          GeneralCommentsItem(
            comment: fireRegister.comment,
          ),
        ],
      ),
    );
  }
}
