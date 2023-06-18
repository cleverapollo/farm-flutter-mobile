import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_pay_load.freezed.dart';
part 'worker_pay_load.g.dart';

@freezed
class WorkerPayLoad with _$WorkerPayLoad {
  const factory WorkerPayLoad({
    required String WorkerId,
    String? FirstName,
    String? Surname,
    String? IdNumber,
    int? CompanyId,
    int? ContractorId,
    String? Idint,
    int? JobDescriptionId,
    String? Dob,
    String? ContactNumber,
    String? Phoneint,
    String? Email,
    int? MunicipalityId,
    int? ProvinceId,
    String? Gender,
    String? Image,
    String? Notes,
    int? RaceId,
    int? GenderId,
    int? DisabilityId,
    String? Driverint,
    String? DriverExpiryDt,
    String? Pdpint,
    String? PdpExpiryDt,
    String? CreateDt,
    String? UpStringDt,
    bool? IsLocal,
    bool? IsActive,
    String? FarmId,
  }) = _WorkerPayLoad;

  factory WorkerPayLoad.fromJson(Map<String, dynamic> json) =>
      _$WorkerPayLoadFromJson(json);
}
