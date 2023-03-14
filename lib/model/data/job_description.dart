import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_description.freezed.dart';
part 'job_description.g.dart';

@freezed
class JobDescription with _$JobDescription {
  const factory JobDescription({
    @JsonKey(name: 'JobDescriptionId') int? jobDescriptionId,
    @JsonKey(name: 'JobDescriptionName') String? jobDescriptionName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _JobDescription;

  factory JobDescription.fromJson(Map<String, dynamic> json) => _$JobDescriptionFromJson(json);
}
