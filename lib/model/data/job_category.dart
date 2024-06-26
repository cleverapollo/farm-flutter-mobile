// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'job_category.freezed.dart';
part 'job_category.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class JobCategory with _$JobCategory {

  const factory JobCategory({
    @JsonKey(name: 'JobCategoryId') required int jobCategoryId,
    @JsonKey(name: 'JobCategoryName') String? jobCategoryName,
    @JsonKey(name: 'UnitId') int? unitId,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _JobCategory;

  factory JobCategory.fromJson(Map<String, dynamic> json) => _$JobCategoryFromJson(json);
    const JobCategory._();

  @override
  Id get id => jobCategoryId;
}
