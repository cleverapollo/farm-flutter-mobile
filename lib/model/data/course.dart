import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  const factory Course({
    @JsonKey(name: 'CourseId') int? courseId,
    @JsonKey(name: 'CourseName') String? courseName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
