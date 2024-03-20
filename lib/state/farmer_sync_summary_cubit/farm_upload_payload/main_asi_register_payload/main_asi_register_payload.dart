import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_asi_register_payload.freezed.dart';
part 'main_asi_register_payload.g.dart';

@freezed
class MainAsiRegisterPayLoad with _$MainAsiRegisterPayLoad {
  const factory MainAsiRegisterPayLoad({
    @JsonKey(name: 'Register') Asi? asi,
    @JsonKey(name: 'Photos') List<AsiPhoto>? photos,
  }) = _MainAsiRegisterPayLoad;
  factory MainAsiRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$MainAsiRegisterPayLoadFromJson(json);
}
