import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'province.freezed.dart';
part 'province.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Province with _$Province {
    const Province._();

  @override
  Id get id => provinceId;

  const factory Province({
    @JsonKey(name: 'ProvinceId') required int  provinceId,
    @JsonKey(name: 'ProvinceName') String? provinceName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Province;

  factory Province.fromJson(Map<String, dynamic> json) => _$ProvinceFromJson(json);
}
