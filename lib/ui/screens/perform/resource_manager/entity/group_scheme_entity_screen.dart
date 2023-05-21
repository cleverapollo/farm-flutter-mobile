import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/state/entity_cubit/resource_manager/resource_manager_group_scheme_cubit.dart';
import 'package:cmo/state/entity_cubit/resource_manager/resource_manager_group_scheme_state.dart';
import 'package:cmo/ui/components/entity_list.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupSchemeEntityScreen extends StatefulWidget {
  final GroupScheme? selectedEntity;

  const GroupSchemeEntityScreen({this.selectedEntity, super.key});

  static Future<GroupScheme?> push(BuildContext context, {GroupScheme? selectedItem}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => ResourceManagerGroupSchemeCubit(),
            child: GroupSchemeEntityScreen(selectedEntity: selectedItem),
          );
        },
      ),
    );
  }

  @override
  State<GroupSchemeEntityScreen> createState() =>
      _GroupSchemeEntityScreenState();
}

class _GroupSchemeEntityScreenState extends State<GroupSchemeEntityScreen> {

  @override
  void initState() {
    super.initState();
    context.read<ResourceManagerGroupSchemeCubit>().fetchGroupSchemes(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.entity.tr(),
        ),
        body: Stack(
          children: [
            BlocSelector<ResourceManagerGroupSchemeCubit, ResourceManagerGroupSchemeState,
                List<GroupScheme>>(
              selector: (state) => state.groupSchemes,
              builder: (context, groupSchemes) {
                if (groupSchemes.isEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'There are no Group Schemes',
                      style: context.textStyles.bodyBold,
                    ),
                  );
                }
                final entities = groupSchemes
                    .map((e) => EntityItem<GroupScheme>(e,
                        displayString: () => e.groupSchemeName ?? ''))
                    .toList();
                return EntityList(
                  entityItems: entities,
                  selectedItem: entities.firstWhereOrNull(
                      (e) => e.rawData.id == widget.selectedEntity?.id),
                  onTap: (item) {
                    context.read<ResourceManagerGroupSchemeCubit>().setSelectedGroupScheme(item.rawData);
                    Navigator.of(context).pop(item.rawData);
                  },
                );
              },
            ),
            BlocSelector<ResourceManagerGroupSchemeCubit, ResourceManagerGroupSchemeState,
                bool>(
              selector: (state) => state.isGroupSchemeLoading,
              builder: (context, state) => state
                  ? Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: CircularProgressIndicator(),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
