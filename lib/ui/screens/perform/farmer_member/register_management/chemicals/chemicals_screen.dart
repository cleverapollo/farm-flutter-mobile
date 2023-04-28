import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/accident_and_incident.dart';
import 'package:cmo/model/chemical.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/chemicals/adding_chemical_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChemicalsScreen extends StatefulWidget {
  final mockChemicals = <Chemical>[
    Chemical(
      createDT: DateTime.now().subtract(const Duration(days: 100)),
      comment: 'Test comment',
    ),
  ];

  ChemicalsScreen({Key? key}) : super(key: key);

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => ChemicalsScreen()));
  }

  @override
  State<ChemicalsScreen> createState() => _ChemicalsScreenState();
}

class _ChemicalsScreenState extends State<ChemicalsScreen> {
  List<Chemical> filteredChemicals = [];
  bool _isOpenSelected = true;
  Timer? _debounceSearching;

  @override
  void initState() {
    super.initState();
    filteredChemicals = widget.mockChemicals;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.accident_incidents.tr(),
        showLeading: true,
        showTrailing: true,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AddingChemicalScreen.push(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            child: CmoTextField(
              onChanged: _search,
              name: LocaleKeys.search.tr(),
              prefixIcon: Assets.icons.icSearch.svg(),
              hintText: LocaleKeys.search.tr(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setState(() => _isOpenSelected = true),
                child: _StatusFilterWidget(
                  text: LocaleKeys.open.tr(),
                  isSelected: _isOpenSelected,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => _isOpenSelected = false),
                child: _StatusFilterWidget(
                  text: LocaleKeys.close.tr(),
                  isSelected: !_isOpenSelected,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              itemCount: filteredChemicals.length,
              separatorBuilder: (_, index) => const SizedBox(height: 14),
              itemBuilder: (_, index) =>
                  _ChemicalsItem(filteredChemicals[index]),
            ),
          ),
        ],
      ),
    );
  }

  void _search(String? value) {
    _debounceSearching?.cancel();
    _debounceSearching = Timer(
      const Duration(milliseconds: 300),
      () {
        if (value?.isEmpty ?? true) {
          filteredChemicals = widget.mockChemicals;
        } else {
          filteredChemicals = widget.mockChemicals
              .where((element) => element.chemicalNo?.contains(value!) ?? false)
              .toList();
        }
        setState(() {});
      },
    );
  }
}

class _StatusFilterWidget extends StatelessWidget {
  final bool isSelected;
  final String text;

  const _StatusFilterWidget({
    required this.text,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? context.colors.blue : context.colors.white,
        border: isSelected ? null : Border.all(color: context.colors.black),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
      alignment: Alignment.center,
      child: Text(
        text,
        style: context.textStyles.bodyNormal.copyWith(
          fontSize: 12,
          color: isSelected ? context.colors.white : context.colors.black,
        ),
      ),
    );
  }
}

class _ChemicalsItem extends StatelessWidget {
  static const double _itemHorizontalPadding = 4;

  final Chemical chemical;

  const _ChemicalsItem(this.chemical, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.greyD9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _itemHorizontalPadding,
            ),
            child: Text(
              '${LocaleKeys.chemicals.tr()}: ${chemical.chemicalNo}',
              style: context.textStyles.bodyBold
                  .copyWith(color: context.colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _itemHorizontalPadding * 2,
              vertical: 6,
            ),
            child: Container(
              height: 1,
              color: context.colors.black,
            ),
          ),
          Container(
            color: context.colors.greyLight1,
            child: _ItemRow(
              title: LocaleKeys.chemicalType.tr(),
              value: chemical.chemicalType ?? '',
            ),
          ),
          _ItemRow(
            title: LocaleKeys.chemicalApplicationMethod.tr(),
            value: chemical.chemicalApplicationMethod ?? '',
          ),
          Container(
            color: context.colors.greyLight1,
            child: _ItemRow(
              title: LocaleKeys.dateIssued.tr(),
              value: chemical.date?.ddMMYyyy() ?? '',
            ),
          ),
          _ItemRow(
            title: LocaleKeys.openingStockAndPurchases.tr(),
            value: chemical.openingStock?.toString() ?? '',
          ),
          Container(
            color: context.colors.greyLight1,
            child: _ItemRow(
              title: LocaleKeys.issued.tr(),
              value: chemical.issued?.toString() ?? '',
            ),
          ),
          _ItemRow(
            title: LocaleKeys.balance.tr(),
            value: chemical.balance?.toString() ?? '',
          ),
          Container(
            color: context.colors.greyLight1,
            child: _ItemRow(
              title: LocaleKeys.mixture.tr(),
              value: chemical.mixture ?? '',
            ),
          ),
          _ItemRow(
            title: LocaleKeys.locationUsed.tr(),
            value: chemical.campName ?? '',
          ),
          Container(
            color: context.colors.greyLight1,
            child: _ItemRow(
              title: LocaleKeys.usagePerHa.tr(),
              value: chemical.usagePerHa?.toString() ?? '',
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.general_comments.tr(),
                  style: context.textStyles.bodyNormal,
                ),
                Text(
                  chemical.comment ?? '',
                  style: context.textStyles.bodyNormal,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemRow extends StatelessWidget {
  static const double _itemHorizontalPadding = 4;
  final String title;
  final String value;

  const _ItemRow({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textStyles.bodyNormal,
          ),
          Text(
            value,
            style: context.textStyles.bodyNormal,
          )
        ],
      ),
    );
  }
}
