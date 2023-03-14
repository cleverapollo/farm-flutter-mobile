import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_category.freezed.dart';
part 'job_category.g.dart';

@freezed
class JobCategory with _$JobCategory {
  const factory JobCategory({
    @JsonKey(name: 'JobCategoryId') int? jobCategoryId,
    @JsonKey(name: 'JobCategoryName') String? jobCategoryName,
    @JsonKey(name: 'UnitId') int? unitId,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _JobCategory;

  factory JobCategory.fromJson(Map<String, dynamic> json) => _$JobCategoryFromJson(json);
}
