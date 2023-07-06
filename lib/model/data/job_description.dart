// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'job_description.freezed.dart';
part 'job_description.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class JobDescription with _$JobDescription {
  const factory JobDescription({
    @JsonKey(name: 'JobDescriptionId') int? jobDescriptionId,
    @JsonKey(name: 'JobDescriptionName') String? jobDescriptionName,
    @JsonKey(name: 'IsAssignedToWorker') bool? isAssignedToWorker,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _JobDescription;

  const JobDescription._();

  factory JobDescription.fromJson(Map<String, dynamic> json) => _$JobDescriptionFromJson(json);

  @override
  Id get id => jobDescriptionId ?? DateTime.now().millisecondsSinceEpoch;
}
