import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/audit_list_questions_cubit/audit_list_questions_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditQuestionItem extends StatelessWidget {
  const AuditQuestionItem({
    super.key,
    required this.question,
    required this.compliances,
    required this.viewListPhoto,
    required this.viewComment,
    required this.addAnswer,
    this.answer,
  });

  final FarmQuestion question;
  final QuestionAnswer? answer;
  final List<Compliance> compliances;
  final VoidCallback viewListPhoto;
  final VoidCallback viewComment;
  final void Function(Compliance) addAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${question.questionValue}',
                  style: context.textStyles.bodyNormal,
                ),
              ),
              if (question.xBone ?? false)
                Icon(
                  IconsaxOutline.danger,
                  size: 24.0,
                  color: context.colors.red,
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    for (final compliance in compliances)
                      CmoTappable(
                        onTap: () => addAnswer(compliance),
                        child: CmoCircelButton(
                          title: '${compliance.complianceName}',
                          color: answer != null &&
                                  answer?.complianceId ==
                                      compliance.complianceId
                              ? context.colors.yellow
                              : context.colors.white,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  CmoTappable(
                    onTap: viewListPhoto,
                    child: BlocSelector<AuditListQuestionsCubit,
                        AuditListQuestionsState, AuditListQuestionsState>(
                      selector: (state) => state,
                      builder: (context, state) {
                        return CmoCircelIconButton(
                          color: state.getListPhotoFilteredQuestions(question.questionId).isNotBlank
                              ? context.colors.green
                              : Colors.transparent,
                          icon: SizedBox(
                            width: 20,
                            height: 20,
                            child: Assets.icons.icCamera.svgBlack,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  CmoTappable(
                    onTap: viewComment,
                    child: BlocSelector<AuditListQuestionsCubit,
                        AuditListQuestionsState, AuditListQuestionsState>(
                      selector: (state) => state,
                      builder: (context, state) {
                        return CmoCircelIconButton(
                          color: state.getListCommentsFilteredQuestions(question.questionId).isNotBlank
                              ? context.colors.green
                              : Colors.transparent,
                          icon: SizedBox(
                            width: 20,
                            height: 20,
                            child: Assets.icons.icComment.svgBlack,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
