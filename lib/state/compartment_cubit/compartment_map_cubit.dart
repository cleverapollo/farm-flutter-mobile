import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'compartment_map_state.dart';

class CompartmentMapCubit extends Cubit<CompartmentMapState> {
  CompartmentMapCubit({
    List<LatLng>? points,
  }) : super(
          CompartmentMapState(
            points: points,
          ),
        );

  Future<void> initMapData() async {
    if (state.points.isNotBlank) {
      final _markers = <Marker>[];
      for (final item in state.points!) {
        _markers.add(await generateMarkerFromLatLng(item));
      }

      emit(
        state.copyWith(
          markers: _markers,
          tempMarkers: _markers,
        ),
      );
    }
  }

  void onCameraMove(CameraPosition cameraPosition, bool isFinish) {
    if (isFinish) return;
    if (state.tempMarkers.isNotEmpty) {
      final tempMarkers = state.tempMarkers;
      if (tempMarkers.length == 1) {
        tempMarkers.add(tempMarkers.last);
      }

      tempMarkers[tempMarkers.length - 1] = tempMarkers[tempMarkers.length - 1].copyWith(
        positionParam: LatLng(
          cameraPosition.target.latitude,
          cameraPosition.target.longitude,
        ),
      );

      emit(state.copyWith(tempMarkers: tempMarkers));
    }
  }

  Future<void> creatNewMarker(LatLng? latLng) async {
    if (latLng == null) return;
    final marker = await generateMarkerFromLatLng(latLng);
    emit(
      state.copyWith(
        markers: state.markers + [marker],
        tempMarkers: state.tempMarkers + [marker],
      ),
    );
  }

  void removePreviousMarker() {
    final _markers = state.tempMarkers;
    if (_markers.isEmpty) return;
    _markers.removeLast();
    emit(
      state.copyWith(
        markers: _markers,
        tempMarkers: _markers,
      ),
    );
  }

  Future<Marker> generateMarkerFromLatLng(LatLng position) async {
    return Marker(
      markerId: MarkerId('place_name_${position.latitude}_${position.longitude}'),
      position: position,
      icon: await BitmapDescriptorHelper.getBitmapDescriptorFromSvgAsset(
        Assets.icons.mapPolygonPoint.path,
        const Size(8, 8),
      ),
    );
  }
}
