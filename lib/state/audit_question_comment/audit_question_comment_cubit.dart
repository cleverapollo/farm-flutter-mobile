import 'package:cmo/di.dart';
import 'package:cmo/model/data/audit_question_comment.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'audit_question_comment_state.dart';

class AuditQuestionCommentCubit extends Cubit<AuditQuestionCommentState> {
  AuditQuestionCommentCubit() : super(const AuditQuestionCommentState());

  Future<void> initialize({
    required FarmQuestion auditQuestion,
  }) async {
    try {
      emit(state.copyWith(question: auditQuestion));
      final rejectReasons = await cmoDatabaseMasterService.getRejectReasons();
      emit(state.copyWith(rejectReasons: rejectReasons));

      await getListAuditQuestionComment();
    } catch (error) {
      handleError(error);
    }
  }

  Future<void> getListAuditQuestionComment() async {
    // final questionComment = await cmoDatabaseMasterService.getAuditQuestionComments(
    //   auditId: state.question?.auditId,
    //   questionId: state.question?.questionId,
    // );
    //
    // if (questionComment.isEmpty) {
    //   questionComment.add(
    //     AuditQuestionComment(
    //       questionId: state.question?.questionId,
    //       auditId: state.question?.auditId,
    //       answerId: DateTime.now().millisecondsSinceEpoch,
    //       commentId: DateTime.now().millisecondsSinceEpoch,
    //       createDT: DateTime.now().toString(),
    //     ),
    //   );
    // }
    //
    // emit(state.copyWith(questionComment: questionComment.first));
  }

  Future<bool> addComment({
    required int rejectId,
    required int? questionId,
    required String commentValue,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      var comment = state.questionComment;
      if (comment == null) return false;

      comment = comment.copyWith(
        comment: commentValue,
        rejectId: rejectId,
      );

      await cmoDatabaseMasterService.cacheAuditQuestionComment(comment);
      showSnackSuccess(msg: 'Save comment success with id: ${comment.commentId}');
    } catch (e) {
      showSnackError(msg: e.toString());
      return false;
    } finally {
      emit(state.copyWith(loading: false));
    }

    return true;
  }

  void handleError(Object error) {
    logger.d(error);
  }
}
