import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

import '../../../../../env/env.dart';

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

class StakeHolderManagementScreen extends StatelessWidget {
  const StakeHolderManagementScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const StakeHolderManagementScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBarV2(
          title: LocaleKeys.stakeholderManagement.tr(),
          subtitle: '${LocaleKeys.siteName.tr()}: Imbeza',
          showLeading: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
              child: CmoTextField(
                name: LocaleKeys.search.tr(),
                hintText: LocaleKeys.search.tr(),
                suffixIcon: Assets.icons.icSearch.svg(),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 22,
                ),
                itemCount: _mockData.length,
                padding: const EdgeInsets.symmetric(horizontal: 21),
                itemBuilder: (context, index) {
                  return _buildItemCard(_mockData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(StakeHolder model) {
    return CmoTappable(
      onTap: () {},
      child: CmoCard(
        content: [
          CmoCardHeader(
            title: model.entityName ?? '',
            maxLines: 2,
          ),
          const SizedBox(height: 10),
          CmoCardItemWithIcon(
            icon: Assets.icons.icHome,
            title: model.address,
          ),
          CmoCardItemWithIcon(
            icon: Assets.icons.icProfile,
            title: model.contactName,
          ),
          CmoCardItemWithIcon(
            icon: Assets.icons.icMail,
            title: model.email,
          ),
        ],
      ),
    );
  }
}
