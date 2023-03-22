import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'severity.freezed.dart';
part 'severity.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Severity with _$Severity {

  const factory Severity({
    @JsonKey(name: 'SeverityId') required int  severityId,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Severity;

  factory Severity.fromJson(Map<String, dynamic> json) => _$SeverityFromJson(json);
    const Severity._();

  @override
  Id get id => severityId;
}
