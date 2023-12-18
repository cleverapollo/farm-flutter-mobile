import 'package:freezed_annotation/freezed_annotation.dart';

part 'force_update_model.g.dart';
part 'force_update_model.freezed.dart';

@freezed
class ForceUpdateModel with _$ForceUpdateModel {
  const factory ForceUpdateModel({
    required bool forceUpdate,
    required bool shouldUpdate,
  }) = _ForceUpdateModel;

  factory ForceUpdateModel.fromJson(Map<String, dynamic> json) => _$ForceUpdateModelFromJson(json);
}