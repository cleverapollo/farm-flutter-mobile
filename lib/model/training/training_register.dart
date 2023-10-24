import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/training_register_payload/training_register_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'training_register.freezed.dart';
part 'training_register.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class TrainingRegister with _$TrainingRegister {
  const factory TrainingRegister({
    @JsonKey(name: 'TrainingRegisterNo') String? trainingRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'TrainingTypeId') int? trainingTypeId,
    @JsonKey(name: 'Date') DateTime? date,
    @JsonKey(name: 'TrainerName') String? trainerName,
    @JsonKey(name: 'TrainingRegisterId') String? trainingRegisterId,
    @JsonKey(name: 'WorkerId') String? workerId,
    @JsonKey(name: 'ExpiryDate') DateTime? expiryDate,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'SignaturePoints') String? signaturePoints,
    @JsonKey(name: 'SignatureImage') String? signatureImage,
    @JsonKey(name: 'SignatureDate') DateTime? signatureDate,
    @JsonKey(name: 'WorkerName') String? workerName,
    @JsonKey(name: 'TrainingTypeName') String? trainingTypeName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _TrainingRegister;

  const TrainingRegister._();

  factory TrainingRegister.fromJson(Map<String, dynamic> json) =>
      _$TrainingRegisterFromJson(json);

  @override
  Id get id => int.tryParse(trainingRegisterNo ?? '') ?? Isar.autoIncrement;
}

extension TrainingRegisterX on TrainingRegister {
  TrainingRegisterPayLoad toPayLoad() {
    return TrainingRegisterPayLoad(
      TrainingRegisterNo: trainingRegisterNo,
      FarmId: farmId,
      TrainingTypeId: trainingTypeId,
      Date: date,
      TrainerName: trainerName,
      WorkerId: workerId,
      TrainingRegisterId: trainingRegisterId,
      ExpiryDate: expiryDate,
      Comment: comment,
      CarRaisedDate: carRaisedDate,
      CarClosedDate: carClosedDate,
      SignaturePoints: signaturePoints,
      SignatureImage: signatureImage,
      SignatureDate: signatureDate,
      IsActive: isActive,
      IsMasterdataSynced: isMasterdataSynced,
      WorkerName: workerName,
      TrainingTypeName: trainingTypeName,
      UpdateDT: updateDT,
      CreateDT: createDT,
    );
  }
}
