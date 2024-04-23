import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'action_raised_by_user.freezed.dart';
part 'action_raised_by_user.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ActionRaisedByUser with _$ActionRaisedByUser {
  const factory ActionRaisedByUser({
    @JsonKey(name: 'UserId') int? userId,
    @JsonKey(name: 'UserName') String? userName,
    @JsonKey(name: 'UserEmail') String? userEmail,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'LastName') String? lastName,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'ProfileImage') String? profileImage,
  }) = _ActionRaisedByUser;

  const ActionRaisedByUser._();

  factory ActionRaisedByUser.fromJson(Map<String, dynamic> json) => _$ActionRaisedByUserFromJson(json);

  Id get id => userId ?? Isar.autoIncrement;
}

extension ActionRaisedByUserExtension on ActionRaisedByUser {
  String get fullName {
    return '${firstName ?? ''} ${lastName ?? ''}';
  }
}