import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
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
        ) {
    init();
  }

  Future<void> init() async {
    final currentUserRole = await configService.getActiveUserRole();
    switch (currentUserRole) {
      case UserRoleEnum.farmerMember:
        final rteSpecies = await cmoDatabaseMasterService.getRteSpeciesByFarmId(state.farm!.farmId);
        final asis = await cmoDatabaseMasterService.getAsiRegisterByFarmId(state.farm!.farmId);
        emit(
          state.copyWith(
            rteSpecies: rteSpecies,
            asis: asis,
          ),
        );
        break;
      default:
        break;
    }

    emit(
      state.copyWith(
        currentUserRole: currentUserRole,
      ),
    );
  }

   Future<void> initMapData() async {
    await generateListMarker();
  }

  void onCameraMove(LatLngBounds? visibleRegion) {
    emit(
      state.copyWith(
        visibleRegion: visibleRegion,
      ),
    );
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

  Future<void> updateShowRte() async {
    emit(
      state.copyWith(
        isShowRTE: !state.isShowRTE,
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
      for (final asi in state.asis) {
        final asiPoint = LatLng(asi.latitude ?? 0, asi.longitude ?? 0);
        final marker = Marker(
          markerId: MarkerId('place_name_${asiPoint.latitude}_${asiPoint.longitude}'),
          position: asiPoint,
        );

        markers.add(marker);
      }
    }

    if (state.isShowRTE) {
      for (final rteSpecies in state.rteSpecies) {
        final rteSpeciesPoint = LatLng(rteSpecies.latitude ?? 0, rteSpecies.longitude ?? 0);
        final marker = Marker(
          markerId: MarkerId('place_name_${rteSpeciesPoint.latitude}_${rteSpeciesPoint.longitude}'),
          position: rteSpeciesPoint,
          icon: await BitmapDescriptorHelper.getBitmapDescriptorFromSvgAsset(
            Assets.icons.icGreenMarker.path,
            const Size(20, 35),
          ),
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
