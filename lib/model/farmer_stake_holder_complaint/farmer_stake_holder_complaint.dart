import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farmer_stake_holder_complaint.freezed.dart';

part 'farmer_stake_holder_complaint.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmerStakeHolderComplaint with _$FarmerStakeHolderComplaint {
  const factory FarmerStakeHolderComplaint({
    @JsonKey(name: 'FarmerStakeHolderComplaintId') int? farmerStakeHolderComplaintId,
    @JsonKey(name: 'ComplaintId') int? complaintId,
    @JsonKey(name: 'ComplaintName') String? complaintName,
    @JsonKey(name: 'IssueRaised') String? issueRaised,
    @JsonKey(name: 'ClosureDetails') String? closureDetails,
    @JsonKey(name: 'GeneralComments') String? generalComments,
    @JsonKey(name: 'DateReceived') String? dateReceived,
    @JsonKey(name: 'DateClosed') String? dateClosed,
    @Default(false) @JsonKey(name: 'CarRaised') bool? carRaised,
    @Default(false) @JsonKey(name: 'CarClosed') bool? carClosed,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _FarmerStakeHolderComplaint;

  const FarmerStakeHolderComplaint._();

  factory FarmerStakeHolderComplaint.fromJson(Map<String, dynamic> json) => _$FarmerStakeHolderComplaintFromJson(json);

  @override
  Id get id => complaintId ?? Isar.autoIncrement;
}
