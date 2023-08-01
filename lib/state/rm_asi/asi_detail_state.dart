import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';

class AsiDetailState {
  AsiDetailState({
    required this.asi,
    this.types = const <AsiType>[],
    this.compartments = const <Compartment>[],
    this.photoName,
    this.locationModel,
  });

  final List<AsiType> types;
  final List<Compartment> compartments;
  final LocationModel? locationModel;
  String? photoName;
  Asi asi;

  AsiDetailState copyWith({
    List<AsiType>? types,
    List<Compartment>? compartments,
    String? photoName,
    LocationModel? locationModel,
    Asi? asi,
  }) {
    return AsiDetailState(
      types: types ?? this.types,
      compartments: compartments ?? this.compartments,
      photoName: photoName ?? this.photoName,
      asi: asi ?? this.asi,
      locationModel: locationModel ?? this.locationModel,
    );
  }
}
