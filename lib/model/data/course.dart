import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Course with _$Course {

  const factory Course({
    @JsonKey(name: 'CourseId') required int courseId,
    @JsonKey(name: 'CourseName') String? courseName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
    const Course._();

  @override
  
  Id get id => courseId;
}
