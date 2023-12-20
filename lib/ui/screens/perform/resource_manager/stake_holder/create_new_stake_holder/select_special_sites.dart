import 'dart:async';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/create_new_stake_holder/widgets/additional_multiple_selection_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class SelectSpecialSite extends StatefulWidget {
  const SelectSpecialSite({
    super.key,
    required this.onSave,
    this.stakeholderName,
    this.listSpecialSite = const <SpecialSite>[],
    this.listFarmSpecialSite = const <FarmStakeholderSpecialSite>[],
  });

  final List<SpecialSite> listSpecialSite;
  final List<FarmStakeholderSpecialSite> listFarmSpecialSite;
  final void Function(List<SpecialSite>) onSave;
  final String? stakeholderName;

  @override
  State<StatefulWidget> createState() => _SelectSpecialSiteState();

  static Future<dynamic> push({
    required BuildContext context,
    required List<SpecialSite> listSpecialSite,
    required List<FarmStakeholderSpecialSite> listFarmSpecialSite,
    required void Function(List<SpecialSite>) onSave,
    String? stakeholderName,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectSpecialSite(
          onSave: onSave,
          stakeholderName: stakeholderName,
          listSpecialSite: listSpecialSite,
          listFarmSpecialSite: listFarmSpecialSite,
        ),
      ),
    );
  }
}

class _SelectSpecialSiteState extends State<SelectSpecialSite> {
  Timer? _debounceInputTimer;

  List<SpecialSite> selectedItems = <SpecialSite>[];
  List<SpecialSite> filterListItems = <SpecialSite>[];

  @override
  void initState() {
    super.initState();
    filterListItems = widget.listSpecialSite;
    selectedItems.addAll(
      widget.listFarmSpecialSite
          .map(
            (e) => SpecialSite(
              specialSiteId: e.specialSiteId,
              specialSiteName: widget.listSpecialSite
                  .firstWhereOrNull(
                    (element) => element.specialSiteId == e.specialSiteId,
                  )
                  ?.specialSiteName,
            ),
          )
          .toList(),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.special_sites.tr(),
        subtitle: widget.stakeholderName,
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 32, 21, 24),
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
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 80,
                left: 21,
                right: 21,
              ),
              child: ListView.builder(
                itemCount: filterListItems.length,
                itemBuilder: (context, index) =>
                    _buildItem(filterListItems[index]),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CmoFilledButton(
        title: LocaleKeys.save.tr(),
        onTap: () {
          widget.onSave(selectedItems);
          Navigator.of(context).pop();
        },
      ),
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
