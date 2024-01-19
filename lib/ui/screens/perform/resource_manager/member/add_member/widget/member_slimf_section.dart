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

WidgetSpan superScript(BuildContext context, {
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

class MemberSLIMFSection extends StatelessWidget {

  const MemberSLIMFSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addMemberCubit = context.read<MemberDetailCubit>();
    return BlocSelector<MemberDetailCubit, MemberDetailState, MemberSLIMFState>(
      selector: (state) => state.memberSLIMFState,
      builder: (context, memberSLIMFState) {
        return ExpandableItemWidget(
          title: LocaleKeys.slimf_compliance.tr(),
          showTick: memberSLIMFState.isComplete,
          isCollapse: memberSLIMFState.isSectionCollapse,
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
                  initialValue: memberSLIMFState.isSlimfCompliant,
                  alignCenter: true,
                  textStyle: context.textStyles.bodyBold,
                  onTap: addMemberCubit.onUpdateSlimfSection,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
