import 'package:freezed_annotation/freezed_annotation.dart';

part 'reject_reason.freezed.dart';
part 'reject_reason.g.dart';

@freezed
class RejectReason with _$RejectReason {
  const factory RejectReason({
    @JsonKey(name: 'RejectReasonId') int? rejectReasonId,
    @JsonKey(name: 'RejectReasonName') String? rejectReasonName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _RejectReason;

  factory RejectReason.fromJson(Map<String, dynamic> json) => _$RejectReasonFromJson(json);
}
