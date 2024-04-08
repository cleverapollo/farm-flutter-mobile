import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'product_group_template.freezed.dart';
part 'product_group_template.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ProductGroupTemplate with _$ProductGroupTemplate {
  const factory ProductGroupTemplate({
    @JsonKey(name: 'AreaTypeId') String? areaTypeId,
    @JsonKey(name: 'Column1') String? column1,
    @JsonKey(name: 'Column2') String? column2,
    @JsonKey(name: 'Column3') String? column3,
    @JsonKey(name: 'Column4') String? column4,
    @JsonKey(name: 'Column5') String? column5,
    @JsonKey(name: 'Column6') String? column6,
    @JsonKey(name: 'Column7') String? column7,
    @JsonKey(name: 'Column8') String? column8,
    @JsonKey(name: 'Column9') String? column9,
    @JsonKey(name: 'Column10') String? column10,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'ProductGroupTemplateDescription')
        String? productGroupTemplateDescription,
    @JsonKey(name: 'ProductGroupTemplateId') String? productGroupTemplateId,
    @JsonKey(name: 'ProductGroupTemplateName') String? productGroupTemplateName,
    @JsonKey(name: 'ProductGroupTemplateProductMasterDatas')
        String? productGroupTemplateProductMasterDatas,
    @JsonKey(name: 'TotalRows') int? totalRows,
    @JsonKey(name: 'UpdateDT') String? updateDT,
  }) = _ProductGroupTemplate;

  const ProductGroupTemplate._();

  factory ProductGroupTemplate.fromJson(Map<String, dynamic> json) =>
      _$ProductGroupTemplateFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
