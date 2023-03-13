// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'package:cmo/extensions/string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @JsonKey(name: 'UserId') int? userId,
    @JsonKey(name: 'UserName') String? userName,
    @JsonKey(name: 'UserEmail') String? userEmail,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'LastName') String? lastName,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'ProfileImage') String? profileImage,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsReceiveUpdate') bool? isReceiveUpdate,
    @JsonKey(name: 'IsReceiveWelcome') bool? isReceiveWelcome,
    @JsonKey(name: 'SecurityProviderId') String? securityProviderId,
    @JsonKey(name: 'ListRoles') List<String>? listRoles,
    @JsonKey(name: 'Roles') List<String>? roles,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}

extension UserInfoX on UserInfo {
  String get fullName {
    if (firstName.isBlank && lastName.isBlank) {
      return userName ?? '';
    }

    return '${firstName ?? ''} ${lastName ?? ''}'.trim();
  }
}
