import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/audit_list_questions_cubit/audit_list_questions_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditQuestionItem extends StatelessWidget {
  const AuditQuestionItem({
    super.key,
    required this.question,
    required this.viewListPhoto,
    required this.viewListComment,
    required this.addAnswer,
    required this.compliances,
    this.answer,
  });

  final AuditQuestion question;
  final QuestionAnswer? answer;
  final VoidCallback viewListPhoto;
  final VoidCallback viewListComment;
  final void Function(Compliance) addAnswer;
  final List<Compliance> compliances;

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
                          color: answer != null && answer?.complianceId == compliance.complianceId
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
                    child: BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, bool>(
                      selector: (state) =>
                          state.auditQuestionPhotos.where((e) => e.questionId == question.questionId).isNotBlank,
                      builder: (context, havePhoto) => CmoCircelIconButton(
                        color: havePhoto ? context.colors.green : Colors.transparent,
                        icon: SizedBox(
                          width: 20,
                          height: 20,
                          child: Assets.icons.icCamera.svgBlack,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  CmoTappable(
                    onTap: viewListComment,
                    child: BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, bool>(
                      selector: (state) =>
                          state.questionComments.where((e) => e.questionId == question.questionId).isNotBlank,
                      builder: (context, haveComment) => CmoCircelIconButton(
                        color: haveComment ? context.colors.green : Colors.transparent,
                        icon: SizedBox(
                          width: 20,
                          height: 20,
                          child: Assets.icons.icComment.svgBlack,
                        ),
                      ),
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
