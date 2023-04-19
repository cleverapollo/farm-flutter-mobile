import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'compartment.freezed.dart';
part 'compartment.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Compartment with _$Compartment {

  const factory Compartment({
    @JsonKey(name: 'CompartmentId') required int compartmentId,
    @JsonKey(name: 'CompartmentName') String? compartmentName,
    @Default(true)
    @JsonKey(name: 'IsActive') bool isActive,
  }) = _Compartment;

  factory Compartment.fromJson(Map<String, dynamic> json) => _$CompartmentFromJson(json);
  const Compartment._();

  @override
  Id get id => compartmentId;
}