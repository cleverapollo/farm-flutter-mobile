import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberPropertyOwnershipSection extends StatelessWidget {

  const MemberPropertyOwnershipSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MemberDetailCubit, MemberDetailState, MemberPropertyOwnershipState>(
      selector: (state) => state.memberPropertyOwnershipState,
      builder: (context, memberPropertyOwnershipState) {
        final isHintText = memberPropertyOwnershipState.propertyTypeSelected?.farmPropertyOwnershipTypeName == null;
        return ExpandableItemWidget(
          title: LocaleKeys.member_property_ownership.tr(),
          showTick: memberPropertyOwnershipState.isComplete,
          isCollapse: memberPropertyOwnershipState.isSectionCollapse,
          onTap: context.read<MemberDetailCubit>().onChangeMPOState,
          child: Container(
            color: context.colors.white,
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
                    LocaleKeys.property_type.tr(),
                    style: context.textStyles.titleBold.copyWith(
                      color: context.colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await showCustomBottomSheet<void>(
                      context,
                      content: ListView.builder(
                        itemCount: memberPropertyOwnershipState.propertyTypes.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              context
                                  .read<MemberDetailCubit>()
                                  .onUpdateMemberPropertyOwnershipState(memberPropertyOwnershipState.propertyTypes[index]);
                              Navigator.pop(context);
                            },

                            title: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Text(
                                memberPropertyOwnershipState.propertyTypes[index]
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
                            memberPropertyOwnershipState.propertyTypeSelected
                                ?.farmPropertyOwnershipTypeName ??
                                '${LocaleKeys.select.tr()} ${LocaleKeys.property_type.tr().toLowerCase()}',
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
