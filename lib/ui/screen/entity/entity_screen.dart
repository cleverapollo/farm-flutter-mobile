import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/widget/cm_option_tile.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:flutter/material.dart';

class EntityScreen extends StatelessWidget {
  const EntityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(title: LocaleKeys.entity.tr()),
      body: Column(
        children: [
          CmoHeaderTile(title: LocaleKeys.groupSchemeManagement.tr()),
          CmoOptionTile(title: LocaleKeys.groupScheme.tr()),
          CmoOptionTile(title: LocaleKeys.resourceManagementUnit.tr()),
          const SizedBox(height: 51),
          CmoHeaderTile(title: LocaleKeys.operationsManagement.tr()),
          CmoOptionTile(title: LocaleKeys.company.tr()),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: CmoFilledButton(title: LocaleKeys.sync.tr()),
          ),
        ],
      ),
    );
  }
}
