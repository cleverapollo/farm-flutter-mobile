import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'gender.freezed.dart';
part 'gender.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Gender with _$Gender {
  const factory Gender({
    @JsonKey(name: 'GenderId') int? genderId,
    @JsonKey(name: 'GenderName') String? genderName,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive
  }) = _Gender;

  const Gender._();

  factory Gender.fromJson(Map<String, dynamic> json) =>
      _$GenderFromJson(json);

  @override
  Id get id => genderId ?? Isar.autoIncrement;
}