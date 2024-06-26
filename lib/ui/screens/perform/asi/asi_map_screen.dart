import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/rm_asi/asi_map_cubit.dart';
import 'package:cmo/state/rm_asi/asi_map_state.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AsiMapScreen extends BaseStatefulWidget {
  AsiMapScreen({
    super.key,
    this.farmName,
    required this.onSave,
  }) : super(screenName: 'ASI Map Screen');

  final String? farmName;
  final void Function(Asi) onSave;

  @override
  State<StatefulWidget> createState() => AsiMapScreenState();

  static dynamic push(
      BuildContext context, {
        required Asi asi,
        required void Function(Asi) onSave,
        String? farmName,
      }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AsiMapCubit(
              asi: asi,
            ),
            child: AsiMapScreen(
              farmName: farmName,
              onSave: onSave,
            ),
          );
        },
      ),
    );
  }
}

class AsiMapScreenState extends BaseStatefulWidgetState<AsiMapScreen> {

  GoogleMapController? mapController;

  Set<Polygon> generatePolygon() {
    final state = context.read<AsiMapCubit>().state;
    final polygon = <Polygon>{};
    if (state.outlineMarker.isBlank) return polygon;

    final listMarkers = state.outlineMarker;
    final strokeColor = context.colors.yellow;

    return {
      Polygon(
        polygonId: PolygonId('${state.outlinedCompartment?.localCompartmentId}'),
        points: listMarkers.map((e) => e.position).toList(),
        fillColor: context.colors.yellow.withOpacity(0.3),
        strokeColor: strokeColor,
        strokeWidth: 2,
      )
    };
  }

  Future<void> moveMapCameraToLocation(LatLng position) async {
    await mapController?.animateCamera(CameraUpdate.newLatLng(position));
  }

  Future<void> moveMapCameraToCurrentLocation() async {
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

  Future<void> moveMapCameraToInitLocation() async {
    final state = context.read<AsiMapCubit>().state;
    if (state.asi.latitude != null && state.asi.longitude != null) {
      await moveMapCameraToLocation(
        LatLng(
          state.asi.latitude!,
          state.asi.longitude!,
        ),
      );
    } else if (state.outlinedCompartment != null) {
      await mapController?.animateCamera(
        CameraUpdate.newLatLng(
          state.outlinedCompartment!.centerPoint(),
        ),
      );
    } else {
      await moveMapCameraToCurrentLocation();
    }
  }

  @override
  bool get canPopWithoutWarningDialog => !context.read<AsiMapCubit>().state.isEditing;

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.asi.tr(),
        subtitle: widget.farmName ?? '',
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: onShowWarningDispose,
        trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
        onTapTrailing: onShowWarningDispose,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<AsiMapCubit, AsiMapState>(
                  builder: (context, state) {
                    return GoogleMap(
                      initialCameraPosition: const CameraPosition(
                        target: Constants.mapCenter,
                        zoom: Constants.mapZoom,
                      ),
                      polygons: generatePolygon(),
                      mapType: state.mapType,
                      myLocationEnabled: true,
                      markers: state.marker == null ? {} : {state.marker!},
                      onCameraMove: (position) => context
                          .read<AsiMapCubit>()
                          .onCameraMove(position),
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                        MapUtils.checkLocationPermission(
                          onAllowed: () async {
                            await Future.delayed(const Duration(seconds: 1)).then((_) async {
                              await moveMapCameraToInitLocation();
                            });
                          },
                        );
                      },
                    );
                  },
                ),
                Positioned(
                  left: 15,
                  bottom: 15,
                  child: MapTypeSwitchButton(
                    onTap: context.read<AsiMapCubit>().onChangeMapType,
                  ),
                ),
                const MapCenterIcon(),
              ],
            ),
          ),
          BlocSelector<AsiMapCubit, AsiMapState, Marker?>(
            selector: (state) => state.marker,
            builder: (context, marker) {
              return MapLatLongFooter(
                marker?.position,
              );
            },
          ),
          const SizedBox(height: 32),
          functionButtons(),
          const SizedBox(height: 24),
          BlocSelector<AsiMapCubit, AsiMapState, Marker?>(
            selector: (state) => state.marker,
            builder: (context, marker) {
              return Align(
                child: CmoFilledButton(
                  title: LocaleKeys.save.tr(),
                  disable: marker == null,
                  onTap: () {
                    widget.onSave(context.read<AsiMapCubit>().state.asi);
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget functionButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: context.read<AsiMapCubit>().removeMarker,
              child: Container(
                alignment: Alignment.center,
                child: SvgGenImage(Assets.icons.icRefreshMap.path).svg(
                  height: 68,
                  width: 68,
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: context.read<AsiMapCubit>().createNewMarker,
              child: Container(
                alignment: Alignment.center,
                child: SvgGenImage(Assets.icons.icAcceptMap.path).svg(
                  height: 68,
                  width: 68,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
