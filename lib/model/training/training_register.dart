import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'training_register.freezed.dart';
part 'training_register.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class TrainingRegister with _$TrainingRegister {
  const factory TrainingRegister({
    @JsonKey(name: 'TrainingRegisterNo') int? trainingRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'TrainingTypeId') int? trainingTypeId,
    @JsonKey(name: 'Date') DateTime? date,
    @JsonKey(name: 'TrainerName') String? trainerName,
    @JsonKey(name: 'TrainingRegisterId') bool? trainingRegisterId,
    @JsonKey(name: 'WorkerId') bool? workerId,
    @JsonKey(name: 'ExpiryDate') DateTime? expiryDate,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'SignaturePoints') String? signaturePoints,
    @JsonKey(name: 'SignatureImage') String? signatureImage,
    @JsonKey(name: 'SignatureDate') DateTime? signatureDate,
    @JsonKey(name: 'WorkerName') String? workerName,
    @JsonKey(name: 'TrainingTypeName') String? trainingTypeName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
  }) = _TrainingRegister;

  const TrainingRegister._();

  factory TrainingRegister.fromJson(Map<String, dynamic> json) =>
      _$TrainingRegisterFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
