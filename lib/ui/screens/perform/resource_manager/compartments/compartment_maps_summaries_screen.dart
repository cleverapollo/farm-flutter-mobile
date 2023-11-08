import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompartmentMapsSummariesScreen extends BaseStatefulWidget {
  CompartmentMapsSummariesScreen({
    super.key,
    this.farmName,
    required this.farmId,
  }) : super(screenName: 'Compartment Maps Summaries');

  final String? farmName;
  final String farmId;

  @override
  State<StatefulWidget> createState() => CompartmentMapsSummariesScreenState();

  static dynamic push(
      BuildContext context, {
        required String farmId,
        required List<Compartment> listCompartments,
        required Compartment selectedCompartment,
        String? farmName,
        String? campId,
      }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => CompartmentMapsSummariesCubit(
              listCompartments: listCompartments,
              selectedCompartment: selectedCompartment,
              // farmId,
              // compartment: compartment ?? const Compartment(
              //   isActive: true,
              // ),
            ),
            child: CompartmentMapsSummariesScreen(
              farmName: farmName,
              farmId: farmId,
            ),
          );
        },
      ),
    );
  }
}

class CompartmentMapsSummariesScreenState extends BaseStatefulWidgetState<CompartmentMapsSummariesScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<CompartmentMapsSummariesCubit>().initMapData();
      await moveMapCameraToInitLocation();
    });
  }

  GoogleMapController? mapController;

  Set<Polyline> generateSetPolylineFromCompartmentMapDetail(
    CompartmentMapDetail compartmentMapDetail, {
    bool isSelected = false,
  }) {
    var polylines = <Polyline>{};
    if (compartmentMapDetail.markers.length < 2) {
      return polylines;
    }

    final lineColor = isSelected ? context.colors.yellow : context.colors.grey;
    for (var i = 1; i < compartmentMapDetail.markers.length; i++) {
      polylines.add(
        Polyline(
          polylineId: PolylineId('${compartmentMapDetail.compartment.localCompartmentId} ${i - 1}_$i'),
          points: [
            compartmentMapDetail.markers[i - 1].position,
            compartmentMapDetail.markers[i].position
          ],
          color: lineColor,
          width: 5,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
        ),
      );
    }

    polylines.add(
      Polyline(
        polylineId: PolylineId(
            '${compartmentMapDetail.compartment.localCompartmentId} ${compartmentMapDetail.markers.length - 1}_0'),
        points: [
          compartmentMapDetail.markers[compartmentMapDetail.markers.length - 1].position,
          compartmentMapDetail.markers[0].position,
        ],
        color: lineColor,
        width: 5,
      ),
    );

    return polylines;
  }

  Set<Polyline> generatePolyline() {
    final state = context.read<CompartmentMapsSummariesCubit>().state;
    if (state.isEditing) {
      return generateSetPolylineFromCompartmentMapDetail(
        state.selectedCompartmentMapDetails!,
        isSelected: true,
      );
    }

    return <Polyline>{};
  }

  Polygon generateSetPolygonFromCompartmentMapDetail(
      CompartmentMapDetail compartmentMapDetail, {
        bool isSelected = false,
      }) {
    final fillColor = isSelected ? context.colors.yellow.withOpacity(0.3) : context.colors.grey.withOpacity(0.5);
    final strokeColor = isSelected ? context.colors.yellow : context.colors.grey;

    return Polygon(
      polygonId: PolygonId('${compartmentMapDetail.compartment.localCompartmentId}'),
      points: compartmentMapDetail.markers.map((e) => e.position).toList(),
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: 5,
    );
  }

  Set<Polygon> generatePolygon() {
    final state = context.read<CompartmentMapsSummariesCubit>().state;
    final polygon = <Polygon>{};

    for (final compartmentMapDetail in state.listCompartmentMapDetails) {
      if (compartmentMapDetail.compartment.localCompartmentId == state.selectedCompartment.localCompartmentId) {
        continue;
      } else {
        polygon.add(generateSetPolygonFromCompartmentMapDetail(compartmentMapDetail));
      }
    }

    if (state.selectedCompartmentMapDetails != null && !state.isEditing) {
      polygon.add(
        generateSetPolygonFromCompartmentMapDetail(
          state.selectedCompartmentMapDetails!,
          isSelected: true,
        ),
      );
    }

    return polygon;
  }

  Future<void> moveMapCameraToInitLocation() async {
    final state = context.read<CompartmentMapsSummariesCubit>().state;
    if (state.selectedCompartmentMapDetails == null) {
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
    } else {
      await mapController?.animateCamera(
        CameraUpdate.newLatLng(
          state.selectedCompartmentMapDetails!.centerPoint(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.compartments.tr(),
        subtitle: widget.farmName ?? '',
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<CompartmentMapsSummariesCubit, CompartmentMapsSummariesState>(
                  builder: (context, state) {
                    return GoogleMap(
                      initialCameraPosition: const CameraPosition(target: Constants.mapCenter, zoom: 14),
                      polylines: generatePolyline(),
                      polygons: generatePolygon(),
                      mapType: MapType.satellite,
                      myLocationEnabled: true,
                      markers: Set.of(state.editingMarkers),
                      onCameraMove: (position) => context
                          .read<CompartmentMapsSummariesCubit>()
                          .onCameraMove(position),
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                        MapUtils.checkLocationPermission(
                          onAllowed: () async {
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
          compartmentDetailData(),
          const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    await showEditDialog();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: SvgGenImage(Assets.icons.icEditBlueCircle.path).svg(
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget compartmentDetailData() {
    return BlocBuilder<CompartmentMapsSummariesCubit, CompartmentMapsSummariesState>(
      builder: (context, state) {
        final compartmentName = state.compartmentMapDetailByCameraPosition?.compartment.unitNumber ?? '';
        final perimeter = (state.compartmentMapDetailByCameraPosition?.getPerimeter() ?? 0).toStringAsFixed(2);
        final area = (state.compartmentMapDetailByCameraPosition?.compartment.polygonArea ?? 0).toStringAsFixed(2);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              compartmentName,
              style: context.textStyles.bodyBold.blueDark2,
            ),
            Text(
              '${LocaleKeys.perimeter.tr()} ${perimeter}km',
              style: context.textStyles.bodyNormal.blueDark2,

            ),
            Text(
              '${LocaleKeys.area.tr()} $area ha ${LocaleKeys.measured.tr()}',
              style: context.textStyles.bodyNormal.blueDark2,
            ),
          ],
        );
      },
    );
  }


  Future<void> showEditDialog() async {
    await showDialog<void>(
      context: context,
      builder: (_) {
        return Dialog(
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          insetPadding: const EdgeInsets.symmetric(horizontal: 40),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 8, 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Assets.icons.icClose.svgBlack,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    context.read<CompartmentMapsSummariesCubit>().editingPolygon();
                  },
                  child: Text(
                    LocaleKeys.edit_polygon.tr(),
                    style: context.textStyles.bodyBold.blueDark2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    final state = context.read<CompartmentMapsSummariesCubit>().state;
                    await CompartmentDetailScreen.push(
                      context,
                      farmId: widget.farmId,
                      farmName: widget.farmName,
                      compartment: state.selectedCompartment,
                    );
                  },
                  child: Text(
                    LocaleKeys.edit_details.tr(),
                    style: context.textStyles.bodyBold.blueDark2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
