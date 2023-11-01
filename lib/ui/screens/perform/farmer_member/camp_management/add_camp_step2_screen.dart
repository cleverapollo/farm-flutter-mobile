import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_cubit.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_step3_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCampStep2Screen extends StatefulWidget {
  AddCampStep2Screen({Key? key}) : super(key: key);

  static void push(BuildContext context, AddCampCubit cubit) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider.value(
            value: cubit,
            child: AddCampStep2Screen(),
          );
        },
      ),
    );
  }

  @override
  State<AddCampStep2Screen> createState() => _AddCampStep2ScreenState();
}

class _AddCampStep2ScreenState extends State<AddCampStep2Screen> {
  late AddCampCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddCampCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddCampCubit, AddCampState, Farm?>(
      selector: (state) => state.farm,
      builder: (context, farm) {
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.add_camp.tr(),
            subtitle: farm?.farmName ?? '',
            leading: Assets.icons.icArrowLeft.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icClose.svgBlack,
            onTapTrailing: Navigator.of(context).pop,
          ),
          body: Column(
            children: [
              const SizedBox(height: 24),
              CmoHeaderTile(title: LocaleKeys.infestation.tr()),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          '${LocaleKeys.summary.tr()}: 0% ${LocaleKeys.ofLandAllocated.tr()}',
                          style: context.textStyles.bodyBold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.what_percentage_land.tr(),
                              style: context.textStyles.bodyBold
                                  .copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Container(height: 2, color: context.colors.grey)
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _CategoryItem(
                                initialValue:
                                    cubit.state.camp?.infestationCategory1 !=
                                            null
                                        ? cubit.state.camp?.infestationCategory1
                                            .toString()
                                        : null,
                                part1: '${LocaleKeys.category.tr()} 1:',
                                part2:
                                    ' ${LocaleKeys.add_camp_category_1_infested.tr()} ',
                                part3: LocaleKeys.add_camp_category_1.tr(),
                                onChanged: (value) =>
                                    cubit.onInfestationCategory1Changed(value),
                              ),
                              _CategoryItem(
                                initialValue:
                                    cubit.state.camp?.infestationCategory2 !=
                                            null
                                        ? cubit.state.camp?.infestationCategory2
                                            .toString()
                                        : null,
                                part1: '${LocaleKeys.category.tr()} 2:',
                                part2:
                                    ' ${LocaleKeys.add_camp_category_2_infested.tr()} ',
                                part3: LocaleKeys.add_camp_category_2.tr(),
                                onChanged: (value) =>
                                    cubit.onInfestationCategory2Changed(value),
                              ),
                              _CategoryItem(
                                initialValue:
                                    cubit.state.camp?.infestationCategory3 !=
                                            null
                                        ? cubit.state.camp?.infestationCategory3
                                            .toString()
                                        : null,
                                part1: '${LocaleKeys.category.tr()} 3:',
                                part2:
                                    ' ${LocaleKeys.add_camp_category_3_infested.tr()} ',
                                part3: LocaleKeys.add_camp_category_3.tr(),
                                onChanged: (value) =>
                                    cubit.onInfestationCategory3Changed(value),
                              ),
                              _CategoryItem(
                                initialValue:
                                    cubit.state.camp?.infestationCategory4 !=
                                            null
                                        ? cubit.state.camp?.infestationCategory4
                                            .toString()
                                        : null,
                                part1: '${LocaleKeys.category.tr()} 4:',
                                part2:
                                    ' ${LocaleKeys.add_camp_category_4_infested.tr()} ',
                                part3: LocaleKeys.add_camp_category_4.tr(),
                                onChanged: (value) =>
                                    cubit.onInfestationCategory4Changed(value),
                              ),
                              _CategoryItem(
                                initialValue:
                                    cubit.state.camp?.infestationCategory5 !=
                                            null
                                        ? cubit.state.camp?.infestationCategory5
                                            .toString()
                                        : null,
                                part1: '${LocaleKeys.category.tr()} 5:',
                                part2:
                                    ' ${LocaleKeys.add_camp_category_5_infested.tr()} ',
                                part3: LocaleKeys.add_camp_category_5.tr(),
                                onChanged: (value) =>
                                    cubit.onInfestationCategory5Changed(value),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: CmoFilledButton(
                  title: LocaleKeys.next.tr(),
                  onTap: () => _next(cubit.state),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  Future<void> _next(AddCampState state) async {
    final canNotNext = (state.camp?.infestationCategory1 ?? 0) == 0 ||
        (state.camp?.infestationCategory2 ?? 0) == 0 ||
        (state.camp?.infestationCategory3 ?? 0) == 0 ||
        (state.camp?.infestationCategory4 ?? 0) == 0 ||
        (state.camp?.infestationCategory5 ?? 0) == 0;

    if (canNotNext) {
      return showSnackError(msg: 'Please select required field');
    }

    await cubit.saveCamp(context);

    if (context.mounted) {
      AddCampStep3Screen.push(context, cubit);
    }
  }
}

class _CategoryItem extends StatelessWidget {
  final String part1;
  final String part2;
  final String part3;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const _CategoryItem({
    required this.part1,
    required this.part2,
    required this.part3,
    this.initialValue,
    this.onChanged,
    Key? key,
  }) : super(key: key);

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
        _InputItem(onChanged: onChanged, initialValue: initialValue),
      ],
    );
  }
}

class _InputItem extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? initialValue;

  const _InputItem({this.initialValue, this.onChanged, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller;
    if (initialValue != null) {
      controller = TextEditingController();
      controller.text = initialValue!;
    }
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.grey)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.blue)),
      ),
    );
  }
}
