import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/data/audit_question_comment.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'audit_question_comment_state.dart';

class AuditQuestionCommentCubit extends Cubit<AuditQuestionCommentState> {
  AuditQuestionCommentCubit() : super(const AuditQuestionCommentState());

  Future<void> initialize({
    required FarmQuestion question,
    int? auditId,
  }) async {
    try {
      final rejectReasons = await cmoDatabaseMasterService.getRejectReasons();
      emit(
        state.copyWith(
          question: question,
          auditId: auditId,
          rejectReasons: rejectReasons,
        ),
      );

      await getListQuestionComment();
    } catch (error) {
      handleError(error);
    }
  }

  Future<void> getListQuestionComment() async {
    if (state.auditId == null || state.question?.questionId == null) return;
    final listComments = await cmoDatabaseMasterService.getQuestionComments(
      state.auditId!,
      state.question!.questionId,
    );

    emit(state.copyWith(listComments: listComments));
  }

  Future<bool> addComment({
    required String commentValue,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      final comment = QuestionComment(
        questionId: state.question?.questionId,
        commentId: DateTime.now().millisecondsSinceEpoch,
        assessmentId: state.auditId,
        comment: commentValue,
      );

      await cmoDatabaseMasterService.cacheQuestionComment(comment);
      showSnackSuccess(
        msg: 'Save comment success with id: ${comment.commentId}',
      );
    } catch (e) {
      showSnackError(msg: e.toString());
      return false;
    } finally {
      emit(state.copyWith(loading: false));
    }

    return true;
  }

  Future<bool> updateComment({
    required String commentValue,
    required QuestionComment comment,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      await cmoDatabaseMasterService.cacheQuestionComment(comment.copyWith(comment: commentValue));
      await getListQuestionComment();
      showSnackSuccess(
        msg: 'Update comment success with id: ${comment.commentId}',
      );
    } catch (e) {
      showSnackError(msg: e.toString());
      return false;
    } finally {
      emit(state.copyWith(loading: false));
    }

    return true;
  }

  Future<void> removeComment({
    required QuestionComment comment,
  }) async {
    await cmoDatabaseMasterService.removeQuestionComment(comment);
    await getListQuestionComment();
  }

  void handleError(Object error) {
    logger.d(error);
  }
}
