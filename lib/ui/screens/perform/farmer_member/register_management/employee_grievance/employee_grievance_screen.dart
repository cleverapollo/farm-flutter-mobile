import 'dart:async';

import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/employee_grievance/add_employee_grievance/add_employee_grievance_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comments_item.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/key_value_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

import '../../../../../../di.dart';

class EmployeeGrievanceScreen extends StatefulWidget {
  const EmployeeGrievanceScreen({super.key});

  @override
  State<StatefulWidget> createState() => _EmployeeGrievanceScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const EmployeeGrievanceScreen(),
      ),
    );
  }
}

class _EmployeeGrievanceScreenState extends State<EmployeeGrievanceScreen> {
  final List<GrievanceRegister> items = [];
  bool isLoading = true;

  Timer? _debounceInputTimer;
  late List<GrievanceRegister> filteredItems;
  late StatusFilterEnum statusFilter;
  String? inputSearch;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final farm = await configService.getActiveFarm();
    items.addAll(await cmoDatabaseMasterService
        .getEmployeeGrievancesByFarmId(farm!.farmId));
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
        final containName = element.grievanceRegisterId
            .toString()
            .toLowerCase()
            .contains(input.toLowerCase());
        var isFilter = false;
        switch (statusFilter) {
          case StatusFilterEnum.open:
            isFilter = element.dateClosed == null;
            break;
          case StatusFilterEnum.closed:
            isFilter = element.dateClosed != null;
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
              items.where((element) => element.dateClosed == null).toList();
          break;
        case StatusFilterEnum.closed:
          filteredItems =
              items.where((element) => element.dateClosed != null).toList();
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
        title: LocaleKeys.employee_grievance.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AddEmployeeGrievanceScreen.push(context),
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
                            final result =
                                await AddEmployeeGrievanceScreen.push(context,
                                    employeeGrievance: item);
                            if (result == null) return;
                            filteredItems[index] = result;
                            setState(() {});
                          },
                          child: _EmployeeGrievanceItem(
                            employeeGrievance: item,
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
}

class _EmployeeGrievanceItem extends StatelessWidget {
  const _EmployeeGrievanceItem({
    required this.employeeGrievance,
  });

  final GrievanceRegister employeeGrievance;

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
            '${LocaleKeys.grievanceNo.tr()}: ${employeeGrievance.grievanceRegisterNo?.toString()}',
            style: context.textStyles.bodyBold.blue,
            maxLines: 2,
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
            keyLabel: LocaleKeys.worker.tr(),
            valueLabel: employeeGrievance.workerName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.grievanceIssue.tr(),
            valueLabel: employeeGrievance.grievanceIssueName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateReceived.tr(),
            valueLabel: employeeGrievance.dateReceived?.ddMMYyyy(),
            backgroundColor: context.colors.greyLight1,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.allocatedTo.tr(),
            valueLabel: employeeGrievance.allocatedToName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.actionTaken.tr(),
            valueLabel: employeeGrievance.actionTaken,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateClosed.tr(),
            valueLabel: employeeGrievance.dateClosed?.ddMMYyyy(),
            backgroundColor: context.colors.greyLight1,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.closureDetails.tr(),
            valueLabel: employeeGrievance.closureDetails,
          ),
          GeneralCommentsItem(
            comment: employeeGrievance.comment,
          ),
        ],
      ),
    );
  }
}
