import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'criteria.freezed.dart';

part 'criteria.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Criteria with _$Criteria {
  const factory Criteria({
    @JsonKey(name: 'CriteriaId') required int criteriaId,
    @JsonKey(name: 'CriteriaName') String? criteriaName,
    @JsonKey(name: 'CriteriaDescription') String? criteriaDescription,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Criteria;

  factory Criteria.fromJson(Map<String, dynamic> json) =>
      _$CriteriaFromJson(json);

  const Criteria._();

  @override
  Id get id => criteriaId;
}
