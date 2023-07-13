import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_description_payload.freezed.dart';
part 'job_description_payload.g.dart';

@freezed
class JobDescriptionPayLoad with _$JobDescriptionPayLoad {
  const factory JobDescriptionPayLoad({
    num? JobDescriptionId,
    String? JobDescriptionName,
    bool? IsAssignedToWorker,
    num? IsActive,
  }) = _JobDescriptionPayLoad;
  factory JobDescriptionPayLoad.fromJson(Map<String, dynamic> json) =>
      _$JobDescriptionPayLoadFromJson(json);
}
