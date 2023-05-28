import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'disciplonaries.freezed.dart';
part 'disciplonaries.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Disciplinaries with _$Disciplinaries {
  const factory Disciplinaries({
    @JsonKey(name: 'FarmId') String? farmId,
  }) = _Disciplinaries;

  const Disciplinaries._();

  factory Disciplinaries.fromJson(Map<String, dynamic> json) =>
      _$DisciplinariesFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
