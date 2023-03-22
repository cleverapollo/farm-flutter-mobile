// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'pdca.freezed.dart';
part 'pdca.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Pdca with _$Pdca {

  const factory Pdca({
    @JsonKey(name: 'PDCAId') required int  pdcaId,
    @JsonKey(name: 'PDCAName') String? pdcaName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Pdca;

  factory Pdca.fromJson(Map<String, dynamic> json) => _$PdcaFromJson(json);
    const Pdca._();

  @override
  Id get id => pdcaId;
}
