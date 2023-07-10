import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/asi_register_payload/asi_register_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/asi_register_photo_payload/asi_register_photo_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_asi_register_payload.freezed.dart';
part 'main_asi_register_payload.g.dart';

@freezed
class MainAsiRegisterPayLoad with _$MainAsiRegisterPayLoad {
  const factory MainAsiRegisterPayLoad({
    AsiRegisterPayLoad? Register,
    List<AsiRegisterPhotoPayLoad>? Photos,
  }) = _MainAsiRegisterPayLoad;
  factory MainAsiRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$MainAsiRegisterPayLoadFromJson(json);
}
