import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_element.freezed.dart';
part 'job_element.g.dart';

@freezed
class JobElement with _$JobElement {
  const factory JobElement({
    @JsonKey(name: 'JobElementId') int? jobElementId,
    @JsonKey(name: 'JobElementName') String? jobElementName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _JobElement;

  factory JobElement.fromJson(Map<String, dynamic> json) => _$JobElementFromJson(json);
}
