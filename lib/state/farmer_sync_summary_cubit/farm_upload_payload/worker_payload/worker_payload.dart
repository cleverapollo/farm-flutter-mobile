import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/worker_job_description_payload/worker_job_description_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_payload.freezed.dart';
part 'worker_payload.g.dart';

@freezed
class FarmWorkerPayload with _$FarmWorkerPayload {
  const factory FarmWorkerPayload({
    String? WorkerId,
    String? FirstName,
    String? Surname,
    String? FarmId,
    String? IdNumber,
    num? GenderId,
    String? PhoneNumber,
    DateTime? CreateDT,
    DateTime? UpdateDT,
    num? IsLocal,
    num? CanDelete,
    num? IsActive,
    String? PhotoURL,
    String? NormalisedPhotoURL,
    String? Photo,
    List<WorkerJobDescriptionPayLoad>? JobDescriptions,
  }) = _FarmWorkerPayload;
  factory FarmWorkerPayload.fromJson(Map<String, dynamic> json) =>
      _$FarmWorkerPayloadFromJson(json);
}
