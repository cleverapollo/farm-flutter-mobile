import 'dart:async';

import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/stake_holder_complaint/add_stake_holder_complaint/add_stake_holder_complaint_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comments_item.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/key_value_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

List<FarmerStakeHolderComplaint> _mockData = [
  FarmerStakeHolderComplaint(
    farmerStakeHolderComplaintId: DateTime.now().millisecondsSinceEpoch,
    generalComments: 'generalComments',
    issueRaised: 'issueRaised',
    complaintName: 'complaintName',
    carClosed: true,
    closureDetails: 'closureDetails',
    dateReceived: DateTime(2023, 4, 20).toString(),
    dateClosed: DateTime(2023, 4, 26).toString(),
  ),
  FarmerStakeHolderComplaint(
    farmerStakeHolderComplaintId: DateTime.now().millisecondsSinceEpoch,
    generalComments: 'generalComments 1',
    issueRaised: 'issueRaised 1',
    complaintName: 'complaintName 1',
    carClosed: true,
    closureDetails: 'closureDetails 1',
    dateReceived: DateTime(2023, 4, 1).toString(),
  ),
  FarmerStakeHolderComplaint(
    farmerStakeHolderComplaintId: DateTime.now().millisecondsSinceEpoch,
    generalComments: 'generalComments 2',
    issueRaised: 'issueRaised 2',
    complaintName: 'complaintName 2',
    carClosed: true,
    closureDetails: 'closureDetails 2',
    dateReceived: DateTime(2023, 4, 2).toString(),
  ),
  FarmerStakeHolderComplaint(
    farmerStakeHolderComplaintId: DateTime.now().millisecondsSinceEpoch,
    generalComments: 'generalComments 3',
    issueRaised: 'issueRaised 3',
    complaintName: 'complaintName 3',
    carClosed: true,
    closureDetails: 'closureDetails 3',
    dateReceived: DateTime(2023, 4, 3).toString(),
  ),
];

class StakeHolderComplaintScreen extends StatefulWidget {
  const StakeHolderComplaintScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _StakeHolderComplaintScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const StakeHolderComplaintScreen(),
      ),
    );
  }
}

class _StakeHolderComplaintScreenState extends State<StakeHolderComplaintScreen> {
  Timer? _debounceInputTimer;
  late List<FarmerStakeHolderComplaint> filteredItems;
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
        final containName = element.complaintName?.toLowerCase().contains(input.toLowerCase()) ?? false;
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
        title: LocaleKeys.stakeholder_complaints.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AddStakeHolderComplaintScreen.push(context),
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
                  return _StakeHolderComplaintItem(
                    complaint: filteredItems[index],
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

class _StakeHolderComplaintItem extends StatelessWidget {
  const _StakeHolderComplaintItem({
    required this.complaint,
  });

  final FarmerStakeHolderComplaint complaint;

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
            '${LocaleKeys.complaintNo.tr()}: ${complaint.farmerStakeHolderComplaintId?.toString()}',
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
            keyLabel: LocaleKeys.complaintName.tr(),
            valueLabel: complaint.complaintName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.issueRaised.tr(),
            valueLabel: complaint.issueRaised,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateReceived.tr(),
            valueLabel: DateTime.tryParse(complaint.dateReceived ?? '')?.ddMMYyyy(),
            backgroundColor: context.colors.greyLight1,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateClosed.tr(),
            valueLabel: DateTime.tryParse(complaint.dateClosed ?? '')?.ddMMYyyy(),
            backgroundColor: context.colors.greyLight1,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.closureDetails.tr(),
            valueLabel: complaint.closureDetails,
          ),
          GeneralCommentsItem(
            comment: complaint.generalComments,
          ),
        ],
      ),
    );
  }
}
