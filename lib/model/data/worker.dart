// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:cmo/model/worker_pay_load/worker_pay_load.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'worker.freezed.dart';
part 'worker.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Worker with _$Worker {
  const factory Worker({
    @JsonKey(name: 'WorkerId') required String workerId,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'Surname') String? surname,
    @JsonKey(name: 'IdNumber') String? idNumber,
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'ContractorId') int? contractorId,
    @JsonKey(name: 'Idint') String? idint,
    @JsonKey(name: 'JobDescriptionId') int? jobDescriptionId,
    @JsonKey(name: 'DOB') String? dob,
    @JsonKey(name: 'ContactNumber') String? contactNumber,
    @JsonKey(name: 'Phoneint') String? phoneint,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'MunicipalityId') int? municipalityId,
    @JsonKey(name: 'ProvinceId') int? provinceId,
    @JsonKey(name: 'Gender') String? gender,
    @JsonKey(name: 'Image') String? image,
    @JsonKey(name: 'Notes') String? notes,
    @JsonKey(name: 'RaceId') int? raceId,
    @JsonKey(name: 'GenderId') int? genderId,
    @JsonKey(name: 'DisabilityId') int? disabilityId,
    @JsonKey(name: 'Driverint') String? driverint,
    @JsonKey(name: 'DriverExpiryDT') String? driverExpiryDt,
    @JsonKey(name: 'Pdpint') String? pdpint,
    @JsonKey(name: 'PdpExpiryDT') String? pdpExpiryDt,
    @JsonKey(name: 'CreateDT') String? createDt,
    @JsonKey(name: 'UpStringDT') String? upStringDt,
    @JsonKey(name: 'IsLocal') bool? isLocal,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'FarmId') String? farmId,
  }) = _Worker;

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);
  const Worker._();

  @override
  Id get id => int.tryParse(workerId) ?? Isar.autoIncrement;
}

extension WorkerExtension on Worker {
  WorkerPayLoad toPayLoad() {
    return WorkerPayLoad(
      WorkerId: workerId,
      FirstName: firstName,
      Surname: surname,
      IdNumber: idNumber,
      CompanyId: companyId,
      ContractorId: contractorId,
      Idint: idint,
      JobDescriptionId: jobDescriptionId,
      Dob: dob,
      ContactNumber: contactNumber,
      Phoneint: phoneint,
      Email: email,
      MunicipalityId: municipalityId,
      ProvinceId: provinceId,
      Gender: gender,
      Image: image,
      Notes: notes,
      RaceId: raceId,
      GenderId: genderId,
      DisabilityId: disabilityId,
      Driverint: driverint,
      DriverExpiryDt: driverExpiryDt,
      Pdpint: pdpint,
      PdpExpiryDt: pdpExpiryDt,
      CreateDt: createDt,
      UpStringDt: upStringDt,
      IsLocal: isLocal,
      IsActive: isActive,
      FarmId: farmId,
    );
  }
}
