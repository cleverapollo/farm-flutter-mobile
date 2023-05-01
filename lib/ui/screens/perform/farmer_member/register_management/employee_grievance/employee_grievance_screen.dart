import 'dart:async';

import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/employee_grievance/add_employee_grievance/add_employee_grievance_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comments_item.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/key_value_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

List<EmployeeGrievance> _mockData = [
  EmployeeGrievance(
    employeeGrievanceId: DateTime.now().millisecondsSinceEpoch + 1,
    workerName: 'Armando Teteleni 1',
    actionTaken: 'Action Taken 1',
    allocatedTo: 'Avenger First 1',
    grievanceIssue: 'Vulgar language 1',
    generalComments: 'generalComments 1',
    carClosed: true,
    closureDetails: 'closureDetails 1',
    dateReceived: DateTime(2023, 4, 20).toString(),
  ),
  EmployeeGrievance(
    employeeGrievanceId: DateTime.now().millisecondsSinceEpoch + 2,
    workerName: 'Armando Teteleni 2',
    actionTaken: 'Action Taken 2',
    allocatedTo: 'Avenger First 2',
    grievanceIssue: 'Vulgar language 2',
    generalComments: 'generalComments 2',
    carClosed: true,
    closureDetails: 'closureDetails 2',
    dateReceived: DateTime(2023, 4, 20).toString(),
  ),
  EmployeeGrievance(
    employeeGrievanceId: DateTime.now().millisecondsSinceEpoch + 3,
    workerName: 'Armando Teteleni 3',
    actionTaken: 'Action Taken 3',
    allocatedTo: 'Avenger First 3',
    grievanceIssue: 'Vulgar language 3',
    generalComments: 'generalComments 3',
    carClosed: true,
    closureDetails: 'closureDetails 3',
    dateReceived: DateTime(2023, 4, 20).toString(),
  ),
  EmployeeGrievance(
    employeeGrievanceId: DateTime.now().millisecondsSinceEpoch + 4,
    workerName: 'Armando Teteleni 4',
    actionTaken: 'Action Taken 4',
    allocatedTo: 'Avenger First 4',
    grievanceIssue: 'Vulgar language 4',
    generalComments: 'generalComments 4',
    carClosed: true,
    closureDetails: 'closureDetails 4',
    dateReceived: DateTime(2023, 4, 20).toString(),
    dateClosed: DateTime(2023, 4, 26).toString(),
  ),
];

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

  Timer? _debounceInputTimer;
  late List<EmployeeGrievance> filteredItems;
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
        final containName = element.employeeGrievanceId.toString().toLowerCase().contains(input.toLowerCase()) ?? false;
        var isFilter = false;
        switch (statusFilter) {
          case StatusFilterEnum.open:
            isFilter = element.dateClosed.isNull || (element.dateClosed?.isEmpty ?? false);
            break;
          case StatusFilterEnum.closed:
            isFilter = element.dateClosed?.isNotEmpty ?? false;
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
              .where((element) => element.dateClosed.isNull || (element.dateClosed?.isEmpty ?? false))
              .toList();
          break;
        case StatusFilterEnum.closed:
          filteredItems = _mockData.where((element) => element.dateClosed?.isNotEmpty ?? false).toList();
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
                  _debounceInputTimer = Timer(const Duration(milliseconds: 200), () => searching(input));
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
                  return _EmployeeGrievanceItem(
                    employeeGrievance: filteredItems[index],
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

  final EmployeeGrievance employeeGrievance;

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
            '${LocaleKeys.grievanceNo.tr()}: ${employeeGrievance.employeeGrievanceId?.toString()}',
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
            keyLabel: LocaleKeys.worker.tr(),
            valueLabel: employeeGrievance.workerName,
          ),

          KeyValueItemWidget(
            keyLabel: LocaleKeys.grievanceIssue.tr(),
            valueLabel: employeeGrievance.grievanceIssue,
          ),

          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateReceived.tr(),
            valueLabel: DateTime.tryParse(employeeGrievance.dateReceived ?? '')?.ddMMYyyy(),
            backgroundColor: context.colors.greyLight1,
          ),

          KeyValueItemWidget(
            keyLabel: LocaleKeys.allocatedTo.tr(),
            valueLabel: employeeGrievance.allocatedTo,
          ),

          KeyValueItemWidget(
            keyLabel: LocaleKeys.actionTaken.tr(),
            valueLabel: employeeGrievance.actionTaken,
          ),

          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateClosed.tr(),
            valueLabel: DateTime.tryParse(employeeGrievance.dateClosed ?? '')?.ddMMYyyy(),
            backgroundColor: context.colors.greyLight1,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.closureDetails.tr(),
            valueLabel: employeeGrievance.closureDetails,
          ),
          GeneralCommentsItem(
            comment: employeeGrievance.generalComments,
          ),
        ],
      ),
    );
  }
}
