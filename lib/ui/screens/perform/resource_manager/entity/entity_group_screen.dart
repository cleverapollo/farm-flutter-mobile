import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/group_scheme_entity_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/resource_manager_unit_entity.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EntityGroupScreen extends StatefulWidget {
  static dynamic push(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const EntityGroupScreen(),
      ),
    );
  }

  const EntityGroupScreen({super.key});

  @override
  State<EntityGroupScreen> createState() => _EntityGroupScreenState();
}

class _EntityGroupScreenState extends State<EntityGroupScreen> {
  dynamic selectedGroupScheme;
  dynamic selectedResourceManagerUnit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.entity.tr(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 38),
            alignment: Alignment.centerLeft,
            color: context.colors.blueDark1,
            child: Text(
              LocaleKeys.groupSchemeManagement.tr(),
              style: context.textStyles.bodyBold
                  .copyWith(color: context.colors.white),
            ),
          ),
          _EntityCard(
            LocaleKeys.groupScheme.tr(),
            onTap: () async {
              selectedGroupScheme = await GroupSchemeEntityScreen.push(
                context,
                selectedItem: selectedGroupScheme,
              );
              setState(() {});
            },
          ),
          Divider(
            height: 1,
            color: context.colors.grey,
            indent: 23,
            endIndent: 23,
          ),
          if (selectedGroupScheme != null) ...[
            _EntityCard(
              LocaleKeys.resourceManagementUnit.tr(),
              onTap: () async {
                selectedResourceManagerUnit =
                    await ResourceManagerUnitEntity.push(
                  context,
                  selectedItem: selectedResourceManagerUnit,
                );
                setState(() {});
              },
            ),
            Divider(
              height: 1,
              color: context.colors.grey,
              indent: 23,
              endIndent: 23,
            ),
          ],
        ],
      ),
    );
  }
}

class _EntityCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _EntityCard(this.text, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: context.textStyles.bodyBold
                      .copyWith(color: context.colors.black),
                ),
                Assets.icons.icArrowRight.svgBlack
              ],
            ),
          ],
        ),
      ),
    );
  }
}
