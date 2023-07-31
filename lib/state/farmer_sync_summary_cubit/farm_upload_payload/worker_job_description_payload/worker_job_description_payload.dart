import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_job_description_payload.freezed.dart';
part 'worker_job_description_payload.g.dart';

@freezed
class WorkerJobDescriptionPayLoad with _$WorkerJobDescriptionPayLoad {
  const factory WorkerJobDescriptionPayLoad({
    int? WorkerId,
    int? WorkerJobDescriptionId,
    int? JobDescriptionId,
    String? JobDescriptionName,
    DateTime? CreateDT,
    DateTime? UpdateDT,
    bool? IsActive,
  }) = _WorkerJobDescriptionPayLoad;

  factory WorkerJobDescriptionPayLoad.fromJson(Map<String, dynamic> json) =>
      _$WorkerJobDescriptionPayLoadFromJson(json);
}
