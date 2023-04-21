part of 'audit_question_photo_cubit.dart';

class AuditQuestionPhotoState extends Equatable {
  const AuditQuestionPhotoState({
    this.question,
    this.photos = const <AuditQuestionPhoto>[],
    this.loading = false,
  });

  final AuditQuestion? question;
  final List<AuditQuestionPhoto> photos;
  final bool loading;

  AuditQuestionPhotoState copyWith({
    AuditQuestion? question,
    bool? loading,
    List<AuditQuestionPhoto>? photos,
  }) {
    return AuditQuestionPhotoState(
      photos: photos ?? this.photos,
      question: question ?? this.question,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
        question,
        loading,
        photos,
      ];
}
