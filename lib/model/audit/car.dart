import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'car.freezed.dart';

part 'car.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Car with _$Car {
  const factory Car({
    @JsonKey(name: 'CarId') required int carId,
    @JsonKey(name: 'CarName') String? carName,
    @JsonKey(name: 'CarDescription') String? carDescription,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  const Car._();

  @override
  Id get id => carId;
}
