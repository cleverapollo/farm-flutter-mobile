import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'job_element.freezed.dart';
part 'job_element.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class JobElement with _$JobElement {
    const JobElement._();

  @override
  Id get id => jobElementId;

  const factory JobElement({
    @JsonKey(name: 'JobElementId') required int jobElementId,
    @JsonKey(name: 'JobElementName') String? jobElementName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _JobElement;

  factory JobElement.fromJson(Map<String, dynamic> json) => _$JobElementFromJson(json);
}
