import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';

class AsiDetailState {
  AsiDetailState({
    required this.asi,
    this.types = const <AsiType>[],
    this.compartments = const <Compartment>[],
    this.listAsiPhotos = const <AsiPhoto>[],
    this.photoName,
    this.isLoading = false,
  });

  final List<AsiType> types;
  final List<Compartment> compartments;
  final List<AsiPhoto> listAsiPhotos;
  String? photoName;
  Asi asi;
  final bool isLoading;

  AsiDetailState copyWith({
    bool? isLoading,
    List<AsiType>? types,
    List<Compartment>? compartments,
    String? photoName,
    Asi? asi,
    List<AsiPhoto>? listAsiPhotos,
  }) {
    return AsiDetailState(
      isLoading: isLoading ?? this.isLoading,
      types: types ?? this.types,
      compartments: compartments ?? this.compartments,
      photoName: photoName ?? this.photoName,
      asi: asi ?? this.asi,
      listAsiPhotos: listAsiPhotos ?? this.listAsiPhotos,
    );
  }
}
