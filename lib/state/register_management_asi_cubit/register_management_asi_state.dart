import 'package:cmo/model/asi.dart';
import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_management_asi_state.freezed.dart';

@freezed
class RMAsiState with _$RMAsiState {
  const factory RMAsiState({
    @Default(false) bool isLoading,
    @Default(false) bool isDataReady,
    @Default(true) bool isOpen,
    @Default(Asi()) Asi asiData,
    @Default(Asi()) Asi asiDataBeforeEdit,
    @Default([]) List<AsiType> asiTypes,
    @Default([]) List<Compartment> asiCompartments,
    @Default([]) List<Asi> asisData,
    @Default([]) List<AsiPhoto> asiPhotos,
    AsiType? selectAsiType,
    Compartment? selectAsiCompartment,
    String? farmId,
    String? farmName,
    int? groupSchemeId,
    @Default(false) bool carRaised,
    @Default(false) bool carClosed,
  }) = _RMAsiState;
}
