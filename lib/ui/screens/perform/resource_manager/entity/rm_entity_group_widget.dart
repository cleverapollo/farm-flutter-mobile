import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/components/entity_component/entity_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/group_scheme_entity_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/resource_manager_unit_entity.dart';
import 'package:cmo/ui/screens/sync/rm_sync_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RMEntityGroupWidget extends BaseStatefulWidget {

  const RMEntityGroupWidget({super.key}) : super(screenName: 'RMEntityGroupWidget');

  @override
  State<RMEntityGroupWidget> createState() => _RMEntityGroupWidgetState();
}

class _RMEntityGroupWidgetState extends BaseStatefulWidgetState<RMEntityGroupWidget> {
  GroupScheme? selectedGroupScheme;
  ResourceManagerUnit? selectedResourceManagerUnit;

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 38),
          alignment: Alignment.centerLeft,
          color: context.colors.blueDark1,
          child: Text(
            LocaleKeys.groupSchemeManagement.tr(),
            style: context.textStyles.bodyBold.copyWith(
              color: context.colors.white,
            ),
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
          const SizedBox(height: 36),
        ],
      ],
    );
  }

  Future<void> _onNext() async {
    if (selectedGroupScheme == null || selectedResourceManagerUnit == null) {
      return;
    }

    await configService.setActiveUserRole(userRole: UserRoleEnum.regionalManager);
    await context.read<UserInfoCubit>().setActiveUserInfo(isBehave: false);
    if (mounted) {
      await RMSyncScreen.push(
        context,
        selectedGroupScheme: selectedGroupScheme!,
        selectedResourceManagerUnit: selectedResourceManagerUnit!,
      );
    }
  }
}
