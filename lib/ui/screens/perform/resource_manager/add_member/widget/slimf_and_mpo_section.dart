import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_chip_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'expandable_item_widget.dart';
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

  bool isCollapseSlimfCompliance = false;
  bool isCollapseMPO = true;

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
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberSLIMF?>(
      selector: (state) => state.addMemberSLIMF,
      builder: (context, AddMemberSLIMF? data) {
        final isSelect = data?.isSlimfCompliant;
        return ExpandableItemWidget(
          title: LocaleKeys.slimf_compliance.tr(),
          showTick: data?.isComplete,
          isCollapse: isCollapseSlimfCompliance,
          onTap: () => setState(() {
            isCollapseSlimfCompliance = !isCollapseSlimfCompliance;
          }),
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.is_the_farmer_slimf_compliant.tr(),
                    style: context.textStyles.titleBold
                        .copyWith(color: context.colors.black, fontSize: 16)),
                const SizedBox(height: 20),
                Text(
                  LocaleKeys.slimf_compliant_limitation_1.tr().toUpperCase(),
                  style: context.textStyles.titleBold.copyWith(
                    color: context.colors.black,
                    fontSize: 16,
                  ),
                ),
                const SlimfCompliantLimitation1Content(),
                const SizedBox(height: 18),
                const SlimfCompliantLimitation2(),
                const SlimfCompliantLimitation2Content(),
                const SizedBox(height: 12),
                CmoSlimfQuestion(
                  initialValue: isSelect,
                  onTap: (p0) {
                    context.read<AddMemberCubit>().onTapSlimf(isSlimf: p0!);
                    setState(() {
                      isCollapseSlimfCompliance = true;
                      isCollapseMPO = false;
                    });
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
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberMPO>(
      selector: (state) => state.addMemberMPO,
      builder: (context, AddMemberMPO data) {
        return ExpandableItemWidget(
          title: LocaleKeys.member_property_ownership.tr(),
          showTick: data.isComplete,
          isCollapse: isCollapseMPO,
          onTap: () => setState(() {
            isCollapseMPO = !isCollapseMPO;
          }),
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
        return CmoDropdown<FarmPropertyOwnershipType>(
          name: 'propertyType',
          inputDecoration: _buildInputDecoration(context, LocaleKeys.propertyType.tr()),
          initialValue: addMemberMPO.propertyTypeSelected,
          itemsData: addMemberMPO.propertyTypes
              .map(
                (e) => CmoDropdownItem<FarmPropertyOwnershipType>(
              id: e,
              name: e.farmPropertyOwnershipTypeName ?? '',
            ),
          )
              .toList(),
          onChanged: (FarmPropertyOwnershipType? farmPropertyOwnershipType) {
            context.read<AddMemberCubit>().onDataChangeMPO(farmPropertyOwnershipType);
          },
        );
      },
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context, String hintText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      isDense: true,
      hintText: '${LocaleKeys.select.tr()} ${hintText.toLowerCase()}',
      hintStyle: context.textStyles.bodyNormal.grey,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.colors.blue),
      ),
    );
  }
}
