import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farmer_worker.freezed.dart';

part 'farmer_worker.g.dart';

// Gender
// Gender == 0: Male
// Gender == 1: Female

@freezed
@Collection(ignore: {'copyWith'})
class FarmerWorker with _$FarmerWorker {
  const factory FarmerWorker({
    @JsonKey(name: 'WorkerId') int? workerId,
    @JsonKey(name: 'FarmId') int? farmId,
    @JsonKey(name: 'JobTitle') String? jobTitle,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'LastName') String? lastName,
    @JsonKey(name: 'DateOfBirth') String? dateOfBirth,
    @JsonKey(name: 'IdNumber') int? idNumber,
    @Default(<int>[])
    @JsonKey(name: 'JobDescription') List<int>? jobDescription,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'Nationality') String? nationality,
    @JsonKey(name: 'Gender') int? gender,
    @JsonKey(name: 'CanDelete') int? canDelete,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'NormalisedPhotoURL') String? normalisedPhotoURL,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @JsonKey(name: 'AvatarFileName') String? avatarFileName,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _FarmerWorker;

  const FarmerWorker._();

  factory FarmerWorker.fromJson(Map<String, dynamic> json) => _$FarmerWorkerFromJson(json);

  @override
  Id get id => workerId ?? Isar.autoIncrement;
}
