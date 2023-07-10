import 'package:freezed_annotation/freezed_annotation.dart';

part 'customary_use_right_payload.freezed.dart';
part 'customary_use_right_payload.g.dart';

@freezed
class CustomaryUseRightPayLoad with _$CustomaryUseRightPayLoad {
  const factory CustomaryUseRightPayLoad({
    String? CustomaryUseRightId,
    String? CustomaryUseRightName,
    int? IsActive,
    int? IsMasterDataSynced,
  }) = _CustomaryUseRightPayLoad;
  factory CustomaryUseRightPayLoad.fromJson(Map<String, dynamic> json) =>
      _$CustomaryUseRightPayLoadFromJson(json);
}
