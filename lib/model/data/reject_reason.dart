// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'reject_reason.freezed.dart';

part 'reject_reason.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RejectReason with _$RejectReason {
  const factory RejectReason({
    @JsonKey(name: 'RejectReasonId') required int rejectReasonId,
    @JsonKey(name: 'RejectReasonName') String? rejectReasonName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _RejectReason;

  factory RejectReason.fromJson(Map<String, dynamic> json) =>
      _$RejectReasonFromJson(json);

  const RejectReason._();

  @override
  Id get id => rejectReasonId;
}
