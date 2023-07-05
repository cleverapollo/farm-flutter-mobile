import 'package:cmo/model/camp.dart';

class AddCampState {
  AddCampState({
    this.loading = false,
    this.camp,
  });

  final bool loading;
  final Camp? camp;

  AddCampState copyWith({
    bool? loading,
    Camp? camp,
  }) {
    return AddCampState(
      loading: loading ?? this.loading,
      camp: camp ?? this.camp,
    );
  }
}
