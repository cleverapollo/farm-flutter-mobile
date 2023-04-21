import 'dart:ffi';

import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/data/audit_compliance.dart';
import 'package:cmo/model/data/audit_question_answer.dart';
import 'package:cmo/model/data/audit_question_comment.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'audit_question_photo_state.dart';

class AuditQuestionPhotoCubit extends Cubit<AuditQuestionPhotoState> {
  AuditQuestionPhotoCubit() : super(const AuditQuestionPhotoState());

  Future<void> initialize({
    required AuditQuestion auditQuestion,
  }) async {
    try {
      emit(state.copyWith(question: auditQuestion));
      await getListAuditQuestionPhotos();
    } catch (error) {
      handleError(error);
    }
  }

  Future<void> getListAuditQuestionPhotos() async {
    final auditQuestionPhoto = await cmoDatabaseMasterService.getAuditQuestionPhotos(
      auditId: state.question?.auditId,
      questionId: state.question?.questionId,
    );
    emit(state.copyWith(photos: auditQuestionPhoto));
  }

  Future<void> addPhoto({
    required int? questionId,
    required String photoPath,
    required String photoName,
  }) async {
    final photo = AuditQuestionPhoto(
      auditId: state.question?.auditId,
      questionId: questionId,
      photoPath: photoPath,
      photoName: photoName,
      photoId: DateTime.now().millisecondsSinceEpoch,
    );
    await cmoDatabaseMasterService.cacheAuditQuestionPhoto(photo);
    await getListAuditQuestionPhotos();
  }

  Future<void> replacePhoto({
    required AuditQuestionPhoto photo,
  }) async {
    await cmoDatabaseMasterService.cacheAuditQuestionPhoto(photo);
    await getListAuditQuestionPhotos();
  }

  void handleError(Object error) {
    logger.d(error);
  }
}
