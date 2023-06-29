import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';

class AsiDetailState {
  AsiDetailState({
    this.farmId = '',
    this.locationModel,
    this.types,
  });

  final String farmId;
  final LocationModel? locationModel;
  final List<AsiType>? types;

  AsiDetailState copyWith({
    String? farmId,
    LocationModel? locationModel,
    List<AsiType>? types
  }) {
    return AsiDetailState(
      farmId: farmId ?? this.farmId,
      locationModel: locationModel ?? this.locationModel,
      types: types ?? this.types,
    );
  }
}
