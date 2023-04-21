import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit.freezed.dart';
part 'audit.g.dart';

// status = 1 -> Incomplete;
// status = 2 -> Completed;
// status = 3 -> Synced;
enum AuditStatus {
  unknown(0),
  incomplete(1),
  completed(2),
  synced(3),
  ;

  const AuditStatus(
      this.data,
      );

  final int data;
}

@freezed
@Collection(ignore: {'copyWith'})
class Audit with _$Audit {
  const factory Audit({
    @JsonKey(name: 'AuditId') required int? auditId,
    @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
    @JsonKey(name: 'AuditTemplateId') int? auditTemplateId,
    @JsonKey(name: 'CompartmentName') String? compartmentName,
    @JsonKey(name: 'CompartmentId') int? compartmentId,
    @JsonKey(name: 'SiteName') String? siteName,
    @JsonKey(name: 'SiteId') int? siteId,
    @JsonKey(name: 'Completed') bool? completed,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @Default(1)
    @JsonKey(name: 'Status') int? status,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true)
    @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _Audit;

  const Audit._();

  factory Audit.fromJson(Map<String, dynamic> json) =>
      _$AuditFromJson(json);

  @override
  Id get id => auditId ?? Isar.autoIncrement;
}

extension AuditExtensions on Audit {
  AuditStatus get statusEnum {
    switch (this.status) {
      case 0:
        return AuditStatus.unknown;
      case 1:
        return AuditStatus.incomplete;
      case 2:
        return AuditStatus.completed;
      case 3:
        return AuditStatus.synced;
      default:
        return AuditStatus.unknown;
    }
  }

  int status(AuditStatus type) {
    switch (type) {
      case AuditStatus.unknown:
        return 0;
      case AuditStatus.incomplete:
        return 1;
      case AuditStatus.completed:
        return 2;
      case AuditStatus.synced:
        return 3;
    }
  }
}
