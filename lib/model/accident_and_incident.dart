import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'accident_and_incident.freezed.dart';

part 'accident_and_incident.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AccidentAndIncident with _$AccidentAndIncident {
  const factory AccidentAndIncident({
    @JsonKey(name: 'AccidentAndIncidentRegisterNo')
        String? accidentAndIncidentRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'WorkerId') int? workerId,
    @JsonKey(name: 'NatureOfInjuryId') int? natureOfInjuryId,
    @JsonKey(name: 'DateRecieved') DateTime? dateRecieved,
    @JsonKey(name: 'DateOfIncident') DateTime? dateOfIncident,
    @JsonKey(name: 'DateResumeWork') DateTime? dateResumeWork,
    @JsonKey(name: 'WorkerDisabled') bool? workerDisabled,
    @JsonKey(name: 'JobDescriptionId') int? jobDescriptionId,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') DateTime? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') DateTime? carClosedDate,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(includeFromJson: false, includeToJson: false) String? workerName,
    @JsonKey(includeFromJson: false, includeToJson: false) String? jobDescription,
    @JsonKey(includeFromJson: false, includeToJson: false) String? natureOfInjury,
  }) = _AccidentAndIncident;

  const AccidentAndIncident._();

  factory AccidentAndIncident.fromJson(Map<String, dynamic> json) =>
      _$AccidentAndIncidentFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
