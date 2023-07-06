import 'package:cmo/model/asi.dart';
import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_management_asi_state.freezed.dart';

@freezed
class RMAsiState with _$RMAsiState {
  const factory RMAsiState({
    @Default(Asi()) Asi asiData,
    @Default([]) List<AsiType> asiTypes,
    AsiType? selectAsiType,
    bool? isOpen,
    String? farmId,
    int? groupSchemeId,
    @Default(false) bool carRaised,
    @Default(false) bool carClosed,
  }) = _RMAsiState;
}
