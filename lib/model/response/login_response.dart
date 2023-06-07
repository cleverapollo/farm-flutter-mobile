import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'userId') required int userId,
    @JsonKey(name: 'displayName') required String displayName,
    @JsonKey(name: 'accessToken') required String accessToken,
    @JsonKey(name: 'renewalToken') required String renewalToken,
  }) = _LoginResponse;

  const LoginResponse._();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
