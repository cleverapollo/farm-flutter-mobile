import 'package:cmo/model/camp.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/data/farm.dart';

class AddCampState {
  AddCampState({
    this.loading = false,
    this.camp,
    this.farm,
    this.compartments = const [],
  });

  final bool loading;
  final Camp? camp;
  final Farm? farm;
  final List<Compartment> compartments;

  AddCampState copyWith({
    bool? loading,
    Camp? camp,
    Farm? farm,
    List<Compartment>? compartments,
  }) {
    return AddCampState(
      loading: loading ?? this.loading,
      camp: camp ?? this.camp,
      farm: farm ?? this.farm,
      compartments: compartments ?? this.compartments,
    );
  }
}
