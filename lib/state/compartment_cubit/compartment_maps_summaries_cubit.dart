import 'dart:convert';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'compartment_maps_summaries_state.dart';

class CompartmentMapsSummariesCubit
    extends Cubit<CompartmentMapsSummariesState> {
  CompartmentMapsSummariesCubit({
    required List<Compartment> listCompartments,
    required Compartment selectedCompartment,
  }) : super(
          CompartmentMapsSummariesState(
            listCompartments: listCompartments,
            selectedCompartment: selectedCompartment,
          ),
        ) {
    initMapData();
  }

  Future<void> initMapData() async {
    if (state.listCompartments.isNotBlank) {
      final _markers = <Marker>[];
      for (final compartment in state.listCompartments) {
        if (compartment.polygon.isNotBlank) {
          List<PolygonItem>? points = <PolygonItem>[];
          final jsonArray = json.decode(compartment.polygon ?? '') as List?;
          points = jsonArray
              ?.map((model) => PolygonItem.fromJson(model as Map<String, dynamic>))
              .toList();
          if (points != null) {
            for (final item in points) {
              final latLng = item.toLatLng();
              if (latLng != null) {
                _markers.add(await CommonFunctions.generateMarkerFromLatLng(LatLng(latLng.latitude, latLng.longitude)));
              }
            }
          }
        }
      }

      emit(state.copyWith(markers: _markers));
    }
  }
}
