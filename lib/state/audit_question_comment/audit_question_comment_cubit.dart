import 'dart:ffi';
import 'dart:math';
import 'dart:ui';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
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
    QuestionAnswer? questionAnswer,
    QuestionComment? comment,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      final rejectReasons = await cmoDatabaseMasterService.getRejectReasons();
      final selectedRejectReason = rejectReasons.firstWhereOrNull(
        (element) => element.rejectReasonId == questionAnswer?.rejectReasonId,
      );

      emit(
        state.copyWith(
          question: question,
          rejectReasons: rejectReasons,
          selectedRejectReason: selectedRejectReason,
          isEditing: comment == null,
          questionComment: comment ??
              QuestionComment(
                questionId: question.questionId,
                commentId: generatorInt32Id(),
                assessmentId: auditId,
                comment: null,
              ),
        ),
      );
    } catch (error) {
      handleError(error);
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void updateComment(String? comment) {
    emit(
      state.copyWith(
        questionComment: state.questionComment?.copyWith(
          comment: comment,
        ),
      ),
    );
  }

  void setIsEditing({required bool isEditing}) {
    emit(state.copyWith(isEditing: isEditing));
  }

  void setSelectedRejectReason(RejectReason rejectReason) {
    if (rejectReason.rejectReasonId == -1) {
      emit(state.clearSelectedRejectReason());
    } else {
      emit(state.copyWith(selectedRejectReason: rejectReason));
    }
  }

  Future<bool> saveQuestionComment() async {
    try {
      emit(state.copyWith(loading: true));
      await cmoDatabaseMasterService.cacheQuestionComment(state.questionComment);
      showSnackSuccess(
        msg: 'Save comment success with id: ${state.questionComment?.commentId}',
      );
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
