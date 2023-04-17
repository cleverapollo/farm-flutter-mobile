import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CmoMap extends StatefulWidget {
  final LatLng initialMapCenter;
  final void Function(double, double) onMapMoved;

  const CmoMap({
    Key? key,
    this.initialMapCenter = Constants.mapCenter,
    required this.onMapMoved,
  }) : super(key: key);

  @override
  State<CmoMap> createState() => _CmoMapState();
}

class _CmoMapState extends State<CmoMap> {
  late GoogleMapController _mapController;
  final LatLng _center = const LatLng(-26.024176, 28.042453);
  LatLng _latLong = const LatLng(-26.024176, 28.042453);

  void _onCameraMove(CameraPosition position) {
    widget.onMapMoved(position.target.latitude, position.target.longitude);
    setState(() {
      _latLong = position.target;
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 36),
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  onCameraMove: _onCameraMove,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 16.0,
                  ),
                ),
              ),
              Center(
                child: Assets.icons.icPan.svgWhite,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 32,
                  child: ColoredBox(
                    color: Colors.black.withOpacity(0.4),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            LocaleKeys.panMap.tr(),
                            style: context.textStyles.bodyBold.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: context.colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Lat | Long',
                              ),
                              const TextSpan(
                                text: ' ',
                              ),
                              TextSpan(
                                text: _latLong.latitude.toStringAsFixed(6),
                                style: context.textStyles.bodyNormal,
                              ),
                              TextSpan(
                                text: ', ',
                                style: context.textStyles.bodyNormal,
                              ),
                              TextSpan(
                                text: _latLong.longitude.toStringAsFixed(6),
                                style: context.textStyles.bodyNormal,
                              ),
                            ],
                          ),
                          style: context.textStyles.bodyBold,
                        ),
                      ),
                    ),
                    Assets.icons.icLocation.widget,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
