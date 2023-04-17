import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/entity_list.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

class ResourceManagerUnitEntity<T> extends StatefulWidget {
  final T? selectedEntity;

  const ResourceManagerUnitEntity({this.selectedEntity, super.key});

  static Future push<T>(BuildContext context, {T? selectedItem}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ResourceManagerUnitEntity(selectedEntity: selectedItem),
      ),
    );
  }

  @override
  State<ResourceManagerUnitEntity> createState() =>
      _ResourceManagerUnitEntityState();
}

class _ResourceManagerUnitEntityState<T> extends State<ResourceManagerUnitEntity<T>> {
  var entities = [
    EntityItem("Resource Manager Unit 1", displayString: () => "Resource Manager Unit 1"),
    EntityItem("Resource Manager Unit 2", displayString: () => "Resource Manager Unit 2"),
    EntityItem("Resource Manager Unit 3", displayString: () => "Resource Manager Unit 3"),
  ];
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedEntity;
  }

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.entity.tr(),
        ),
        body: Column(
          children: [
            Expanded(
              child: EntityList(
                // TODO: Should fetch them from db instead of hard-coded
                entityItems: entities,
                selectedItem:
                entities.firstWhereOrNull((e) => e.rawData == _selectedItem),
                onTap: (item) {
                  _selectedItem = item.rawData as T?;
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
                        print("Sync data");
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
