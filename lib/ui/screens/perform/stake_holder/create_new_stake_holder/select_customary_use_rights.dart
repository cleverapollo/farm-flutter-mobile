import 'dart:async';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/stake_holder/create_new_stake_holder/widgets/additional_multiple_selection_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class SelectCustomaryUseRight extends StatefulWidget {
  const SelectCustomaryUseRight({
    super.key,
    required this.onSave,
    this.listCustomaryUseRight = const <CustomaryUseRight>[],
    this.selectedCustomaryUseRights = const <CustomaryUseRight>[],
  });

  final List<CustomaryUseRight> listCustomaryUseRight;
  final List<CustomaryUseRight> selectedCustomaryUseRights;
  final void Function(List<CustomaryUseRight>) onSave;

  @override
  State<StatefulWidget> createState() => _SelectCustomaryUseRightState();
}

class _SelectCustomaryUseRightState extends State<SelectCustomaryUseRight> {
  Timer? _debounceInputTimer;

  List<CustomaryUseRight> selectedItems = <CustomaryUseRight>[];
  List<CustomaryUseRight> filterListItems = <CustomaryUseRight>[];

  @override
  void initState() {
    super.initState();
    filterListItems = widget.listCustomaryUseRight;
    selectedItems.addAll(widget.selectedCustomaryUseRights);
  }

  void onSearch(String? inputSearch) {
    if (inputSearch == null || inputSearch.isEmpty) {
      filterListItems = widget.listCustomaryUseRight;
    } else {
      filterListItems = widget.listCustomaryUseRight
          .where(
            (element) =>
        element.customaryUseRightName
            ?.toLowerCase()
            .contains(inputSearch.toLowerCase()) ??
            false,
      )
          .toList();
    }

    setState(() {});
  }

  void onClear() {
    setState(() {
      selectedItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.listCustomaryUseRight.length >= 7)
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Row(
            children: [
              Assets.icons.icRemoveSelection.svg(),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  LocaleKeys.select_all_value_items.tr(args: [selectedItems.length.toString()]),
                  style: context.textStyles.bodyBold.blue,
                ),
              ),
              GestureDetector(
                onTap: onClear,
                child: Text(
                  LocaleKeys.clear.tr(),
                  style: context.textStyles.bodyBold.blue,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filterListItems.length,
            itemBuilder: (context, index) =>
                _buildItem(filterListItems[index]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CmoFilledButton(
                title: LocaleKeys.cancel.tr(),
                onTap: Navigator.of(context).pop,
              ),
              CmoFilledButton(
                title: LocaleKeys.save.tr(),
                onTap: () {
                  widget.onSave(selectedItems);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(CustomaryUseRight item) {
    final activeItem = selectedItems.firstWhereOrNull(
          (element) => element.customaryUseRightId == item.customaryUseRightId,
    );

    return AdditionalMultipleSelectionItem(
      onTap: () {
        final includedItem = selectedItems.firstWhereOrNull(
              (e) => e.customaryUseRightId == item.customaryUseRightId,
        );
        if (includedItem == null) {
          selectedItems.add(item);
        } else {
          selectedItems.removeWhere(
                  (e) => e.customaryUseRightId == item.customaryUseRightId);
        }

        if (mounted) setState(() {});
      },
      title: item.customaryUseRightName,
      isSelected: activeItem != null,
    );
  }
}
