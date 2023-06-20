import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_question_add_comment/audit_question_add_comment_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditListCommentScreen extends StatefulWidget {
  const AuditListCommentScreen({
    super.key,
    required this.question,
    this.auditId,
  });

  final FarmQuestion question;
  final int? auditId;

  static void push(
    BuildContext context, {
    required FarmQuestion auditQuestion,
    int? auditId,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuditListCommentScreen(
          question: auditQuestion,
          auditId: auditId,
        ),
      ),
    );
  }

  @override
  State<AuditListCommentScreen> createState() => _AuditListCommentScreenState();
}

class _AuditListCommentScreenState extends State<AuditListCommentScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AuditQuestionCommentCubit>().initialize(
            question: widget.question,
            auditId: widget.auditId,
          );
    });
  }

  Future<void> removeComment(QuestionComment comment) async {
    await context
        .read<AuditQuestionCommentCubit>()
        .removeComment(comment: comment);
    await context.read<AuditListQuestionsCubit>().refresh();
  }

  Future<void> editComment(QuestionComment comment) async {
    final state = context.read<AuditListQuestionsCubit>().state;

    final audit = state.audit;

    final answer = state.answers.firstWhereOrNull(
      (e) => e.questionId == widget.question.questionId && e.assessmentId == audit?.assessmentId,
    );

    if (audit != null && answer != null) {
      await AuditQuestionAddCommentScreen.push(
        context,
        auditQuestion: widget.question,
        auditId: context.read<AuditListQuestionsCubit>().state.audit?.assessmentId,
        answer: answer,
        comment: comment,
      );

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.comments.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: BlocBuilder<AuditQuestionCommentCubit, AuditQuestionCommentState>(
        builder: (context, state) {
          final questionComment = state.listComments;
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: questionComment.length,
            itemBuilder: (BuildContext context, int index) {
              return CmoCard(
                shouldShowArrowRight: false,
                content: [
                  CmoCardHeader(
                    title: questionComment[index].comment ?? '',
                  ),
                  const SizedBox(height: 6),
                  CmoFilledButton(
                    onTap: () async => removeComment(questionComment[index]),
                    title: LocaleKeys.remove.tr(),
                  ),
                  CmoFilledButton(
                    onTap: () => editComment(questionComment[index]),
                    title: LocaleKeys.edit.tr(),
                  ),
                ],
              );
            },
          );
        },
      ),
      persistentFooterButtons: [
        CmoFilledButton(
          onTap: Navigator.of(context).pop,
          title: LocaleKeys.close.tr(),
        ),
      ],
    );
  }
}
