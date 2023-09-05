import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/model/fire/fire_register.dart';
import 'package:cmo/model/fire_cause/fire_cause.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fire_state.freezed.dart';

@freezed
class FireState with _$FireState {
  const factory FireState({
    @Default(false) bool isLoading,
    @Default(FireRegister()) FireRegister fireRegister,
    @Default(FireRegister()) FireRegister fireRegisterBeforeEdit,
    @Default([]) List<FireCause> fireCauses,
    FireCause? fireCauseSelect,
    @Default([]) List<FireRegister> data,
    @Default([]) List<FireRegister> dataSearch,
    @Default(true) bool isOpen,
    @Default([]) List<AsiPhoto> asiPhotos,
  }) = _FireState;
}
