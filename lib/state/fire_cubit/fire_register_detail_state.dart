part of 'fire_register_detail_cubit.dart';

class FireRegisterDetailState extends BaseState {
  const FireRegisterDetailState({
    super.loading,
    super.isEditing,
    this.fireRegister,
    this.activeFarm,
    this.fireCauseSelect,
    this.fireCauses = const <FireCause>[],
    this.firePhotos = const <FireRegisterPhoto>[],
    this.removedFirePhotos = const <FireRegisterPhoto>[],
  });

  final FireRegister? fireRegister;
  final List<FireCause> fireCauses;
  final FireCause? fireCauseSelect;
  final Farm? activeFarm;
  final List<FireRegisterPhoto> firePhotos;
  final List<FireRegisterPhoto> removedFirePhotos;

  FireRegisterDetailState copyWith({
    bool? loading,
    bool? isEditing,
    FireRegister? fireRegister,
    List<FireCause>? fireCauses,
    FireCause? fireCauseSelect,
    Farm? activeFarm,
    List<FireRegisterPhoto>? firePhotos,
    List<FireRegisterPhoto>? removedFirePhotos,
  }) {
    return FireRegisterDetailState(
      loading: loading ?? this.loading,
      isEditing: isEditing ?? this.isEditing,
      fireRegister: fireRegister ?? this.fireRegister,
      activeFarm: activeFarm ?? this.activeFarm,
      fireCauses: fireCauses ?? this.fireCauses,
      fireCauseSelect: fireCauseSelect ?? this.fireCauseSelect,
      firePhotos: firePhotos ?? this.firePhotos,
      removedFirePhotos: removedFirePhotos ?? this.removedFirePhotos,
    );
  }
}
