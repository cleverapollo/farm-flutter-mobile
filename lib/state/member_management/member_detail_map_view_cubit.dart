import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'member_detail_map_view_state.dart';

class MemberDetailMapViewCubit extends Cubit<MemberDetailMapViewState> {
  MemberDetailMapViewCubit(Farm? farm)
      : super(
          MemberDetailMapViewState(
            farm: farm,
            compartments: farm?.compartments ?? <Compartment>[],
            filterCompartments: farm?.compartments ?? <Compartment>[],
          ),
        );

  Future<void> initMapData() async {
    final currentUserRole = await configService.getActiveUserRole();
    emit(
      state.copyWith(
        currentUserRole: currentUserRole,
      ),
    );

    await generateListMarker();
  }

  Future<void> updateShowCompartmentName() async {
    emit(
      state.copyWith(
        isShowCompartmentName: !state.isShowCompartmentName,
      ),
    );

    await generateListMarker();
  }

  Future<void> updateShowASI() async {
    emit(
      state.copyWith(
        isShowASI: !state.isShowASI,
      ),
    );

    await generateListMarker();
  }

  void updateSelectedCompartment(Compartment selectedCompartment) {
    emit(
      state.copyWith(
        selectedCompartment: selectedCompartment,
        filterCompartments: state.compartments,
      ),
    );
  }

  Future<void> generateListMarker() async {
    final markers = <Marker>[];
    if (state.isShowCompartmentName) {
      for (final compartment in state.farm?.compartments ?? <Compartment>[]) {
        final centerPoint = compartment.centerPoint();
        final marker = Marker(
          markerId: MarkerId(
              'place_name_${centerPoint.latitude}_${centerPoint.longitude}'),
          position: centerPoint,
          icon: await BitmapDescriptorHelper.getBytesFromCanvasDynamic(
            title: state.farm?.farmName,
            subtitle: compartment.unitNumber,
          ),
        );

        markers.add(marker);
      }
    }

    if (state.isShowASI) {
      for (final asi in state.farm?.asi ?? <Asi>[]) {
        final asiPoint = LatLng(asi.latitude ?? 0, asi.longitude ?? 0);
        final marker = Marker(
          markerId: MarkerId('place_name_${asiPoint.latitude}_${asiPoint.longitude}'),
          position: asiPoint,
        );

        markers.add(marker);
      }
    }

    emit(
      state.copyWith(
        markers: markers,
      ),
    );
  }
}
