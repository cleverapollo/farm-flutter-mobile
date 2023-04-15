import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/entity_tile.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';

class EntityList<T> extends StatefulWidget {
  final List<EntityItem<T>> entityItems;
  final void Function(EntityItem<T>)? onTap;
  const EntityList({
    required this.entityItems,
    this.onTap,
    super.key,
  });

  @override
  State<EntityList<T>> createState() => _EntityListState();
}

class _EntityListState<T> extends State<EntityList<T>> {
  List<EntityItem<T>> entityItems = [];
  String prevQuery = '';
  EntityItem<T>? selected;

  @override
  void initState() {
    super.initState();
    entityItems = widget.entityItems;
  }

  void filter(String? input) {
    if (input == null) return;
    final query = input.trim().toLowerCase();
    if (query == prevQuery) return;

    entityItems = widget.entityItems
        .where((e) => e.displayString.call().toLowerCase().contains(query))
        .toList();
    setState(() {});
    prevQuery = query;
  }

  void onTapTile(EntityItem<T> entityItem) {
    setState(() => selected = entityItem);
    widget.onTap?.call(entityItem);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: CmoTextField(
            name: 'SearchEntity',
            prefixIcon: Assets.icons.icSearch.svg(),
            hintText: LocaleKeys.search.tr(),
            onChanged: filter,
          ),
        ),
        Expanded(child: buildNameList()),
      ],
    );
  }

  Widget buildNameList() {
    if (entityItems.isEmpty) {
      return Text('None', style: context.textStyles.bodyNormal);
    }

    return ListView.builder(
      itemCount: entityItems.length,
      itemBuilder: (BuildContext context, int index) {
        final e = entityItems[index];
        return CmoTappable(
          onTap: () => onTapTile(e),
          child: EntityTile(
            title: e.displayString(),
            selected: e == selected,
          ),
        );
      },
    );
  }
}

class EntityItem<T> {
  final String Function() displayString;
  final T rawData;

  const EntityItem(this.rawData, {required this.displayString});

  @override
  String toString() => displayString();
}

