// ignore_for_file: public_member_api_docs, sort_constructors_first, use_setters_to_change_properties

import 'package:cmo/env/env.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/constants.dart';
import 'package:cmo/utils/debouncer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_autocomplete_field/map_autocomplete_field.dart';

class AssessmentLocationScreenResult extends Equatable {
  final LatLng? latLong;
  final String address;

  const AssessmentLocationScreenResult({
    this.latLong,
    required this.address,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [latLong?.latitude, latLong?.longitude, address];
}

class AssessmentLocationScreen extends StatefulWidget {

  final bool showMarker;

  const AssessmentLocationScreen({
    super.key,
    this.showMarker = false,
  });

  static Future<T?> push<T>(BuildContext context,
      {bool showMarker = false,}) async {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (_) =>
            AssessmentLocationScreen(
              showMarker: showMarker,
            ),
      ),
    );
  }

  @override
  State<AssessmentLocationScreen> createState() =>
      _AssessmentLocationScreenState();
}

class _AssessmentLocationScreenState extends State<AssessmentLocationScreen> {
  final mapKey = GlobalKey<CmoMapState>();
  String _legacyAddress = '';
  bool _loading = false;
  final _debouncer = Debouncer(milliseconds: 600);
  LatLng? _latLong;
  TextEditingController addressCtrl = TextEditingController();
  bool _isMapMovingBySelectingAddress = false;
  late VoidCallback addressChangedListener = () {
    if (_latLong != null && _legacyAddress != addressCtrl.text) {
      _latLong = null;
      setState(() {});
    }
    _legacyAddress = addressCtrl.text;
  };

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      onCameraMoved(
          Constants.mapCenter.latitude, Constants.mapCenter.longitude);
    });
    addressCtrl.addListener(addressChangedListener);
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  void onCameraMoved(double latitude, double longitude) {
    setState(() {
      _latLong = LatLng(latitude, longitude);
    });
    if (_isMapMovingBySelectingAddress) {
      return;
    }
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
                addressCtrl.removeListener(addressChangedListener);
                addressCtrl.text = address;
                _legacyAddress = addressCtrl.text;
                addressCtrl.addListener(addressChangedListener);
              });
            }
          }
        });
      } finally {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  void submit() {
    if (_loading) return;
    if (addressCtrl.text.isEmpty) {
      showSnackError(msg: LocaleKeys.please_choose_location.tr());
      return;
    }

    Navigator.of(context).pop(
      AssessmentLocationScreenResult(
        address: addressCtrl.text,
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
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                const SizedBox(height: 12),
                SizedBox(
                    height: 64,
                    child: MapAutoCompleteField(
                      googleMapApiKey:
                          Env.googlePlaceApiKey,
                      controller: addressCtrl,
                      itemBuilder: (BuildContext context, suggestion) {
                        return ListTile(
                          title: Text(suggestion.description as String),
                        );
                      },
                      onSuggestionSelected: (suggestion) async {
                        addressCtrl.removeListener(addressChangedListener);
                        addressCtrl.text = suggestion.description as String;
                        _legacyAddress = addressCtrl.text;
                        addressCtrl.addListener(addressChangedListener);
                        final locations =
                            await locationFromAddress(addressCtrl.text);
                        if (locations.length > 0) {
                          _isMapMovingBySelectingAddress = true;
                          mapKey.currentState?.mapController.animateCamera(
                              CameraUpdate.newLatLng(LatLng(
                                  locations.first.latitude,
                                  locations.first.longitude)));
                          Future.delayed(Duration(seconds: 3), () {
                            _isMapMovingBySelectingAddress = false;
                          });
                        }
                      },
                    )),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            flex: 4,
            child: CmoMap(
              key: mapKey,
              onMapMoved: onCameraMoved,
              showLatLongFooter: false,
              showMarker: widget.showMarker,
            ),
          ),
          MapLatLongFooter(_latLong),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
