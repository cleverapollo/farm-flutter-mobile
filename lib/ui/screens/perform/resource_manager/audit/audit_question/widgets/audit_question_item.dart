import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/audit_list_questions_cubit/audit_list_questions_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_icon_with_number_widget.dart';
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
    required this.onTapLocation,
    required this.onTapCamera,
    this.answer,
    this.reactMaximumUploadedPhoto = false,
  });

  final FarmQuestion question;
  final QuestionAnswer? answer;
  final List<Compliance> compliances;
  final VoidCallback viewListPhoto;
  final VoidCallback viewComment;
  final VoidCallback onTapLocation;
  final VoidCallback onTapCamera;
  final bool reactMaximumUploadedPhoto;
  final void Function(Compliance) addAnswer;

  @override
  Widget build(BuildContext context) {
    final ncCompliance = compliances.firstWhereOrNull(
      (element) => element.isNC,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
                  builder: (context, state) {
                    return RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '${question.indicatorName ?? ''} ',
                            style: context.textStyles.bodyBold.black,
                          ),
                          TextSpan(
                            text: '${question.questionValue}',
                            style: context.textStyles.bodyNormal,
                          ),
                        ],
                      ),
                    );
                  },
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
                              ? getAnswerColor(context, compliance)
                              : context.colors.white,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Visibility(
                visible: ncCompliance != null &&
                    answer != null &&
                    ncCompliance.complianceId == answer!.complianceId,
                child: Row(
                  children: [
                    BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, AuditListQuestionsState>(
                      selector: (state) => state,
                      builder: (context, state) {
                        return CmoNumberIconWidget.byEnum(
                          onTap: viewListPhoto,
                          number: state.questionPhotos
                              .where((element) =>
                          element.questionId == question.questionId)
                              .length,
                          enable: state
                              .getListPhotoFilteredQuestions(
                              question.questionId)
                              .isNotBlank,
                          iconType: AuditQuestionIconEnum.gallery,
                        );
                      },
                    ),
                    CmoNumberIconWidget.byEnum(
                      iconType: AuditQuestionIconEnum.location,
                      onTap: onTapLocation,
                      number: answer?.latitude != null && answer?.longitude != null
                              ? 1
                              : null,
                      enable:
                          answer?.latitude != null && answer?.longitude != null,
                    ),
                    BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, AuditListQuestionsState>(
                      selector: (state) => state,
                      builder: (context, state) {
                        return CmoNumberIconWidget.byEnum(
                          onTap: onTapCamera,
                          iconType: AuditQuestionIconEnum.camera,
                          isDisable: reactMaximumUploadedPhoto,
                        );
                      },
                    ),
                    BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
                      builder: (context, state) {
                        final enable = state.getQuestionCommentsWithQuestionId(question.questionId) != null;
                        return CmoNumberIconWidget.byEnum(
                          onTap: viewComment,
                          number: enable ? 1 : null,
                          enable: enable,
                          iconType: AuditQuestionIconEnum.comment,
                        );
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color getAnswerColor(
    BuildContext context,
    Compliance compliance,
  ) {
    if (compliance.complianceName.isBlank) return context.colors.white;
    if (compliance.complianceName!.contains('N/A')) {
      return context.colors.greyCCCC;
    } else if (compliance.isNC) {
      return context.colors.yellow;
    } else if (compliance.complianceName!.contains('C')) {
      return context.colors.greenC600;
    }

    return context.colors.white;
  }
}
