import 'package:cmo/model/model.dart';
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
    @JsonKey(name: 'WorkerId') String? workerId,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'Surname') String? surname,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'IdNumber') String? idNumber,
    @JsonKey(name: 'GenderId') int? genderId,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'DateOfBirth') String? dateOfBirth,
    @JsonKey(name: 'Nationality') String? nationality,
    @Default(<int>[])
    @JsonKey(name: 'JobDescription') List<int>? jobDescription,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @JsonKey(name: 'NormalisedPhotoURL') String? normalisedPhotoURL,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @Default(1) @JsonKey(name: 'IsLocal') int? isLocal,
    @Default(1) @JsonKey(name: 'CanDelete') int? canDelete,
    @Default(1) @JsonKey(name: 'IsActive') int? isActive,
  }) = _FarmerWorker;

  const FarmerWorker._();

  factory FarmerWorker.fromJson(Map<String, dynamic> json) => _$FarmerWorkerFromJson(json);

  @override
  Id get id => int.tryParse(workerId ?? '') ?? Isar.autoIncrement;
}
