import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'training_type.freezed.dart';
part 'training_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class TrainingType with _$TrainingType {
  const factory TrainingType({
    @JsonKey(name: 'TrainingTypeId') int? trainingTypeId,
    @JsonKey(name: 'TrainingTypeName') String? trainingTypeName,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _TrainingType;

  const TrainingType._();

  factory TrainingType.fromJson(Map<String, dynamic> json) =>
      _$TrainingTypeFromJson(json);

  @override
  Id get id => trainingTypeId ?? Isar.autoIncrement;
}
