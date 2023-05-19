// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farmer_worker.freezed.dart';

part 'farmer_worker.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmerWorker with _$FarmerWorker {
  const factory FarmerWorker({
    @JsonKey(name: 'WorkerId') required String workerId,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'Surname') String? surname,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'IdNumber') String? idNumber,
    @JsonKey(name: 'GenderId') int? genderId,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'CreateDT') String? createDt,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @JsonKey(name: 'IsLocal') bool? isLocal,
    @JsonKey(name: 'CanDelete') int? canDelete,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @JsonKey(name: 'NormalisedPhotoURL') String? normalisedPhotoURL,
    @JsonKey(name: 'Photo') String? photo,
    // @JsonKey(name: 'JobDescriptions') List<JobDescription>? jobDescriptions,
  }) = _FarmerWorker;

  factory FarmerWorker.fromJson(Map<String, dynamic> json) =>
      _$FarmerWorkerFromJson(json);

  const FarmerWorker._();

  @override
  Id get id => int.tryParse(workerId) ?? Isar.autoIncrement;
}
