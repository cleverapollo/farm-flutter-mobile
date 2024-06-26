// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'mmm.freezed.dart';
part 'mmm.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Mmm with _$Mmm {

  const factory Mmm({
    @JsonKey(name: 'MMMId') required int mmmId,
    @JsonKey(name: 'MMMName') String? mmmName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Mmm;

  factory Mmm.fromJson(Map<String, dynamic> json) => _$MmmFromJson(json);
    const Mmm._();

  @override
  Id get id => mmmId;
}
