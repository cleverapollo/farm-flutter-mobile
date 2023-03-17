import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'job_description.freezed.dart';
part 'job_description.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class JobDescription with _$JobDescription {
    const JobDescription._();

  @override
  Id get id => jobDescriptionId;

  const factory JobDescription({
    @JsonKey(name: 'JobDescriptionId') required int jobDescriptionId,
    @JsonKey(name: 'JobDescriptionName') String? jobDescriptionName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _JobDescription;

  factory JobDescription.fromJson(Map<String, dynamic> json) => _$JobDescriptionFromJson(json);
}
