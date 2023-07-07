import 'package:cmo/model/camp.dart';
import 'package:cmo/model/data/farm.dart';

class CampManagementState {
  CampManagementState({
    this.camps,
    this.farm,
  });

  final List<Camp>? camps;
  final Farm? farm;

  CampManagementState copyWith({
    List<Camp>? camps,
    Farm? farm,
  }) {
    return CampManagementState(
      camps: camps ?? this.camps,
      farm: farm ?? this.farm,
    );
  }
}
