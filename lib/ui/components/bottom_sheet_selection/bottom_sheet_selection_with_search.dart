import 'dart:async';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/bottom_sheet_selection/bottom_sheet_multiple_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class BottomSheetSelectionWithSearch<T> extends StatefulWidget {
  const BottomSheetSelectionWithSearch({
    super.key,
    required this.onSelect,
    this.listItems = const [],
    this.alwaysShowSearchField = true,
  });

  final List<BottomSheetMultipleSelectionItem<T>> listItems;
  final void Function(T) onSelect;
  final bool alwaysShowSearchField;

  @override
  State<StatefulWidget> createState() =>
      _BottomSheetSelectionWithSearchState<T>();
}

class _BottomSheetSelectionWithSearchState<T> extends State<BottomSheetSelectionWithSearch<T>> {
  Timer? _debounceInputTimer;

  List<BottomSheetMultipleSelectionItem<T>> filterListItems = <BottomSheetMultipleSelectionItem<T>>[];

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    filterListItems = widget.listItems;
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
      ],
    );
  }

  Widget _buildItem(BottomSheetMultipleSelectionItem<T> item) {
    return ListTile(
      onTap: () {
        widget.onSelect(item.item);
        Navigator.pop(context);
      },
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
          item.titleValue ?? '',
          style: context.textStyles.bodyBold.blueDark2,
        ),
      ),
    );
  }
}
