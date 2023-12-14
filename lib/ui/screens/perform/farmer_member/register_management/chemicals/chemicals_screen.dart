import 'dart:async';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/chemical.dart';
import 'package:cmo/state/register_management_chemical_cubit/register_management_chemical_cubit.dart';
import 'package:cmo/state/register_management_chemical_cubit/register_management_chemical_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/chemicals/adding_chemical_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/register_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChemicalsScreen extends BaseStatefulWidget {
  ChemicalsScreen({super.key}) : super(screenName: LocaleKeys.chemicals.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider<RMChemicalCubit>(
          create: (_) => RMChemicalCubit()..initListData(),
          child: ChemicalsScreen(),
        ),
      ),
    );
  }

  @override
  State<ChemicalsScreen> createState() => _ChemicalsScreenState();
}

class _ChemicalsScreenState extends BaseStatefulWidgetState<ChemicalsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RMChemicalCubit, RMChemicalState>(
      builder: (context, state) {
        final cubit = context.read<RMChemicalCubit>();
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.chemicals.tr(),
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icUpdatedAddButton.svgBlack,
            onTapTrailing: () async {
              final shouldRefresh = await AddingChemicalScreen.push(context);

              if (shouldRefresh != null && context.mounted) {
                await cubit.initListData();
              }
            },
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
                            : InkWell(
                          onTap: () async {
                            final shouldRefresh =
                            await AddingChemicalScreen.push(
                                context, data: state.chemicalsSearch[index]);

                            if (shouldRefresh != null && context.mounted) {
                              await context.read<RMChemicalCubit>()
                                  .initListData();
                            }
                          },

                          child: RegisterItem(
                            title: '${LocaleKeys.chemicals.tr()}: ${state
                                .chemicalsSearch[index].chemicalNo}',
                            mapData: generateInformationMapData(state
                                .chemicalsSearch[index]),
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Map<String, String?> generateInformationMapData(Chemical registerItem) {
    return {
      LocaleKeys.chemicalType.tr(): registerItem.chemicalType,
      LocaleKeys.chemicalApplicationMethod.tr(): registerItem.chemicalApplicationMethod,
      LocaleKeys.dateIssued.tr(): registerItem.date?.ddMMYyyy(),
      LocaleKeys.openingStockAndPurchases.tr(): registerItem.openingStock?.toString(),
      LocaleKeys.issued.tr(): registerItem.issued?.toString(),
      LocaleKeys.balance.tr(): registerItem.balance?.toString(),
      LocaleKeys.mixture.tr(): registerItem.mixture,
      LocaleKeys.locationUsed.tr(): registerItem.campName,
      LocaleKeys.usagePerHa.tr(): registerItem.usagePerHa?.toString(),
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
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