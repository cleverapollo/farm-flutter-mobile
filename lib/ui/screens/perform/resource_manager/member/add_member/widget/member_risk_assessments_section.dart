import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/risk_profile_question.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cmo_chip_item_widget.dart';
import 'cmo_collapse_title_widget.dart';

class MemberRiskAssessmentsSection extends StatelessWidget {
  const MemberRiskAssessmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MemberDetailCubit, MemberDetailState, FarmMemberRiskAssessmentsState>(
        selector: (state) => state.farmMemberRiskAssessmentsState,
        builder: (context, FarmMemberRiskAssessmentsState farmMemberRiskAssessmentsState) {
          return CmoCollapseTitle(
            key: farmMemberRiskAssessmentsState.sectionKey,
            initiallyExpanded: !farmMemberRiskAssessmentsState.isSectionCollapse,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.riskProfileQuestionName ?? '',
          style: context.textStyles.bodyNormal.copyWith(
            color: context.colors.black,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        CmoYesNoQuestion(
          initialValue: answer,
          onTap: (value) =>
              context.read<MemberDetailCubit>().onAnswerRiskProfileQuestion(
                    answer: value,
                    question: question,
                  ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}