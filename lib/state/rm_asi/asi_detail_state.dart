import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';

class AsiDetailState {
  AsiDetailState({
    this.farmId = '',
    this.locationModel,
    this.types,
    this.campId,
    this.compartments = const <Compartment>[],
    this.photoName,
  });

  final String farmId;
  final LocationModel? locationModel;
  final List<AsiType>? types;
  final String? campId;
  final List<Compartment> compartments;
  String? photoName;

  AsiDetailState copyWith({
    String? farmId,
    LocationModel? locationModel,
    List<AsiType>? types,
    String? campId,
    List<Compartment>? compartments,
    String? photoName,
  }) {
    return AsiDetailState(
      farmId: farmId ?? this.farmId,
      campId: campId ?? this.campId,
      locationModel: locationModel ?? this.locationModel,
      types: types ?? this.types,
      compartments: compartments ?? this.compartments,
      photoName: photoName ?? this.photoName,
    );
  }
}
