import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/chemical.dart';
import 'package:cmo/state/register_management_chemical_cubit/register_management_chemical_cubit.dart';
import 'package:cmo/state/register_management_chemical_cubit/register_management_chemical_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/chemicals/adding_chemical_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChemicalsScreen extends StatefulWidget {
  const ChemicalsScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider<RMChemicalCubit>(
                create: (_) => RMChemicalCubit()..initListData(),
                child: const ChemicalsScreen())));
  }

  @override
  State<ChemicalsScreen> createState() => _ChemicalsScreenState();
}

class _ChemicalsScreenState extends State<ChemicalsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RMChemicalCubit, RMChemicalState>(
      builder: (context, state) {
        final cubit = context.read<RMChemicalCubit>();
        return Scaffold(
          appBar: CmoAppBarV2(
            title: LocaleKeys.chemicals.tr(),
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
                  onChanged: (p0) {
                    cubit.onSearch(p0 ?? '');
                  },
                  name: LocaleKeys.search.tr(),
                  prefixIcon: Assets.icons.icSearch.svg(),
                  hintText: LocaleKeys.search.tr(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => cubit.onChangeStatus(true),
                    child: _StatusFilterWidget(
                      text: LocaleKeys.open.tr(),
                      isSelected: state.isOpen,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => cubit.onChangeStatus(false),
                    child: _StatusFilterWidget(
                      text: LocaleKeys.close.tr(),
                      isSelected: !state.isOpen,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 18),
                        itemCount: state.chemicalsSearch.length,
                        separatorBuilder: (_, index) =>
                            const SizedBox(height: 14),
                        itemBuilder: (_, index) => state
                                .chemicalsSearch[index].chemicalNo.isNullOrEmpty
                            ? null
                            : _ChemicalsItem(state.chemicalsSearch[index]),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatusFilterWidget extends StatelessWidget {
  const _StatusFilterWidget({
    required this.text,
    this.isSelected = false,
  });
  final bool isSelected;
  final String text;

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
  const _ChemicalsItem(this.chemical, {super.key});
  static const double _itemHorizontalPadding = 4;

  final Chemical chemical;

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
  const _ItemRow({
    required this.title,
    required this.value,
  });
  static const double _itemHorizontalPadding = 4;
  final String title;
  final String value;

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
