import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/behave/assessment/assessment_raised_comment.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssessmentListCommentScreen extends StatefulWidget {
  const AssessmentListCommentScreen({
    super.key,
    required this.questionId,
  });

  final int? questionId;

  static void push(
    BuildContext context, {
    required int? questionId,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AssessmentListCommentScreen(questionId: questionId),
      ),
    );
  }

  @override
  State<AssessmentListCommentScreen> createState() =>
      _AssessmentListCommentScreenState();
}

class _AssessmentListCommentScreenState
    extends State<AssessmentListCommentScreen> {
  void addComment() {
    // * open alert new comment
  }

  Future<void> removeComment(QuestionComment comment) async {
    await context.read<AssessmentQuestionCubit>().removeComment(comment: comment);
    setState(() {});
  }

  Future<void> editComment(QuestionComment comment) async {
    final state = context
        .read<AssessmentQuestionCubit>()
        .state;
    final question = state.filteredQuestions.firstWhereOrNull(
      (e) => e.questionId == widget.questionId,
    );

    final assessment = state.assessment;

    final answer = state.answers.firstWhereOrNull(
      (e) => e.questionId == question?.questionId,
    );

    final compliance = state.compliances.firstWhereOrNull(
      (element) => element.complianceId == answer?.complianceId,
    );

    if (question != null &&
        assessment != null &&
        answer != null &&
        compliance != null) {
      await AssessmentRaiseComment.push<QuestionComment?>(
        context,
        assessment,
        question,
        compliance,
        (comment, rejectReasonId) async {
          await context.read<AssessmentQuestionCubit>().editComment(
                comment: comment,
              );
          await context.read<AssessmentQuestionCubit>().editRejectReasonId(
                rejectReasonId: rejectReasonId,
                questionId: widget.questionId,
              );
        },
        comment,
        answer.rejectReasonId,
      );

      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    final comments = context
        .watch<AssessmentQuestionCubit>()
        .state
        .questionComments
        .where(
          (e) => e.questionId == widget.questionId,
        )
        .toList();

    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.comments.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        itemBuilder: (BuildContext context, int index) {
          return CmoCard(
            shouldShowArrowRight: false,
            content: [
              CmoCardHeader(
                title: comments[index].comment ?? '',
              ),
              const SizedBox(height: 6),
              CmoFilledButton(
                onTap: () => removeComment(comments[index]),
                title: LocaleKeys.remove.tr(),
              ),
              CmoFilledButton(
                onTap: () => editComment(comments[index]),
                title: LocaleKeys.edit.tr(),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: comments.length,
      ),
      persistentFooterButtons: [
        CmoFilledButton(
          onTap: Navigator.of(context).pop,
          title: LocaleKeys.close.tr(),
        ),
        // CmoFilledButton(
        //   onTap: addComment,
        //   title: 'New Comment',
        // ),
      ],
    );
  }
}
