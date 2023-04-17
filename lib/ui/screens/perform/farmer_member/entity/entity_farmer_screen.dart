import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/entity.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/ui/components/entity_component/entity_search_screen.dart';
import 'package:cmo/ui/screens/cmo_dashboard_base.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:cmo/ui/widget/cmo_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/entity_list.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

class EntityFarmerScreen<T> extends StatefulWidget {
  final T? selectedEntity;

  const EntityFarmerScreen({this.selectedEntity, super.key});

  static Future push<T>(BuildContext context, {T? selectedItem}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => EntityFarmerScreen(selectedEntity: selectedItem),
      ),
    );
  }

  @override
  State<EntityFarmerScreen> createState() =>
      _EntityFarmerScreenState();
}

class _EntityFarmerScreenState<T> extends State<EntityFarmerScreen<T>> {
  var entities = [
    EntityItem("Farmer entity 1", displayString: () => "Farmer entity 1"),
    EntityItem("Farmer entity 2", displayString: () => "Farmer entity 2"),
    EntityItem("Farmer entity 3", displayString: () => "Farmer entity 3"),
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

