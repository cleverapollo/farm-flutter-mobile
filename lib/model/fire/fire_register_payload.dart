import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fire_register_payload.freezed.dart';

part 'fire_register_payload.g.dart';

@freezed
class FireRegisterPayload with _$FireRegisterPayload {
  const factory FireRegisterPayload({
    @JsonKey(name: 'Register') FireRegister? register,
    @JsonKey(name: 'Photos') List<FireRegisterPhoto>? photos,
  }) = _FireRegisterPayload;

  factory FireRegisterPayload.fromJson(Map<String, dynamic> json) =>
      _$FireRegisterPayloadFromJson(json);
}
