import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/job_description_payload/job_description_payload.dart';
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
    int? GenderId,
    String? PhoneNumber,
    DateTime? CreateDT,
    DateTime? UpdateDT,
    int? IsLocal,
    int? CanDelete,
    int? IsActive,
    String? PhotoURL,
    String? NormalisedPhotoURL,
    String? Photo,
    List<JobDescriptionPayLoad>? JobDescriptions,
  }) = _FarmWorkerPayload;
  factory FarmWorkerPayload.fromJson(Map<String, dynamic> json) =>
      _$FarmWorkerPayloadFromJson(json);
}
