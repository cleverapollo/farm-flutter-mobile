import 'package:cmo/extensions/bool_estension.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/worker_payload/worker_payload.dart';
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
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @JsonKey(name: 'IsLocal') int? isLocal,
    @JsonKey(name: 'CanDelete') int? canDelete,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _FarmerWorker;

  const FarmerWorker._();

  factory FarmerWorker.fromJson(Map<String, dynamic> json) =>
      _$FarmerWorkerFromJson(json);

  @override
  Id get id => int.tryParse(workerId ?? '') ?? Isar.autoIncrement;
}

extension FarmerWorkerX on FarmerWorker {
  FarmWorkerPayload toPayLoad() {
    return FarmWorkerPayload(
      FirstName: firstName,
      WorkerId: workerId,
      Surname: surname,
      FarmId: farmId,
      IdNumber: idNumber,
      GenderId: genderId ?? 0,
      PhoneNumber: phoneNumber,
      CreateDT: DateTime.tryParse(createDT ?? ''),
      UpdateDT: DateTime.tryParse(updateDT ?? ''),
      IsLocal: isLocal,
      CanDelete: canDelete,
      IsActive: isActive.toInt,
      PhotoURL: photoURL,
      NormalisedPhotoURL: normalisedPhotoURL,
      Photo: photo,
    );
  }
}
