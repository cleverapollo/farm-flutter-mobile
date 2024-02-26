import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/components/radio_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MemberMapView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MemberMapViewState();
}

class MemberMapViewState extends State<MemberMapView> {

  GoogleMapController? mapController;
  Set<Polygon> generatePolygon(List<Farm> farms, Farm? selectedFarm,) {
    final polygon = <Polygon>{};

    for (final farm in farms) {
      if (farm.farmId == selectedFarm?.farmId) {
        continue;
      } else {
      for(final compartment in farm.compartments ?? <Compartment>[]) {
        final generatePolygon = generateSetPolygonFromCompartment(compartment);
        if (generatePolygon != null) {
          polygon.add(generatePolygon);
        }
      }

      }
    }

    if (selectedFarm != null) {
      for(final compartment in selectedFarm.compartments ?? <Compartment>[]) {
        final generatePolygon = generateSetPolygonFromCompartment(
          compartment,
          isSelected: true,
        );
        if (generatePolygon != null) {
          polygon.add(generatePolygon);
        }
      }
    }

    return polygon;
  }

  Polygon? generateSetPolygonFromCompartment(
      Compartment compartment, {
        bool isSelected = false,
      }) {
    final fillColor = isSelected ? context.colors.greenFF47.withOpacity(0.5) : context.colors.white.withOpacity(0.5);
    final strokeColor = isSelected ? context.colors.greenFF47 : context.colors.white;

    if (compartment.getPolygonLatLng().isBlank) return null;

    return Polygon(
      polygonId: PolygonId('${compartment.localCompartmentId}'),
      points: compartment.getPolygonLatLng(),
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: 2,
    );
  }

  // Set<Marker> generateSetMarker(List<Farm> farms) {
  //   final markers = <Marker>[];
  //   for (final farm in farms) {
  //     for(final compartment in farm.compartments ?? <Compartment>[]) {
  //       final centerPoint = compartment.centerPoint();
  //       final generatePolygon = generateSetPolygonFromCompartment(compartment);
  //       if (generatePolygon != null) {
  //         polygon.add(generatePolygon);
  //       }
  //     }
  //   }
  //
  //   return Set.of(markers);
  // }

  // Future<void> initMapData(List<Farm> farms) async {
  //
  //   if (farms.isNotBlank) {
  //     for (final farm in farms) {
  //       for(final compartment in farm.compartments ?? <Compartment>[]) {
  //         final centerPoint = compartment.centerPoint();
  //         final marker = Marker(
  //           markerId: MarkerId('place_name_${centerPoint.latitude}_${centerPoint.longitude}'),
  //           position: centerPoint,
  //           // onTap: () => onTap?.call(MarkerId('place_name_${position.latitude}_${position.longitude}')),
  //           // draggable: draggable,
  //           // onDrag: (latLng) {
  //           //   onDrag?.call(
  //           //     latLng,
  //           //     MarkerId('place_name_${position.latitude}_${position.longitude}'),
  //           //   );
  //           // },
  //           icon: await BitmapDescriptorHelper.getBytesFromCanvasDynamic(
  //             // title: 'compartment',
  //             subtitle: 'managementUnitName',
  //           ),
  //         );
  //
  //         markers.add(marker);
  //       }
  //     }
  //   }
  //
  //   setState(() {});
  // }

  Future<void> moveMapCameraToLocation(LatLng position) async {
    await mapController?.animateCamera(CameraUpdate.newLatLng(position));
  }

  Future<void> moveMapCameraToInitLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await mapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          position.latitude,
          position.longitude,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              BlocBuilder<MemberManagementCubit, MemberManagementState>(
                builder: (context, state) {
                  return GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: Constants.mapCenter, zoom: 14,),
                    polygons: generatePolygon(
                      state.completedFarms, state.selectedFarm,),
                    mapType: MapType.satellite,
                    markers: Set.of(state.markers),
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                      MapUtils.checkLocationPermission(
                        onAllowed: () async {
                          await Future.delayed(Duration(seconds: 1));
                          await moveMapCameraToInitLocation();
                        },
                      );
                    },
                  );
                    },
                  ),
              const MapCenterIcon(),
            ],
          ),
        ),
        const SizedBox(height: 8,),
        rmuInformation(),
        const SizedBox(height: 32),
        radioButtons(),
        const SizedBox(height: 32),
        functionButtons(),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget rmuInformation() {
    return BlocBuilder<MemberManagementCubit, MemberManagementState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              state.activeRMU?.regionalManagerUnitName ?? '',
              style:
                  context.textStyles.bodyBold.blueDark2.copyWith(fontSize: 18),
            ),
            Text(
              '${LocaleKeys.site_area.tr()}: ${context.read<MemberManagementCubit>().calculateTotalFarmSizeRmu().toStringAsFixed(2)} ha ${LocaleKeys.measured.tr()}',
              style: context.textStyles.bodyBold.blueDark2,
            ),
          ],
        );
      },
    );
  }

  Widget radioButtons() {
    return BlocBuilder<MemberManagementCubit, MemberManagementState>(
      builder: (context, state) {
        return RadioItem(
          onTap: context.read<MemberManagementCubit>().updateShowSiteName,
          isDisplayIconFirst: true,
          title: LocaleKeys.show_site_names.tr(),
          isSelected: state.isShowSiteName,
          padding: const EdgeInsets.symmetric(horizontal: 24,),
        );
      },
    );
  }

  Widget functionButtons() {
    return BlocSelector<MemberManagementCubit, MemberManagementState, Farm?>(
      selector: (state) => state.selectedFarm,
      builder: (context, selectedFarm) {
        return CmoFilledButton(
          title: LocaleKeys.open_site.tr(),
          titleStyle: context.textStyles.bodyBold.white,
          disable: selectedFarm == null,
          onTap: context.read<MemberManagementCubit>().onShowMemberDetailMapView,
        );
      },
    );
  }
}
