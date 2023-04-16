import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/entity_list.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

class GroupSchemeEntityScreen<T> extends StatefulWidget {
  final T? selectedEntity;

  const GroupSchemeEntityScreen({this.selectedEntity, super.key});

  static Future push<T>(BuildContext context, {T? selectedItem}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GroupSchemeEntityScreen(selectedEntity: selectedItem),
      ),
    );
  }

  @override
  State<GroupSchemeEntityScreen> createState() =>
      _GroupSchemeEntityScreenState();
}

class _GroupSchemeEntityScreenState extends State<GroupSchemeEntityScreen> {
  var entities = [
    EntityItem("Group scheme 1", displayString: () => "Group scheme 1"),
    EntityItem("Group scheme 2", displayString: () => "Group scheme 2"),
    EntityItem("Group scheme 3", displayString: () => "Group scheme 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.entity.tr(),
        ),
        body: EntityList(
          // TODO: Should fetch them from db instead of hard-coded
          entityItems: entities,
          selectedItem:
              entities.firstWhereOrNull((e) => e.rawData == widget.selectedEntity),
          onTap: (item) => Navigator.of(context).pop(item.rawData),
        ),
      ),
    );
  }
}
