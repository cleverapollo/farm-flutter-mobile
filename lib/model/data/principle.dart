import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'principle.freezed.dart';

part 'principle.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Principle with _$Principle {
  const factory Principle({
    @JsonKey(name: 'PrincipleId') required int principleId,
    @JsonKey(name: 'PrincipleName') String? principleName,
    @JsonKey(name: 'PrincipleDescription') String? principleDescription,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Principle;

  factory Principle.fromJson(Map<String, dynamic> json) =>
      _$PrincipleFromJson(json);

  const Principle._();

  @override
  Id get id => principleId;
}
