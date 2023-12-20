import 'dart:async';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/create_new_stake_holder/widgets/additional_multiple_selection_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class SelectCustomaryUseRight extends StatefulWidget {
  const SelectCustomaryUseRight({
    super.key,
    required this.onSave,
    this.stakeholderName,
    this.listCustomaryUseRight = const <CustomaryUseRight>[],
    this.listFarmCustomaryUseRight = const <FarmStakeholderCustomaryUseRight>[],
  });

  final List<CustomaryUseRight> listCustomaryUseRight;
  final List<FarmStakeholderCustomaryUseRight> listFarmCustomaryUseRight;
  final void Function(List<CustomaryUseRight>) onSave;
  final String? stakeholderName;

  @override
  State<StatefulWidget> createState() => _SelectCustomaryUseRightState();

  static Future<dynamic> push({
    required BuildContext context,
    required List<CustomaryUseRight> listCustomaryUseRight,
    required List<FarmStakeholderCustomaryUseRight> listFarmCustomaryUseRight,
    required void Function(List<CustomaryUseRight>) onSave,
    String? stakeholderName,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectCustomaryUseRight(
          onSave: onSave,
          stakeholderName: stakeholderName,
          listCustomaryUseRight: listCustomaryUseRight,
          listFarmCustomaryUseRight: listFarmCustomaryUseRight,
        ),
      ),
    );
  }
}

class _SelectCustomaryUseRightState extends State<SelectCustomaryUseRight> {
  Timer? _debounceInputTimer;

  List<CustomaryUseRight> selectedItems = <CustomaryUseRight>[];
  List<CustomaryUseRight> filterListItems = <CustomaryUseRight>[];

  @override
  void initState() {
    super.initState();
    filterListItems = widget.listCustomaryUseRight;
    selectedItems.addAll(
      widget.listFarmCustomaryUseRight
          .map(
            (e) => CustomaryUseRight(
              customaryUseRightId: e.customaryUseRightId,
              customaryUseRightName: widget.listCustomaryUseRight
                  .firstWhereOrNull(
                    (element) =>
                        element.customaryUseRightId == e.customaryUseRightId,
                  )
                  ?.customaryUseRightName,
            ),
          )
          .toList(),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.customary_use_rights.tr(),
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
