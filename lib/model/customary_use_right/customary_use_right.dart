import 'package:cmo/extensions/bool_estension.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/customary_use_right_payload/customary_use_right_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'customary_use_right.freezed.dart';
part 'customary_use_right.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class CustomaryUseRight with _$CustomaryUseRight {
  const factory CustomaryUseRight({
    @JsonKey(name: 'CustomaryUseRightId') String? customaryUseRightId,
    @JsonKey(name: 'CustomaryUseRightName') String? customaryUseRightName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _CustomaryUseRight;

  const CustomaryUseRight._();

  factory CustomaryUseRight.fromJson(Map<String, dynamic> json) =>
      _$CustomaryUseRightFromJson(json);

  @override
  Id get id => int.tryParse(customaryUseRightId ?? '') ?? Isar.autoIncrement;
}

extension CustomaryUseRightX on CustomaryUseRight {
  CustomaryUseRightPayLoad toPayLoad() {
    return CustomaryUseRightPayLoad(
      CustomaryUseRightId: customaryUseRightId,
      CustomaryUseRightName: customaryUseRightName,
      IsActive: isActive.toInt,
      IsMasterDataSynced: isMasterDataSynced,
    );
  }
}
