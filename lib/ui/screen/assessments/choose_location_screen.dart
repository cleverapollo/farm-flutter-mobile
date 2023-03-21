// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_setters_to_change_properties

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/snack/success.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/debouncer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseLocationScreenResult extends Equatable {
  final LatLng latLong;
  final String address;

  const ChooseLocationScreenResult({
    required this.latLong,
    required this.address,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props =>
      [latLong, latLong.latitude, latLong.longitude, address];
}

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({super.key});

  static Future<T?> push<T>(BuildContext context) async {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(builder: (_) => const ChooseLocationScreen()),
    );
  }

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-26.024176, 28.042453);
  LatLng _latLong = const LatLng(-26.024176, 28.042453);
  String _address = '';
  bool _loading = false;
  final _debouncer = Debouncer(milliseconds: 600);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      updateAddress(_latLong.latitude, _latLong.longitude);
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _latLong = position.target;
    });
    updateAddress(position.target.latitude, position.target.longitude);
  }

  void updateAddress(double latitude, double longitude) {
    _debouncer.run(() async {
      try {
        setState(() {
          _loading = true;
        });
        await placemarkFromCoordinates(
          latitude,
          longitude,
          localeIdentifier: 'en_US',
        ).then((placemarks) {
          if (placemarks.isNotEmpty && context.mounted) {
            final placeMark = placemarks[0];
            final name = placeMark.name ?? '';
            final subLocality = placeMark.subLocality ?? '';
            final locality = placeMark.locality ?? '';
            final administrativeArea = placeMark.administrativeArea ?? '';
            final postalCode = placeMark.postalCode ?? '';
            final country = placeMark.country ?? '';
            final address =
                '$name, $subLocality, $locality, $administrativeArea $postalCode, $country';
            if (context.mounted) {
              setState(() {
                _address = address;
              });
            }
          }
        });
      } catch (e, s) {
        debugPrint('$e $s');
      } finally {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  void submit() {
    if (_loading) return;
    if (_address.isEmpty) {
      showSnackError(msg: 'Please choose a location!');
      return;
    }

    Navigator.of(context).pop(
      ChooseLocationScreenResult(
        address: _address,
        latLong: _latLong,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.siteLocation.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Row(),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    onMapCreated: _onMapCreated,
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
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
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
                                        text: _latLong.latitude
                                            .toStringAsFixed(6),
                                        style: context.textStyles.bodyNormal,
                                      ),
                                      TextSpan(
                                        text: ', ',
                                        style: context.textStyles.bodyNormal,
                                      ),
                                      TextSpan(
                                        text: _latLong.longitude
                                            .toStringAsFixed(6),
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
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.locationName.tr(),
                        style: context.textStyles.bodyBold,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(width: 4),
                      if (_loading)
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: SizedBox(
                            width: 8,
                            height: 8,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: context.colors.blue,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 64,
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
                              child: Text(
                                _address,
                                style: context.textStyles.bodyNormal,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: CmoFilledButton(
                      title: LocaleKeys.save.tr(),
                      disable: _loading,
                      onTap: () => submit(),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
