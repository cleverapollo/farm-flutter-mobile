import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cmo_chip_item_widget.dart';
import 'slimf_compliant_limitation_1_content.dart';
import 'slimf_compliant_limitation_2.dart';
import 'slimf_compliant_limitation_2_content.dart';

WidgetSpan superScript(
    BuildContext context, {
      String text = 'm3/ha/yr',
      TextStyle? textStyle,
    }) {
  final _textStyle = textStyle ?? context.textStyles.bodyNormal;
  return WidgetSpan(
    child: Transform.translate(
      offset: const Offset(0.0, -7.0),
      child: Text(
        text,
        style: _textStyle.copyWith(fontSize: 10),
      ),
    ),
  );
}

class SlimfAndMpoSection extends StatefulWidget {
  const SlimfAndMpoSection({super.key});

  @override
  State<StatefulWidget> createState() => _SlimfAndMpoSectionState();
}

class _SlimfAndMpoSectionState extends State<SlimfAndMpoSection> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSlimfCompliance(),
        const SizedBox(height: 12),
        buildMPO(),
      ],
    );
  }

  Widget buildSlimfCompliance() {
    final addMemberCubit = context.read<AddMemberCubit>();
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberSLIMF>(
      selector: (state) => state.addMemberSLIMF,
      builder: (context, data) {
        return ExpandableItemWidget(
          title: LocaleKeys.slimf_compliance.tr(),
          showTick: data.isComplete,
          isCollapse: data.isSectionCollapse,
          onTap: addMemberCubit.onChangeSlimfState,
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.is_the_farmer_slimf_compliant.tr(),
                  style: context.textStyles.bodyNormal.copyWith(
                    color: context.colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                // Text(
                //   LocaleKeys.slimf_compliant_limitation_1.tr().toUpperCase(),
                //   style: context.textStyles.titleBold.copyWith(
                //     color: context.colors.black,
                //     fontSize: 16,
                //   ),
                // ),
                // const SlimfCompliantLimitation1Content(),
                // const SizedBox(height: 18),
                // const SlimfCompliantLimitation2(),
                // const SlimfCompliantLimitation2Content(),
                // const SizedBox(height: 12),
                CmoYesNoQuestion(
                  initialValue: data.isSlimfCompliant,
                  alignCenter: true,
                  textStyle: context.textStyles.bodyBold,
                  onTap: (value) async {
                    await addMemberCubit.onTapSlimf(isSlimf: value);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildMPO() {
    final addMemberCubit = context.read<AddMemberCubit>();
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberMPO>(
      selector: (state) => state.addMemberMPO,
      builder: (context, AddMemberMPO data) {
        return ExpandableItemWidget(
          title: LocaleKeys.member_property_ownership.tr(),
          showTick: data.isComplete,
          isCollapse: data.isSectionCollapse,
          onTap: addMemberCubit.onChangeMPOState,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.member_property_ownership_question.tr(),
                  style: context.textStyles.bodyNormal.copyWith(
                    color: context.colors.black,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 12),
                  child: Text(
                    LocaleKeys.propertyType.tr(),
                    style: context.textStyles.titleBold.copyWith(
                      color: context.colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                selectPropertyType(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget selectPropertyType() {
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberMPO>(
      selector: (state) {
        return state.addMemberMPO;
      },
      builder: (context, addMemberMPO) {
        final isHintText = addMemberMPO.propertyTypeSelected?.farmPropertyOwnershipTypeName == null;
        return InkWell(
          onTap: () async {
            await showCustomBottomSheet(
              context,
              content: ListView.builder(
                itemCount: addMemberMPO.propertyTypes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context
                          .read<AddMemberCubit>()
                          .onDataChangeMPO(addMemberMPO.propertyTypes[index]);
                      Navigator.pop(context);
                    },

                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        addMemberMPO.propertyTypes[index]
                                .farmPropertyOwnershipTypeName ??
                            '',
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.blueDark2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: context.colors.grey),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    addMemberMPO.propertyTypeSelected
                            ?.farmPropertyOwnershipTypeName ??
                        '${LocaleKeys.select.tr()} ${LocaleKeys.propertyType.tr().toLowerCase()}',
                    style: isHintText
                        ? context.textStyles.bodyNormal.grey
                        : context.textStyles.bodyNormal.black,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: context.colors.black,
                  size: 40,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
