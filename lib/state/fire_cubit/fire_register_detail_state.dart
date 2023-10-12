part of 'fire_register_detail_cubit.dart';

class FireRegisterDetailState {
  const FireRegisterDetailState({
    this.loading = false,
    this.fireRegister,
    this.activeFarm,
    this.fireCauseSelect,
    this.fireCauses = const <FireCause>[],
  });

  final bool loading;
  final FireRegister? fireRegister;
  final List<FireCause> fireCauses;
  final FireCause? fireCauseSelect;
  final Farm? activeFarm;

  FireRegisterDetailState copyWith({
    bool? loading,
    FireRegister? fireRegister,
    List<FireCause>? fireCauses,
    FireCause? fireCauseSelect,
    Farm? activeFarm,
  }) {
    return FireRegisterDetailState(
      loading: loading ?? this.loading,
      fireRegister: fireRegister ?? this.fireRegister,
      activeFarm: activeFarm ?? this.activeFarm,
      fireCauses: fireCauses ?? this.fireCauses,
      fireCauseSelect: fireCauseSelect ?? this.fireCauseSelect,
    );
  }
}
