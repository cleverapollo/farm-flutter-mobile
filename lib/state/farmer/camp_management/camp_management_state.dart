import 'package:cmo/model/camp.dart';

class CampManagementState {
  CampManagementState({
    this.camps,
  });

  final List<Camp>? camps;

  CampManagementState copyWith({
    List<Camp>? camps,
  }) {
    return CampManagementState(
      camps: camps ?? this.camps,
    );
  }
}
