import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/components/base/base_state.dart';

class AsiDetailState extends BaseState {
  AsiDetailState({
    required this.asi,
    this.types = const <AsiType>[],
    this.compartments = const <Compartment>[],
    this.listAsiPhotos = const <AsiPhoto>[],
    this.removedPhotos = const <AsiPhoto>[],
    this.photoName,
    super.loading,
    super.isEditing,
    this.userRole,
  });

  final List<AsiType> types;
  final List<Compartment> compartments;
  final List<AsiPhoto> listAsiPhotos;
  final List<AsiPhoto> removedPhotos;
  final UserRoleEnum? userRole;

  String? photoName;
  Asi asi;

  AsiDetailState copyWith({
    bool? loading,
    bool? isEditing,
    List<AsiType>? types,
    List<Compartment>? compartments,
    String? photoName,
    Asi? asi,
    List<AsiPhoto>? listAsiPhotos,
    List<AsiPhoto>? removedPhotos,
    UserRoleEnum? userRole,
  }) {
    return AsiDetailState(
      loading: loading ?? this.loading,
      isEditing: isEditing ?? this.isEditing,
      types: types ?? this.types,
      compartments: compartments ?? this.compartments,
      photoName: photoName ?? this.photoName,
      asi: asi ?? this.asi,
      listAsiPhotos: listAsiPhotos ?? this.listAsiPhotos,
      removedPhotos: removedPhotos ?? this.removedPhotos,
      userRole: userRole ?? this.userRole,
    );
  }
}
