import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class SelectCompartmentWidget extends StatefulWidget {

  final List<Compartment> compartments;
  final void Function(Compartment) onSave;
  final bool shouldShowSearchField;

  const SelectCompartmentWidget({
    super.key,
    required this.onSave,
    this.compartments = const <Compartment>[],
    this.shouldShowSearchField = true,
  });

  @override
  _SelectCompartmentWidgetState createState() => _SelectCompartmentWidgetState();
}

class _SelectCompartmentWidgetState extends State<SelectCompartmentWidget> {

  Timer? _debounceInputTimer;

  List<Compartment> filterListItems = <Compartment>[];

  @override
  void initState() {
    super.initState();
    filterListItems = widget.compartments;
  }

  void onSearch(String? inputSearch) {
    if (inputSearch == null || inputSearch.isEmpty) {
      filterListItems = widget.compartments;
    } else {
      filterListItems = widget.compartments
          .where(
            (element) =>
        element.unitNumber
            ?.toLowerCase()
            .contains(inputSearch.toLowerCase()) ??
            false,
      )
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.shouldShowSearchField)
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
            child: CmoTextField(
              name: LocaleKeys.search.tr(),
              hintText: LocaleKeys.search.tr(),
              suffixIcon: Assets.icons.icSearch.svg(),
              onChanged: (input) {
                _debounceInputTimer?.cancel();
                _debounceInputTimer = Timer(
                  const Duration(milliseconds: 200),
                      () => onSearch(input),
                );
              },
            ),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: filterListItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  widget.onSave(filterListItems[index]);
                  Navigator.pop(context);
                },
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    filterListItems[index].unitNumber ?? '',
                    style: context.textStyles.bodyBold.copyWith(
                      color: context.colors.blueDark2,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
