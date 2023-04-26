import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/farmer_stake_holder/farmer_stake_holder.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/farmer_add_stake_holder/farmer_add_stake_holder_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/labour_management/widgets/labour_management_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

List<FarmerStakeHolder> _mockData = [
  FarmerStakeHolder(
    jobTitle: 'Manager',
    farmerStakeHolderName: 'Leon Chetty',
  ),
  FarmerStakeHolder(
    jobTitle: 'Supervisor',
    farmerStakeHolderName: 'Joe Soap ',
  ),
  FarmerStakeHolder(
    jobTitle: 'Supervisor',
    farmerStakeHolderName: 'Leon Chetty',
  ),
];

class LabourManagementScreen extends StatefulWidget {

  const LabourManagementScreen({super.key});


  @override
  State<StatefulWidget> createState() => _LabourManagementScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const LabourManagementScreen(),
      ),
    );
  }
}

class _LabourManagementScreenState extends State<LabourManagementScreen> {

  Timer? _debounceInputTimer;
  late List<FarmerStakeHolder> filteredItems;

  @override
  void initState() {
    super.initState();
    filteredItems = _mockData;
  }


  void searching(String? input) {
    if (input == null || input.isEmpty) {
      filteredItems = _mockData;
    } else {
      filteredItems = _mockData.where((element) => element.farmerStakeHolderName?.toLowerCase().contains(input.toLowerCase()) ?? false).toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.labourManagement.tr(),
        subtitle: 'RMU Name: Border Timbers',
        subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => FarmerAddStakeHolderScreen.push(context),
      ),

      body: Column(
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
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 22,
              ),
              itemCount: filteredItems.length,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              itemBuilder: (context, index) {
                return LabourManagementItem(
                  farmerStakeHolder: filteredItems[index],
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}