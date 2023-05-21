import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/farm.dart';
import 'package:cmo/state/entity_cubit/farmer/farmer_entity_cubit.dart';
import 'package:cmo/state/entity_cubit/farmer/farmer_entity_state.dart';
import 'package:cmo/ui/components/entity_list.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntityFarmerScreen<T> extends StatefulWidget {
  final Farm? selectedEntity;

  const EntityFarmerScreen({this.selectedEntity, super.key});

  static PageRoute pageRoute() {
    return MaterialPageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => FarmerEntityCubit(),
        child: const EntityFarmerScreen(selectedEntity: null),
      );
    });
  }

  @override
  State<EntityFarmerScreen> createState() =>
      _EntityFarmerScreenState();
}

class _EntityFarmerScreenState<T> extends State<EntityFarmerScreen<T>> {
  Farm? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedEntity;
    final entityCubit = context.read<FarmerEntityCubit>();
    entityCubit.fetchFarms(context: context);
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
            BlocSelector<FarmerEntityCubit, FarmerEntityState, List<Farm>>(
              selector: (state) => state.farms,
              builder: (context, farms) {
                if (farms.isEmpty) {
                  return Container(
                    child: Text(
                      'There are no farms',
                      style: context.textStyles.bodyBold,
                    ),
                  );
                }
                final entities = farms.map((e) => EntityItem<Farm>(e, displayString: () => e.farmName ?? '')).toList();
                return Column(
                  children: [
                    Expanded(
                      child: EntityList(
                        entityItems: entities,
                        selectedItem:
                        entities.firstWhereOrNull((e) => e.rawData == _selectedItem),
                        onTap: (item) {
                          _selectedItem = item.rawData;
                          context
                              .read<FarmerEntityCubit>()
                              .setSelectedFarm(_selectedItem!);
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 40),
                      child: CmoFilledButton(
                        title: LocaleKeys.sync.tr(),
                        onTap: _selectedItem == null
                            ? null
                            : () {
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            BlocSelector<FarmerEntityCubit, FarmerEntityState, bool>(
              selector: (state) => state.isLoading,
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

