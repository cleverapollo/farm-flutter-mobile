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
    @JsonKey(name: 'IsActive') int? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _CustomaryUseRight;

  const CustomaryUseRight._();

  factory CustomaryUseRight.fromJson(Map<String, dynamic> json) =>
      _$CustomaryUseRightFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
