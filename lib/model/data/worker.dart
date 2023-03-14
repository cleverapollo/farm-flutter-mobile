import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker.freezed.dart';
part 'worker.g.dart';

@freezed
class Worker with _$Worker {
  const factory Worker({
    @JsonKey(name: 'WorkerId') String? workerId,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'Surname') String? surname,
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'ContractorId') int? contractorId,
    @JsonKey(name: 'Idint') String? idint,
    @JsonKey(name: 'JobDescriptionId') int? jobDescriptionId,
    @JsonKey(name: 'DOB') String? dob,
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
  }) = _Worker;

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);
}
