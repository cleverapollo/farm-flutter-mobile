import 'package:cmo/extensions/bool_estension.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/worker_job_description_payload/worker_job_description_payload.dart';
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
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @JsonKey(name: 'NormalisedPhotoURL') String? normalisedPhotoURL,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsLocal') int? isLocal,
    @JsonKey(name: 'CanDelete') int? canDelete,
    @JsonKey(name: 'IsActive') int? isActive,
    @JsonKey(name: 'DriverLicenseNumber') String? driverLicenseNumber,
    @ignore
    @JsonKey(name: 'JobDescriptions') List<WorkerJobDescriptionPayLoad>? jobDescriptions,
  }) = _FarmerWorker;

  const FarmerWorker._();

  factory FarmerWorker.fromJson(Map<String, dynamic> json) =>
      _$FarmerWorkerFromJson(json);

  @override
  Id get id => int.tryParse(workerId ?? '') ?? Isar.autoIncrement;
}

extension FarmerWorkerX on FarmerWorker {
  bool isUnder16() {
    final dob = DateTime.tryParse(dateOfBirth ?? '');
    if (dob == null) return true;
    final age = dob.age();
    return age < 16;
  }

  String get fullName {
    return '${firstName ?? ''} ${surname ?? ''}';
  }
}
