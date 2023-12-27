import 'dart:async';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/stake_holder/create_new_stake_holder/widgets/additional_multiple_selection_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class SelectSpecialSite extends StatefulWidget {
  const SelectSpecialSite({
    super.key,
    required this.onSave,
    this.listSpecialSite = const <SpecialSite>[],
    this.selectedSpecialSites = const <SpecialSite>[],
  });

  final List<SpecialSite> listSpecialSite;
  final List<SpecialSite> selectedSpecialSites;
  final void Function(List<SpecialSite>) onSave;

  @override
  State<StatefulWidget> createState() => _SelectSpecialSiteState();
}

class _SelectSpecialSiteState extends State<SelectSpecialSite> {
  Timer? _debounceInputTimer;

  List<SpecialSite> selectedItems = <SpecialSite>[];
  List<SpecialSite> filterListItems = <SpecialSite>[];

  @override
  void initState() {
    super.initState();
    filterListItems = widget.listSpecialSite;
    selectedItems.addAll(widget.selectedSpecialSites);
  }

  void onSearch(String? inputSearch) {
    if (inputSearch == null || inputSearch.isEmpty) {
      filterListItems = widget.listSpecialSite;
    } else {
      filterListItems = widget.listSpecialSite
          .where(
            (element) =>
                element.specialSiteName
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
        if (widget.listSpecialSite.length >= 7)
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

  Widget _buildItem(SpecialSite item) {
    final activeItem = selectedItems.firstWhereOrNull(
      (element) => element.specialSiteId == item.specialSiteId,
    );

    return AdditionalMultipleSelectionItem(
      onTap: () {
        final includedItem = selectedItems.firstWhereOrNull(
          (e) => e.specialSiteId == item.specialSiteId,
        );
        if (includedItem == null) {
          selectedItems.add(item);
        } else {
          selectedItems
              .removeWhere((e) => e.specialSiteId == item.specialSiteId);
        }

        if (mounted) setState(() {});
      },
      title: item.specialSiteName,
      isSelected: activeItem != null,
    );
  }
}
