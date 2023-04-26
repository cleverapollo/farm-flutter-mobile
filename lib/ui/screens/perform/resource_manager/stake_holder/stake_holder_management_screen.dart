import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/widgets/farmer_mode_stake_holder_item.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/widgets/rm_mode_stake_holder_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

List<StakeHolder> _mockData = [
  StakeHolder(
    stakeHolderId: '',
    entityName: 'African Parks, Matusadhona Operations Manager',
    address: 'Conservation',
    contactName: 'Mike Pelham',
    email: 'joe@123.com',
    isActive: true,
  ),
  StakeHolder(
    stakeHolderId: '',
    entityName: 'Agriculture Services',
    address: 'Government',
    contactName: 'Joe Soap',
    email: 'joe@123.com',
    isActive: true,
  ),
  StakeHolder(
    stakeHolderId: '',
    entityName: 'Agritex Chipinge',
    address: 'Government',
    contactName: 'Mr Chagwesha',
    email: 'Chagwesha @123.com',
    isActive: true,
  ),
];

class StakeHolderManagementScreen extends StatefulWidget {
  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const StakeHolderManagementScreen(),
      ),
    );
  }

  const StakeHolderManagementScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StakeHolderManagementScreenState();
}

class _StakeHolderManagementScreenState extends State<StakeHolderManagementScreen> {
  Timer? _debounceInputTimer;
  late List<StakeHolder> filteredItems;

  @override
  void initState() {
    super.initState();
    filteredItems = _mockData;
  }

  void searching(String? input) {
    if (input == null || input.isEmpty) {
      filteredItems = _mockData;
    } else {
      filteredItems = _mockData
          .where((element) => element.entityName?.toLowerCase().contains(input.toLowerCase()) ?? false)
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: _buildCustomAppBar(),
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
                  return _buildItemCard(
                    model: filteredItems[index],
                    haveGreyBackground: index.isEven,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildCustomAppBar() {
    if (appInfoService.mode == AppMode.resourceManager()) {
      return CmoAppBarV2(
        title: LocaleKeys.stakeholderManagement.tr(),
        subtitle: '${LocaleKeys.siteName.tr()}: Imbeza',
        showLeading: true,
      );
    } else if (appInfoService.mode == AppMode.farmer()) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.5),
                border: Border.all(color: context.colors.blueDark2),
              ),
              child: Text(
                'LC',
                style: context.textStyles.bodyNormal.blueDark2,
              ),
            ),
            Expanded(
              child: Text(
                LocaleKeys.stakeholderManagement.tr(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: context.textStyles.bodyBold.blue,
              ),
            ),
            const SizedBox(width: 45,),
          ],
        ),
      );
    }

    return null;
  }

  Widget _buildItemCard({
    required StakeHolder model,
    required bool haveGreyBackground,
  }) {
    if (appInfoService.mode == AppMode.resourceManager()) {
      return RmModeStakeHolderItem(
        model: model,
        onTap: () {},
      );
    } else if (appInfoService.mode == AppMode.farmer()) {
      return FarmerModeStakeHolderItem(
        model: model,
        haveGreyBackground: haveGreyBackground,
        onTap: () {},
      );
    }

    return const SizedBox.shrink();
  }
}
