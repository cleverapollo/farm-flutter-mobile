// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'job_element.freezed.dart';
part 'job_element.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class JobElement with _$JobElement {

  const factory JobElement({
    @JsonKey(name: 'JobElementId') required int jobElementId,
    @JsonKey(name: 'JobElementName') String? jobElementName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _JobElement;

  factory JobElement.fromJson(Map<String, dynamic> json) => _$JobElementFromJson(json);
    const JobElement._();

  @override
  Id get id => jobElementId;
}
