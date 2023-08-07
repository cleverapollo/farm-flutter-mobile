import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_cubit.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmo/ui/widget/suffix_input_formatter.dart';

class InfestationSection extends StatelessWidget {
  const InfestationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddCampCubit>();
    return BlocSelector<AddCampCubit, AddCampState, bool>(
      selector: (state) => state.addCampInfestationDetailsState.isSectionCollapse,
      builder: (context, isSectionCollapse) {
        final initCam = context.read<AddCampCubit>().state.camp;
        return ExpandableItemWidget(
          title: LocaleKeys.infestation.tr(),
          isCollapse: isSectionCollapse,
          onTap: cubit.onChangeInfestationState,
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 12, 8, 22),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: BlocSelector<AddCampCubit, AddCampState, double>(
                    selector: (state) =>
                        state.addCampInfestationDetailsState.unAllocatePercent,
                    builder: (context, unAllocatePercent) {
                      return Text(
                        '${LocaleKeys.summary.tr()}: ${unAllocatePercent < 0 ? 0 : unAllocatePercent}% ${LocaleKeys.of_land_unallocated.tr()}',
                        style: context.textStyles.bodyBold,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.what_percentage_land.tr(),
                        style:
                            context.textStyles.bodyBold.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Container(height: 2, color: context.colors.grey)
                    ],
                  ),
                ),
                _CategoryItem(
                  initialValue: initCam?.infestationCategory1,
                  part1: '${LocaleKeys.category.tr()} 1:',
                  part2: ' ${LocaleKeys.add_camp_category_1_infested.tr()} ',
                  part3: LocaleKeys.add_camp_category_1.tr(),
                  onChanged: (value) =>
                      cubit.onInfestationCategory1Changed(value),
                ),
                _CategoryItem(
                  initialValue: initCam?.infestationCategory2,
                  part1: '${LocaleKeys.category.tr()} 2:',
                  part2: ' ${LocaleKeys.add_camp_category_2_infested.tr()} ',
                  part3: LocaleKeys.add_camp_category_2.tr(),
                  onChanged: (value) =>
                      cubit.onInfestationCategory2Changed(value),
                ),
                _CategoryItem(
                  initialValue: initCam?.infestationCategory3,
                  part1: '${LocaleKeys.category.tr()} 3:',
                  part2: ' ${LocaleKeys.add_camp_category_3_infested.tr()} ',
                  part3: LocaleKeys.add_camp_category_3.tr(),
                  onChanged: (value) =>
                      cubit.onInfestationCategory3Changed(value),
                ),
                _CategoryItem(
                  initialValue: initCam?.infestationCategory4,
                  part1: '${LocaleKeys.category.tr()} 4:',
                  part2: ' ${LocaleKeys.add_camp_category_4_infested.tr()} ',
                  part3: LocaleKeys.add_camp_category_4.tr(),
                  onChanged: (value) =>
                      cubit.onInfestationCategory4Changed(value),
                ),
                _CategoryItem(
                  initialValue: initCam?.infestationCategory5,
                  part1: '${LocaleKeys.category.tr()} 5:',
                  part2: ' ${LocaleKeys.add_camp_category_5_infested.tr()} ',
                  part3: LocaleKeys.add_camp_category_5.tr(),
                  onChanged: (value) =>
                      cubit.onInfestationCategory5Changed(value),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CategoryItem extends StatelessWidget {

  const _CategoryItem({
    required this.part1,
    required this.part2,
    required this.part3,
    this.initialValue,
    this.onChanged,
    Key? key,
  }) : super(key: key);
  final String part1;
  final String part2;
  final String part3;
  final double? initialValue;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: part1,
            style: context.textStyles.bodyBold.blue,
            children: <TextSpan>[
              TextSpan(
                text: part2,
                style: context.textStyles.bodyBold,
              ),
              TextSpan(
                text: part3,
                style: context.textStyles.bodyNormal,
              ),
            ],
          ),
        ),
        AttributeItem(
            child: _InputItem(
                onChanged: onChanged, initialValue: initialValue?.toString())),
      ],
    );
  }
}

class _InputItem extends StatelessWidget {

  const _InputItem({this.initialValue, this.onChanged});

  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final percentSymbol = '%';

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller;
    if (initialValue != null) {
      controller = TextEditingController();
      controller.text = '${initialValue!.replaceAll('.0', '')}$percentSymbol';
    }

    return TextField(
      controller: controller,
      inputFormatters: [
        SuffixInputFormatter(
          symbol: percentSymbol,
        ),
      ],
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      onChanged: (text) {
        onChanged?.call(text.replaceAll(percentSymbol, ''));
      },
      style: context.textStyles.bodyNormal.blueDark2,
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        labelStyle: context.textStyles.bodyNormal.blueDark2,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
