import 'package:freezed_annotation/freezed_annotation.dart';
part 'training_register_payload.freezed.dart';
part 'training_register_payload.g.dart';

@freezed
class TrainingRegisterPayLoad with _$TrainingRegisterPayLoad {
  const factory TrainingRegisterPayLoad({
    String? TrainingRegisterNo,
    String? FarmId,
    int? TrainingTypeId,
    DateTime? Date,
    String? TrainerName,
    String? WorkerId,
    String? TrainingRegisterId,
    DateTime? ExpiryDate,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    String? SignaturePoints,
    String? SignatureImage,
    DateTime? SignatureDate,
    bool? IsActive,
    bool? IsMasterdataSynced,
    String? WorkerName,
    String? TrainingTypeName,
  }) = _TrainingRegisterPayLoad;
  factory TrainingRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$TrainingRegisterPayLoadFromJson(json);
}
