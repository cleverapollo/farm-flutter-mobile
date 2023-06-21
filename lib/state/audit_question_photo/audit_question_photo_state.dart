part of 'audit_question_photo_cubit.dart';

class AuditQuestionPhotoState extends Equatable {
  const AuditQuestionPhotoState({
    this.question,
    this.auditId,
    this.photos = const <QuestionPhoto>[],
    this.loading = false,
  });

  final FarmQuestion? question;
  final int? auditId;
  final List<QuestionPhoto> photos;
  final bool loading;

  AuditQuestionPhotoState copyWith({
    FarmQuestion? question,
    bool? loading,
    List<QuestionPhoto>? photos,
    int? auditId,
  }) {
    return AuditQuestionPhotoState(
      photos: photos ?? this.photos,
      question: question ?? this.question,
      loading: loading ?? this.loading,
      auditId: auditId ?? this.auditId,
    );
  }

  @override
  List<Object?> get props => [
        question,
        loading,
        photos,
        auditId,
      ];
}
