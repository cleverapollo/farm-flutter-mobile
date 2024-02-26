import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/components/radio_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MemberDetailMapView extends StatefulWidget {
  final Farm farm;
  MemberDetailMapView(this.farm);
  @override
  State<StatefulWidget> createState() => MemberDetailMapViewState();
}

class MemberDetailMapViewState extends State<MemberDetailMapView> {

  GoogleMapController? mapController;
  List<Marker> markers = <Marker>[];

  Set<Polygon> generatePolygon(List<Farm> farms, Farm? selectedFarm,) {
    final polygon = <Polygon>{};

    for(final compartment in widget.farm.compartments ?? <Compartment>[]) {
      final generatePolygon = generateSetPolygonFromCompartment(compartment);
      if (generatePolygon != null) {
        polygon.add(generatePolygon);
      }
    }

    return polygon;
  }

  Polygon? generateSetPolygonFromCompartment(Compartment compartment) {
    final fillColor =context.colors.greenFF47.withOpacity(0.5);
    final strokeColor = context.colors.greenFF47;

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

  Future<void> initMapData() async {

    if (widget.farm.compartments.isNotBlank) {
        for(final compartment in widget.farm.compartments ?? <Compartment>[]) {
          final centerPoint = compartment.centerPoint();
          final marker = Marker(
            markerId: MarkerId('place_name_${centerPoint.latitude}_${centerPoint.longitude}'),
            position: centerPoint,
            // onTap: () => onTap?.call(MarkerId('place_name_${position.latitude}_${position.longitude}')),
            // draggable: draggable,
            // onDrag: (latLng) {
            //   onDrag?.call(
            //     latLng,
            //     MarkerId('place_name_${position.latitude}_${position.longitude}'),
            //   );
            // },
            icon: await BitmapDescriptorHelper.getBytesFromCanvasDynamic(
              title: widget.farm.farmName,
              subtitle: compartment.managementUnitName,
            ),
          );

          markers.add(marker);
        }
    }

    setState(() {});
  }

  Future<void> moveMapCameraToLocation(LatLng position) async {
    await mapController?.animateCamera(CameraUpdate.newLatLng(position));
  }

  Future<void> moveMapCameraToInitLocation() async {
    var centerLat = 0.0;
    var centerLong = 0.0;
    if (widget.farm.compartments.isBlank) return;
    for(final compartment in widget.farm.compartments!) {
      final centerPoint = compartment.centerPoint();
      centerLat += centerPoint.latitude;
      centerLong += centerPoint.longitude;
    }

    await mapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          centerLat / widget.farm.compartments!.length,
          centerLong / widget.farm.compartments!.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MemberDetailMapViewCubit(widget.farm),
      child: Column(
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
                            await initMapData();
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
          farmInformation(),
          const SizedBox(height: 12),
          radioButtons(),
          const SizedBox(height: 12),
          functionButtons(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget farmInformation() {
    return Text(
      '${LocaleKeys.site_area.tr()}: ${widget.farm.calculateFarmSizeBasedOnCompartments().toStringAsFixed(2)} ha ${LocaleKeys.measured.tr()}',
      style: context.textStyles.bodyBold.blueDark2,
    );
  }

  Widget radioButtons() {
    return Column(
      children: [
        RadioItem(
          onTap: context.read<MemberManagementCubit>().updateShowSiteName,
          isDisplayIconFirst: true,
          title: LocaleKeys.show_compartment_names.tr(),
          isSelected: false,//state.isShowSiteName,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
        ),
        const SizedBox(height: 12,),
        RadioItem(
          onTap: context.read<MemberManagementCubit>().updateShowSiteName,
          isDisplayIconFirst: true,
          title: LocaleKeys.show_area_of_special_interest.tr(),
          isSelected: false, //state.isShowSiteName,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
        ),
      ],
    );
  }

  Widget functionButtons() {
    return CmoFilledButton(
      title: LocaleKeys.view_member_details.tr(),
      titleStyle: context.textStyles.bodyBold.white,
      onTap: () {},
    );
  }
}
