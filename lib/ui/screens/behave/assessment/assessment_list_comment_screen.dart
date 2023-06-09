import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/state/state.dart';
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

  void removeComment(QuestionComment comment) {
    context.read<AssessmentQuestionCubit>().removeComment(comment: comment);
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
