import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/risk_profile_question.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_chip_item_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_collapse_title_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmMemberRiskAssessmentsWidget extends StatelessWidget {
  const FarmMemberRiskAssessmentsWidget();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddMemberCubit, AddMemberState, FarmMemberRiskAssessmentsState>(
        selector: (state) => state.farmMemberRiskAssessmentsState,
        builder: (context, FarmMemberRiskAssessmentsState farmMemberRiskAssessmentsState) {
          return CmoCollapseTitle(
            title: LocaleKeys.member_risk_assessment.tr(),
            showTick: farmMemberRiskAssessmentsState.isComplete,
            child: Container(
                padding: const EdgeInsets.all(12),
                color: context.colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...farmMemberRiskAssessmentsState.listRiskProfileQuestions
                        .map(
                      (question) => buildQuestionAndAnswerWidget(
                        context,
                        question: question,
                        answer: farmMemberRiskAssessmentsState
                            .getFarmMemberRiskProfileAnswer(
                              question.riskProfileQuestionId,
                            )
                            ?.answer,
                      ),
                    ),
                    // Text(
                    //     LocaleKeys.are_there_any_chemical_being_used_on_the_fme
                    //         .tr(),
                    //     style: context.textStyles.bodyNormal.copyWith(
                    //         color: context.colors.black, fontSize: 16)),
                    // const SizedBox(height: 8),
                    // CmoYesNoQuestion(
                    //     initialValue: data.firstAnswer,
                    //     onTap: (p0) => cubit.onDataChangeMRA(firstAnswer: p0)),
                    // _buildDivider(),
                    // Text(LocaleKeys.hcvs_present.tr(),
                    //     style: context.textStyles.bodyNormal.copyWith(
                    //         color: context.colors.black, fontSize: 16)),
                    // const SizedBox(height: 8),
                    // CmoYesNoQuestion(
                    //     initialValue: data.secondAnswer,
                    //     onTap: (p0) => cubit.onDataChangeMRA(secondAnswer: p0)),
                    // _buildDivider(),
                    // Text(LocaleKeys.rivers_on_fmu.tr(),
                    //     style: context.textStyles.bodyNormal.copyWith(
                    //         color: context.colors.black, fontSize: 16)),
                    // const SizedBox(height: 8),
                    // CmoYesNoQuestion(
                    //     initialValue: data.thirdAnswer,
                    //     onTap: (p0) => cubit.onDataChangeMRA(thirdAnswer: p0)),
                    // _buildDivider(),
                    // Text(
                    //     LocaleKeys
                    //         .are_there_any_communities_in_or_neighbouring_the_fme
                    //         .tr(),
                    //     style: context.textStyles.bodyNormal.copyWith(
                    //         color: context.colors.black, fontSize: 16)),
                    // const SizedBox(height: 8),
                    // CmoYesNoQuestion(
                    //     initialValue: data.fourthAnswer,
                    //     onTap: (p0) => cubit.onDataChangeMRA(fourthAnswer: p0)),
                    _buildDivider(),
                  ],
                ),
            ),
          );
        },
    );
  }

  Widget buildQuestionAndAnswerWidget(
    BuildContext context, {
    required RiskProfileQuestion question,
    bool? answer,
  }) {
    return Column(
      children: [
        Text(
          question.riskProfileQuestionName ?? '',
          style: context.textStyles.bodyNormal.copyWith(
            color: context.colors.black,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        CmoYesNoQuestion(
          initialValue: answer,
          onTap: (value) =>
              context.read<AddMemberCubit>().onAnswerRiskProfileQuestion(
                    answer: value,
                    question: question,
                  ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Column(
      children: const [
        SizedBox(height: 8),
        Divider(thickness: 1),
        SizedBox(height: 8),
      ],
    );
  }
}