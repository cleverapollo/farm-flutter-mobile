import 'package:cmo/di.dart';
import 'package:cmo/model/data/question_photo.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'audit_question_photo_state.dart';

class AuditQuestionPhotoCubit extends Cubit<AuditQuestionPhotoState> {
  AuditQuestionPhotoCubit() : super(const AuditQuestionPhotoState());

  Future<void> initialize({
    required FarmQuestion auditQuestion,
    required int? auditId,
  }) async {
    try {
      emit(state.copyWith(
        question: auditQuestion,
        auditId: auditId,
      ));
      await getListQuestionPhotos();
    } catch (error) {
      handleError(error);
    }
  }

  Future<void> getListQuestionPhotos() async {
    final auditQuestionPhoto = await cmoDatabaseMasterService
        .getQuestionPhotosByAssessmentIdAndQuestionId(
      assessmentId: state.auditId,
      questionId: state.question?.questionId,
    );

    emit(state.copyWith(photos: auditQuestionPhoto));
  }

  Future<void> addPhoto({
    required String photoPath,
    required FarmQuestion auditQuestion,
  }) async {
    final photo = QuestionPhoto(
      photo: photoPath,
      assessmentId: state.auditId,
      questionId: auditQuestion.questionId,
      photoId: generatorInt32Id(),
    );

    await cmoDatabaseMasterService.cacheQuestionPhoto(photo);
    await getListQuestionPhotos();
  }

  Future<void> replacePhoto({
    required QuestionPhoto photo,
  }) async {
    await cmoDatabaseMasterService.cacheQuestionPhoto(photo);
    await getListQuestionPhotos();
  }

  Future<void> removePhoto({
    required QuestionPhoto photo,
  }) async {
    await cmoDatabaseMasterService.removeAuditQuestionPhoto(photo);
    await getListQuestionPhotos();
  }

  void handleError(Object error) {
    logger.d(error);
  }
}
