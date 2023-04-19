import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/behave/assessment/assessment_list_comment_screen.dart';
import 'package:cmo/ui/screens/behave/assessment/assessment_list_photo_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/audit_question_item.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/car_filter.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/criteria_filter.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/indicator_filter.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/widgets/principle_filter.dart';
import 'package:cmo/ui/ui.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AuditListQuestionsScreen extends StatefulWidget {
  const AuditListQuestionsScreen({
    super.key,
    required this.audit,
  });

  final Audit audit;

  static void push(BuildContext context, Audit audit) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuditListQuestionsScreen(audit: audit),
      ),
    );
  }

  @override
  State<AuditListQuestionsScreen> createState() =>
      _AuditListQuestionsScreenState();
}

class _AuditListQuestionsScreenState extends State<AuditListQuestionsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context
          .read<AuditListQuestionsCubit>()
          .initialize(widget.audit);
    });
  }

  Future<void> _viewListComment({
    required int? questionId,
  }) async {
    AssessmentListCommentScreen.push(context, questionId: questionId);
  }

  Future<void> _viewListPhoto({
    required int? questionId,
  }) async {
    AssessmentListPhotoScreen.push(context, questionId: questionId);
  }

  Future<void> _addAnswer(
      AuditQuestion question,
      Compliance compliance,
      ) async {
    // final haveRejectReason = compliance;
    // final hasRejectReason = compliance.hasRejectReason ?? false;
    //
    // // * raise comment when choose option have reject reason
    // if (hasRejectReason) {
    //   final rejectReasons =
    //   context.read<AssessmentQuestionCubit>().getRejectReasons();
    //
    //   final comment = await AssessmentRaiseComment.push<QuestionComment?>(
    //     context,
    //     widget.assessment,
    //     question,
    //     compliance,
    //     rejectReasons,
    //   );
    //   if (context.mounted) {
    //     await context.read<AssessmentQuestionCubit>().addComment(
    //       questionId: question.questionId,
    //       commentValue: comment?.comment ?? '',
    //     );
    //   }
    //
    //   if (context.mounted && comment != null) {
    //     await context.read<AssessmentQuestionCubit>().addCommentFromReasonCode(
    //       comment,
    //       question,
    //       compliance,
    //     );
    //   }
    // }
    //
    // if (context.mounted) {
    //   await context.read<AssessmentQuestionCubit>().setAnswer(
    //     question,
    //     compliance,
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuditListQuestionsCubit>().state;
    final assessment = context.watch<AuditListQuestionsCubit>().getAssessment();
    final allQuestions = context.watch<AuditListQuestionsCubit>().getFilteredQuestions();

    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.audit.tr(),
        subtitle: assessment?.jobCategoryName,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          _buildFilterSection(),
          BlocSelector<AssessmentQuestionCubit, AssessmentQuestionState, bool>(
            selector: (state) {
              return state.incompleteFilter == 1;
            },
            builder: (context, isComplete) => CmoHeaderTile(
              title: isComplete
                  ? LocaleKeys.completed.tr()
                  : LocaleKeys.incomplete.tr(),
              child: Row(
                children: [
                  CmoTappable(
                    onTap: () {
                      context
                          .read<AssessmentQuestionCubit>()
                          .setIncompleteFilter(isComplete ? 0 : 1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: !isComplete ? Colors.white : Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: !isComplete
                            ? Assets.icons.icTick.svg()
                            : Assets.icons.icTick.svgWhite,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.icCamera.svgWhite,
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: BlocSelector<AssessmentQuestionCubit,
                              AssessmentQuestionState, int>(
                            selector: (state) => state.questionPhotos.length,
                            builder: (context, lengthPhoto) => Text(
                              '$lengthPhoto',
                              style: context.textStyles.bodyBold.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Assets.icons.icComment.svgWhite,
                      const SizedBox(width: 6),
                      BlocSelector<AssessmentQuestionCubit,
                          AssessmentQuestionState, int>(
                        selector: (state) => state.questionComments.length,
                        builder: (context, questionCommentsLength) => Text(
                          '$questionCommentsLength',
                          style: context.textStyles.bodyBold.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: allQuestions.length,
              itemBuilder: (context, index) {
                final question = allQuestions[index];
                final answer = context
                    .watch<AssessmentQuestionCubit>()
                    .getAnswerByQuestionId(question.questionId);

                return AuditQuestionItem(
                  question: question,
                  answer: answer,
                  compliances: state.compliances,
                  viewListPhoto: () {
                    _viewListPhoto(
                      questionId: question.questionId,
                    );
                  },
                  addAnswer: (compliance) {
                    _addAnswer(
                      question,
                      compliance,
                    );
                  },

                  viewListComment: () {
                    _viewListComment(
                      questionId: question.questionId,
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: context.colors.grey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFilterRow(
              firstChild: PrincipleFilter(formKey: _formKey),
              secondChild: CriteriaFilter(formKey: _formKey),
            ),
            const SizedBox(
              height: 12,
            ),
            _buildFilterRow(
              firstChild: CarFilter(formKey: _formKey),
              secondChild: IndicatorFilter(formKey: _formKey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterRow({required Widget firstChild, required Widget secondChild}) {
    return Row(
      children: [
        Expanded(child: firstChild),
        Expanded(child: secondChild),
      ].withSpaceBetween(width: 12),
    );
  }
}