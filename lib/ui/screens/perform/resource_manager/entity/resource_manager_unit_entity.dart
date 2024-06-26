import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/entity_cubit/resource_manager/resource_manager_unit_cubit.dart';
import 'package:cmo/state/entity_cubit/resource_manager/resource_manager_unit_state.dart';
import 'package:cmo/ui/components/entity_list.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceManagerUnitEntity extends BaseStatefulWidget {
  final ResourceManagerUnit? selectedEntity;

  const ResourceManagerUnitEntity({this.selectedEntity, super.key}) : super(screenName: 'ResourceManagerUnitEntity');

  static Future<ResourceManagerUnit?> push(
    BuildContext context, {
    required int groupSchemeId,
    ResourceManagerUnit? selectedItem,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) =>
                ResourceManagerUnitCubit(groupSchemeId: groupSchemeId),
            child: ResourceManagerUnitEntity(selectedEntity: selectedItem),
          );
        },
      ),
    );
  }

  @override
  State<ResourceManagerUnitEntity> createState() =>
      _ResourceManagerUnitEntityState();
}

class _ResourceManagerUnitEntityState<T>
    extends BaseStatefulWidgetState<ResourceManagerUnitEntity> {
  ResourceManagerUnit? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedEntity;
    context
        .read<ResourceManagerUnitCubit>()
        .fetchResourceManagerUnits(context: context);
  }

  @override
  Widget buildContent(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.entity.tr(),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                    child: BlocSelector<ResourceManagerUnitCubit,
                        ResourceManagerUnitState, List<ResourceManagerUnit>>(
                      selector: (state) => state.resourceManagerUnits,
                      builder: (context, groupSchemes) {
                        if (groupSchemes.isEmpty) {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(
                              LocaleKeys.there_are_no_resource_manager_unit.tr(),
                              style: context.textStyles.bodyBold,
                            ),
                          );
                        }
                        final entities = groupSchemes
                            .map((e) => EntityItem<ResourceManagerUnit>(e,
                                displayString: () =>
                                    e.regionalManagerUnitName ?? ''))
                            .toList();
                        return EntityList(
                          entityItems: entities,
                          selectedItem: entities.firstWhereOrNull(
                              (e) => e.rawData.id == widget.selectedEntity?.id),
                          onTap: (item) {
                            Navigator.of(context).pop(item.rawData);
                          },
                        );
                      },
                    ),
            ),
            BlocSelector<ResourceManagerUnitCubit, ResourceManagerUnitState,
                bool>(
              selector: (state) => state.isResourceManagerUnitLoading,
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
