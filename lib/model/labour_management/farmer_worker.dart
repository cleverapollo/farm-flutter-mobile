import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
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
    @JsonKey(name: 'SecondFirstName') String? secondFirstName,
    @JsonKey(name: 'SecondSurname') String? secondSurname,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'IdNumber') String? idNumber,
    @JsonKey(name: 'GenderId') int? genderId,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'DateOfBirth') DateTime? dateOfBirth,
    @JsonKey(name: 'Nationality') String? nationality,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @JsonKey(name: 'NormalisedPhotoURL') String? normalisedPhotoURL,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'CanDelete') int? canDelete,
    @JsonKey(name: 'DriverLicenceNumber') String? driverLicenseNumber,
    @JsonKey(name: 'IsForeigner') bool? isForeigner,
    @JsonKey(name: 'WorkPermitNumber') String? workPermitNumber,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true)
    @JsonKey(name: 'IsLocal') bool? isLocal,
    @ignore
    @JsonKey(name: 'JobDescriptions') List<WorkerJobDescription>? jobDescriptions,
  }) = _FarmerWorker;

  const FarmerWorker._();

  factory FarmerWorker.fromJson(Map<String, dynamic> json) =>
      _$FarmerWorkerFromJson(json);

  Id get id => int.tryParse(workerId ?? '') ?? Isar.autoIncrement;
}

extension FarmerWorkerX on FarmerWorker {
  bool isUnder16() {
    if (dateOfBirth == null) return true;
    final age = dateOfBirth.age();
    return age < 16;
  }

  String get fullName {
    return '${firstName ?? ''} ${surname ?? ''}';
  }
}
