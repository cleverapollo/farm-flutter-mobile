part of 'fire_register_detail_cubit.dart';

class FireRegisterDetailState {
  const FireRegisterDetailState({
    this.loading = false,
    this.fireRegister,
    this.activeFarm,
    this.fireCauseSelect,
    this.fireCauses = const <FireCause>[],
    this.firePhotos = const <FireRegisterPhoto>[],
    this.removedFirePhotos = const <FireRegisterPhoto>[],
  });

  final bool loading;
  final FireRegister? fireRegister;
  final List<FireCause> fireCauses;
  final FireCause? fireCauseSelect;
  final Farm? activeFarm;
  final List<FireRegisterPhoto> firePhotos;
  final List<FireRegisterPhoto> removedFirePhotos;

  FireRegisterDetailState copyWith({
    bool? loading,
    FireRegister? fireRegister,
    List<FireCause>? fireCauses,
    FireCause? fireCauseSelect,
    Farm? activeFarm,
    List<FireRegisterPhoto>? firePhotos,
    List<FireRegisterPhoto>? removedFirePhotos,
  }) {
    return FireRegisterDetailState(
      loading: loading ?? this.loading,
      fireRegister: fireRegister ?? this.fireRegister,
      activeFarm: activeFarm ?? this.activeFarm,
      fireCauses: fireCauses ?? this.fireCauses,
      fireCauseSelect: fireCauseSelect ?? this.fireCauseSelect,
      firePhotos: firePhotos ?? this.firePhotos,
      removedFirePhotos: removedFirePhotos ?? this.removedFirePhotos,
    );
  }
}
