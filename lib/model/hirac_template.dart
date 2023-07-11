import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'hirac_template.freezed.dart';

part 'hirac_template.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class HiracTemplate with _$HiracTemplate {
  const HiracTemplate._();

  @override
  Id get id => hiracTemplateId ?? 0;

  const factory HiracTemplate({
    @JsonKey(name: 'HiracTemplateId') int? hiracTemplateId,
    @JsonKey(name: 'HiracTemplateName') String? hiracTemplateName,
    @JsonKey(name: 'HiracTypeId') int? hiracTypeId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'UpdateDT') String? updateDt,
    @JsonKey(name: 'CreateDT') String? createDt,
  }) = _HiracTemplate;

  factory HiracTemplate.fromJson(Map<String, dynamic> json) =>
      _$HiracTemplateFromJson(json);
}
