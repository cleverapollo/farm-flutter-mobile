import 'dart:async';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/multiple_selection_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetMultipleSelectionItem<T> {

  const BottomSheetMultipleSelectionItem({
    required this.item,
    this.id,
    this.titleValue,
  });

  final T item;
  final String? id;
  final String? titleValue;
}

class BottomSheetMultipleSelection<T> extends StatefulWidget {
  const BottomSheetMultipleSelection({
    super.key,
    required this.onSave,
    this.listItems = const [],
    this.selectedItems = const [],
    this.alwaysShowSearchField = true,
  });

  final List<BottomSheetMultipleSelectionItem<T>> listItems;
  final List<BottomSheetMultipleSelectionItem<T>> selectedItems;
  final void Function(List<T>) onSave;
  final bool alwaysShowSearchField;

  @override
  State<StatefulWidget> createState() => _BottomSheetMultipleSelectionState<T>();
}

class _BottomSheetMultipleSelectionState<T> extends State<BottomSheetMultipleSelection<T>> {
  Timer? _debounceInputTimer;

  List<BottomSheetMultipleSelectionItem<T>> selectedItems = <BottomSheetMultipleSelectionItem<T>>[];
  List<BottomSheetMultipleSelectionItem<T>> filterListItems = <BottomSheetMultipleSelectionItem<T>>[];

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    filterListItems = widget.listItems;
    selectedItems.addAll(widget.selectedItems);
  }

  void onSearch(String? inputSearch) {
    if (inputSearch == null || inputSearch.isEmpty) {
      filterListItems = widget.listItems;
    } else {
      filterListItems = widget.listItems
          .where(
            (element) =>
        element.titleValue
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

  void onSelectAll() {
    setState(() {
      selectedItems.clear();
      selectedItems.addAll(widget.listItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.alwaysShowSearchField || widget.listItems.length >= 7)
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
            child: CmoTextField(
              name: LocaleKeys.search.tr(),
              hintText: LocaleKeys.search.tr(),
              prefixIcon: Assets.icons.icSearchOutline.svg(),
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
                child: GestureDetector(
                  onTap: onSelectAll,
                  child: Text(
                    LocaleKeys.select_all_value_items.tr(args: [selectedItems.length.toString()]),
                    style: context.textStyles.bodyBold.blue,
                  ),
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
          child: Scrollbar(
            controller: scrollController,
            child: ListView.builder(
              controller: scrollController,
              itemCount: filterListItems.length,
              itemBuilder: (context, index) =>
                  _buildItem(filterListItems[index]),
            ),
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
                  widget.onSave(selectedItems.map((e) => e.item).toList());
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BottomSheetMultipleSelectionItem<T> item) {
    final activeItem = selectedItems.firstWhereOrNull(
          (element) => element.id == item.id,
    );

    return MultipleSelectionItem(
      onTap: () {
        final includedItem = selectedItems.firstWhereOrNull(
              (e) => e.id == item.id,
        );
        if (includedItem == null) {
          selectedItems.add(item);
        } else {
          selectedItems.removeWhere(
                  (e) => e.id == item.id);
        }

        if (mounted) setState(() {});
      },
      title: item.titleValue,
      isSelected: activeItem != null,
    );
  }
}
