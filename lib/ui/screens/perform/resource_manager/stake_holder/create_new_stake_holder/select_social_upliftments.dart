import 'dart:async';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/create_new_stake_holder/widgets/additional_multiple_selection_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class SelectSocialUpliftments extends StatefulWidget {
  const SelectSocialUpliftments({
    super.key,
    required this.onSave,
    this.stakeholderName,
    this.listSocialUpliftments = const <SocialUpliftment>[],
    this.listFarmSocialUpliftments = const <FarmStakeholderSocialUpliftment>[],
  });

  final List<SocialUpliftment> listSocialUpliftments;
  final List<FarmStakeholderSocialUpliftment> listFarmSocialUpliftments;
  final void Function(List<SocialUpliftment>) onSave;
  final String? stakeholderName;

  @override
  State<StatefulWidget> createState() => _SelectSocialUpliftmentsState();

  static Future<dynamic> push({
    required BuildContext context,
    required List<SocialUpliftment> listSocialUpliftments,
    required List<FarmStakeholderSocialUpliftment> listFarmSocialUpliftments,
    required void Function(List<SocialUpliftment>) onSave,
    String? stakeholderName,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectSocialUpliftments(
          onSave: onSave,
          stakeholderName: stakeholderName,
          listSocialUpliftments: listSocialUpliftments,
          listFarmSocialUpliftments: listFarmSocialUpliftments,
        ),
      ),
    );
  }
}

class _SelectSocialUpliftmentsState extends State<SelectSocialUpliftments> {
  Timer? _debounceInputTimer;

  List<SocialUpliftment> selectedItems = <SocialUpliftment>[];
  List<SocialUpliftment> filterListItems = <SocialUpliftment>[];

  @override
  void initState() {
    super.initState();
    filterListItems = widget.listSocialUpliftments;
    selectedItems.addAll(
      widget.listFarmSocialUpliftments
          .map(
            (e) => SocialUpliftment(
              socialUpliftmentId: e.socialUpliftmentId,
              socialUpliftmentName: widget.listSocialUpliftments
                  .firstWhereOrNull(
                    (element) =>
                        element.socialUpliftmentId == e.socialUpliftmentId,
                  )
                  ?.socialUpliftmentName,
            ),
          )
          .toList(),
    );
  }

  void onSearch(String? inputSearch) {
    if (inputSearch == null || inputSearch.isEmpty) {
      filterListItems = widget.listSocialUpliftments;
    } else {
      filterListItems = widget.listSocialUpliftments
          .where(
            (element) =>
                element.socialUpliftmentName
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
        title: LocaleKeys.social_upliftments.tr(),
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

  Widget _buildItem(SocialUpliftment item) {
    final activeItem = selectedItems.firstWhereOrNull(
      (element) => element.socialUpliftmentId == item.socialUpliftmentId,
    );

    return AdditionalMultipleSelectionItem(
      onTap: () {
        final includedItem = selectedItems.firstWhereOrNull(
          (e) => e.socialUpliftmentId == item.socialUpliftmentId,
        );
        if (includedItem == null) {
          selectedItems.add(item);
        } else {
          selectedItems.removeWhere(
              (e) => e.socialUpliftmentId == item.socialUpliftmentId);
        }

        if (mounted) setState(() {});
      },
      title: item.socialUpliftmentName,
      isSelected: activeItem != null,
    );
  }
}
