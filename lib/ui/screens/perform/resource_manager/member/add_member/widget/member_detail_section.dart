
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cmo_collapse_title_widget.dart';

class MemberDetailSection extends StatelessWidget {
  const MemberDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MemberDetailCubit, MemberDetailState, MemberDetailSectionState>(
      selector: (state) => state.memberDetailSectionState,
      builder: (context, memberDetailSectionState) {
        final cubit = context.read<MemberDetailCubit>();
        return CmoCollapseTitle(
          key: memberDetailSectionState.sectionKey,
          initiallyExpanded: !memberDetailSectionState.isSectionCollapse,
          title: LocaleKeys.member_detail.tr(),
          showTick: memberDetailSectionState.isComplete,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AttributeItem(
                  isShowError: memberDetailSectionState.isFirstNameError,
                  errorText: LocaleKeys.firstName.tr(),
                  child: InputAttributeItem(
                    initialValue: memberDetailSectionState.firstName,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.firstName.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onSubmitted: (p0) {
                      if (memberDetailSectionState.isComplete) {
                        cubit.onChangeMemberDetailState(isCollapse: true);
                        cubit.onChangeSiteDetailState(isCollapse: false);
                      }
                    },
                    onChanged: (value) {
                      cubit.onChangeMemberDetailSection(firstName: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: memberDetailSectionState.isLastNameError,
                  errorText: LocaleKeys.lastName.tr(),
                  child: InputAttributeItem(
                    initialValue: memberDetailSectionState.lastName,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.lastName.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onSubmitted: (p0) {
                      if (memberDetailSectionState.isComplete) {
                        cubit.onChangeMemberDetailState(isCollapse: true);
                        cubit.onChangeSiteDetailState(isCollapse: false);
                      }
                    },
                    onChanged: (value) {
                      cubit.onChangeMemberDetailSection(lastName: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: memberDetailSectionState.isIdNumberError,
                  errorText: LocaleKeys.idPassportNumber.tr(),
                  child: InputAttributeItem(
                    initialValue: memberDetailSectionState.idNumber,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.idPassportNumber.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (p0) {
                      if (memberDetailSectionState.isComplete) {
                        cubit.onChangeMemberDetailState(isCollapse: true);
                        cubit.onChangeSiteDetailState(isCollapse: false);
                      }
                    },
                    onChanged: (value) {
                      cubit.onChangeMemberDetailSection(idNumber: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: memberDetailSectionState.isMobileNumberError,
                  errorText: LocaleKeys.mobileNumber.tr(),
                  child: InputAttributeItem(
                    initialValue: memberDetailSectionState.mobileNumber,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.mobileNumber.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    keyboardType: TextInputType.phone,
                    onSubmitted: (p0) {
                      if (memberDetailSectionState.isComplete) {
                        cubit.onChangeMemberDetailState(isCollapse: true);
                        cubit.onChangeSiteDetailState(isCollapse: false);
                      }
                    },
                    onChanged: (value) {
                      cubit.onChangeMemberDetailSection(mobileNumber: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  errorText: 'Please enter a valid email format',
                  isShowError: memberDetailSectionState.isEmailError,
                  child: InputAttributeItem(
                    initialValue: memberDetailSectionState.emailAddress,
                    textStyle: context.textStyles.bodyNormal.black,
                    labelText:
                    '${LocaleKeys.emailAddress.tr()} (${LocaleKeys.optional.tr()})',
                    labelTextStyle: context.textStyles.bodyNormal.blueDark2,
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (text) {
                      if (memberDetailSectionState.isComplete) {
                        cubit.onChangeMemberDetailState(isCollapse: true);
                        cubit.onChangeSiteDetailState(isCollapse: false);
                      }
                    },
                    onChanged: (value) {
                      cubit.onChangeMemberDetailSection(emailAddress: value);
                    },
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
