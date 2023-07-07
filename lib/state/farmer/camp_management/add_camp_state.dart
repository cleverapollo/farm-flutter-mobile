import 'package:cmo/model/asi.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/data/farm.dart';

class AddCampState {
  AddCampState({
    this.loading = false,
    this.camp,
    this.farm,
    this.compartments = const [],
    this.asis = const [],
  });

  final bool loading;
  final Camp? camp;
  final Farm? farm;
  final List<Compartment> compartments;
  final List<Asi> asis;

  AddCampState copyWith({
    bool? loading,
    Camp? camp,
    Farm? farm,
    List<Compartment>? compartments,
    List<Asi>? asis,
  }) {
    return AddCampState(
      loading: loading ?? this.loading,
      camp: camp ?? this.camp,
      farm: farm ?? this.farm,
      compartments: compartments ?? this.compartments,
      asis: asis ?? this.asis,
    );
  }
}
