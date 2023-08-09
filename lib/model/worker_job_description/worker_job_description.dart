import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/worker_job_description_payload/worker_job_description_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'worker_job_description.freezed.dart';
part 'worker_job_description.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class WorkerJobDescription with _$WorkerJobDescription {
  const factory WorkerJobDescription({
    @JsonKey(name: "WorkerId") String? workerId,
    @JsonKey(name: "WorkerJobDescriptionId") int? workerJobDescriptionId,
    @JsonKey(name: "JobDescriptionId") int? jobDescriptionId,
    @JsonKey(name: "JobDescriptionName") String? jobDescriptionName,
    @JsonKey(name: "CreateDT") DateTime? createDT,
    @JsonKey(name: "UpdateDT") DateTime? updateDT,
    @JsonKey(name: "IsActive") bool? isActive,
  }) = _WorkerJobDescription;

  const WorkerJobDescription._();

  factory WorkerJobDescription.fromJson(Map<String, dynamic> json) =>
      _$WorkerJobDescriptionFromJson(json);

  @override
  Id get id => workerJobDescriptionId ?? Isar.autoIncrement;
}

extension WorkerJobDescriptionX on WorkerJobDescription {
  WorkerJobDescriptionPayLoad toPayLoad() {
    return WorkerJobDescriptionPayLoad(
      WorkerId: int.tryParse(workerId ?? ''),
      WorkerJobDescriptionId: workerJobDescriptionId,
      JobDescriptionId: jobDescriptionId,
      JobDescriptionName: jobDescriptionName,
      CreateDT: createDT,
      UpdateDT: updateDT,
      IsActive: isActive,
    );
  }
}
