import 'package:freezed_annotation/freezed_annotation.dart';

part 'severity.freezed.dart';
part 'severity.g.dart';

@freezed
class Severity with _$Severity {
  const factory Severity({
    @JsonKey(name: 'SeverityId') int? severityId,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Severity;

  factory Severity.fromJson(Map<String, dynamic> json) => _$SeverityFromJson(json);
}
