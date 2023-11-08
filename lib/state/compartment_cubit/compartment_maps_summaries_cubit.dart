import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'compartment_maps_summaries_state.dart';

class CompartmentMapsSummariesCubit extends Cubit<CompartmentMapsSummariesState> {
  CompartmentMapsSummariesCubit({
    required List<Compartment> listCompartments,
    required Compartment selectedCompartment,
  }) : super(
          CompartmentMapsSummariesState(
            listCompartments: listCompartments,
            selectedCompartment: selectedCompartment,
          ),
        );

  Future<void> initMapData() async {
    emit(state.copyWith(loading: true));
    final listCompartmentMapDetails = <CompartmentMapDetail>[];
    final selectedCompartmentMapDetail = await generateCompartmentMapDetailFromCompartment(state.selectedCompartment);
    if (state.listCompartments.isNotBlank) {
      for (final compartment in state.listCompartments) {
        final compartmentMapDetail =
            await generateCompartmentMapDetailFromCompartment(compartment);
        if (compartmentMapDetail != null) {
          listCompartmentMapDetails.add(compartmentMapDetail);
        }
      }
    }

    emit(
      state.copyWith(
        loading: false,
        selectedCompartmentMapDetails: selectedCompartmentMapDetail,
        compartmentMapDetailByCameraPosition: selectedCompartmentMapDetail,
        listCompartmentMapDetails: listCompartmentMapDetails,
      ),
    );
  }

  Future<CompartmentMapDetail?> generateCompartmentMapDetailFromCompartment(
      Compartment compartment,
      ) async {
    if (compartment.polygon.isNotBlank) {
      final compartmentMapDetail = CompartmentMapDetail(
        compartment: compartment,
        polygons: compartment.getPolygonLatLng(),
      );

      final markers = <Marker>[];
      for (final item in compartmentMapDetail.polygons) {
        markers.add(await CommonFunctions.generateMarkerFromLatLng(item));
      }

      return compartmentMapDetail.copyWith(markers: markers);
    }

    return null;
  }

  void onCameraMove(CameraPosition cameraPosition) {
    final latLng = LatLng(
      cameraPosition.target.latitude,
      cameraPosition.target.longitude,
    );

    final compartmentMapDetail = state.listCompartmentMapDetails
        .firstWhereOrNull((element) => MapUtils.checkPositionInsidePolygon(
              latLng: latLng,
              polygon: element.polygons,
            ),
    );

    emit(
      state.copyWith(
        compartmentMapDetailByCameraPosition: compartmentMapDetail,
      ),
    );
  }
}
