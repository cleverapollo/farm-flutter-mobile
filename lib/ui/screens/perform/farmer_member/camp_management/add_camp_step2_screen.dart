import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_step3_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class AddCampStep2Screen extends StatefulWidget {
  Camp camp;

  AddCampStep2Screen(this.camp, {Key? key}) : super(key: key);

  static void push(BuildContext context, Camp camp) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AddCampStep2Screen(camp)),
    );
  }

  @override
  State<AddCampStep2Screen> createState() => _AddCampStep2ScreenState();
}

class _AddCampStep2ScreenState extends State<AddCampStep2Screen> {
  late Camp camp;

  @override
  void initState() {
    super.initState();
    camp = widget.camp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.add_camp.tr(),
        showLeading: true,
        showTrailing: true,
        trailing: Assets.icons.icClose.svgBlack,
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
                      '${LocaleKeys.summary.tr()}: 0% ${LocaleKeys
                          .ofLandAllocated.tr()}',
                      style: context.textStyles.bodyBold,
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
                            part1: '${LocaleKeys.category.tr()} 1:',
                            part2:
                            ' ${LocaleKeys.add_camp_category_1_infested.tr()} ',
                            part3: LocaleKeys.add_camp_category_1.tr(),
                            onChanged: (value) => camp.infestationCategory1 = double.tryParse(value),
                          ),
                          _CategoryItem(
                            part1: '${LocaleKeys.category.tr()} 2:',
                            part2:
                            ' ${LocaleKeys.add_camp_category_2_infested.tr()} ',
                            part3: LocaleKeys.add_camp_category_2.tr(),
                            onChanged: (value) => camp.infestationCategory2 = double.tryParse(value),
                          ),
                          _CategoryItem(
                            part1: '${LocaleKeys.category.tr()} 3:',
                            part2:
                            ' ${LocaleKeys.add_camp_category_3_infested.tr()} ',
                            part3: LocaleKeys.add_camp_category_3.tr(),
                            onChanged: (value) => camp.infestationCategory3 = double.tryParse(value),
                          ),
                          _CategoryItem(
                            part1: '${LocaleKeys.category.tr()} 4:',
                            part2:
                            ' ${LocaleKeys.add_camp_category_4_infested.tr()} ',
                            part3: LocaleKeys.add_camp_category_4.tr(),
                            onChanged: (value) => camp.infestationCategory4 = double.tryParse(value),
                          ),
                          _CategoryItem(
                            part1: '${LocaleKeys.category.tr()} 5:',
                            part2:
                            ' ${LocaleKeys.add_camp_category_5_infested.tr()} ',
                            part3: LocaleKeys.add_camp_category_5.tr(),
                            onChanged: (value) => camp.infestationCategory5 = double.tryParse(value),
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
              onTap: () => _next(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _next() {
    AddCampStep3Screen.push(context, camp);
  }
}

class _CategoryItem extends StatelessWidget {
  final String part1;
  final String part2;
  final String part3;
  final ValueChanged<String>? onChanged;

  const _CategoryItem({
    required this.part1,
    required this.part2,
    required this.part3,
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
        _InputItem(onChanged: onChanged),
      ],
    );
  }
}

class _InputItem extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const _InputItem({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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