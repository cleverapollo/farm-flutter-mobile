part of 'add_aai_cubit.dart';

class AddAAIState {
  AddAAIState({
    required this.accidentAndIncident,
    required this.isAddNew,
    this.lostTimeInDay = '',
  });

  final bool isAddNew;
  final String lostTimeInDay;
  AccidentAndIncident accidentAndIncident;

  AddAAIState copyWith({
    AccidentAndIncident? accidentAndIncident,
    String? lostTimeInDay,
  }) {
    return AddAAIState(
      accidentAndIncident: accidentAndIncident ?? this.accidentAndIncident,
      isAddNew: isAddNew,
      lostTimeInDay: lostTimeInDay ?? this.lostTimeInDay,
    );
  }
}
