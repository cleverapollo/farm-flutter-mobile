import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'speqs.freezed.dart';
part 'speqs.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Speqs with _$Speqs {

  const factory Speqs({
    @JsonKey(name: 'SPEQSId') required int  speqsId,
    @JsonKey(name: 'SPEQSName') String? speqsName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Speqs;

  factory Speqs.fromJson(Map<String, dynamic> json) => _$SpeqsFromJson(json);
    const Speqs._();

  @override
  Id get id => speqsId;
}
