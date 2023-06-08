import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/components/entity_component/entity_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/group_scheme_entity_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/resource_manager_unit_entity.dart';
import 'package:cmo/ui/screens/sync/rm_sync_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntityGroupScreen extends StatefulWidget {
  static PageRoute pageRoute({required bool isBehave}) {
      return MaterialPageRoute(
        builder: (_) => EntityGroupScreen(isBehave: isBehave),
      );
  }

  final bool isBehave;

  const EntityGroupScreen({this.isBehave = false, super.key});

  @override
  State<EntityGroupScreen> createState() => _EntityGroupScreenState();
}

class _EntityGroupScreenState extends State<EntityGroupScreen> {
  GroupScheme? selectedGroupScheme;
  ResourceManagerUnit? selectedResourceManagerUnit;
  Company? selectedCompany;

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
          EntityWidget(
            selectedGroupScheme?.groupSchemeName ?? LocaleKeys.groupScheme.tr(),
            onTap: () async {
              selectedGroupScheme = await GroupSchemeEntityScreen.push(
                context,
                selectedItem: selectedGroupScheme,
              );
              setState(() {});
              await _onNext();
            },
          ),
          Divider(
            height: 1,
            color: context.colors.grey,
            indent: 23,
            endIndent: 23,
          ),
          if (selectedGroupScheme != null) ...[
            EntityWidget(
              LocaleKeys.resourceManagementUnit.tr(),
              onTap: () async {
                selectedResourceManagerUnit =
                    await ResourceManagerUnitEntity.push(
                  context,
                  groupSchemeId: selectedGroupScheme?.groupSchemeId ?? 0,
                  selectedItem: selectedResourceManagerUnit,
                );
                setState(() {});
                await _onNext();
              },
            ),
            Divider(
              height: 1,
              color: context.colors.grey,
              indent: 23,
              endIndent: 23,
            ),
          ],
          if (widget.isBehave) ...[
            const SizedBox(height: 36),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 38),
              alignment: Alignment.centerLeft,
              color: context.colors.blueDark1,
              child: Text(
                LocaleKeys.complianceManagement.tr(),
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.white),
              ),
            ),
            EntityWidget(
                  LocaleKeys.company.tr(),
              onTap: () {
                EntityBehaveScreen.push(
                  context,
                );
              },
            ),
            Divider(
              height: 1,
              color: context.colors.grey,
              indent: 23,
              endIndent: 23,
            ),
          ]
        ],
      ),
    );
  }

  Future<void> _onNext() async {
    if (selectedGroupScheme == null ||
        selectedResourceManagerUnit == null) {
      return;
    }

    await configService.setActiveRegionalManager(unit: selectedResourceManagerUnit!);
    await configService.setActiveGroupScheme(groupScheme: selectedGroupScheme!);
    await context.read<UserInfoCubit>().setActiveUserRole(userRole: UserRoleEnum.regionalManager);
    if (mounted) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => RMSyncScreen()));
    }
  }
}


