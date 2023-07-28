// ignore_for_file: public_member_api_docs, sort_constructors_first, use_setters_to_change_properties

import 'package:cmo/env/env.dart';
import 'package:cmo/extensions/string.dart';
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

class SiteLocationScreenResult extends Equatable {
  final LatLng? latLong;
  final String address;

  const SiteLocationScreenResult({
    this.latLong,
    required this.address,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        latLong?.latitude,
        latLong?.longitude,
        address,
      ];
}

class SelectSiteLocationScreen extends StatefulWidget {

  final bool showMarker;
  final bool showResetAcceptIcons;
  final String? initAddress;
  final LatLng? initLatLng;

  const SelectSiteLocationScreen(
      {super.key,
      this.initAddress,
      this.showMarker = false,
      this.showResetAcceptIcons = false,
      this.initLatLng});

  static Future<T?> push<T>(
    BuildContext context, {
    String? initAddress,
    bool showMarker = false,
    bool showResetAcceptIcons = false,
    LatLng? latLng,
  }) async {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (_) => SelectSiteLocationScreen(
          showMarker: showMarker,
          showResetAcceptIcons: showResetAcceptIcons,
          initAddress: initAddress,
          initLatLng: latLng,
        ),
      ),
    );
  }

  @override
  State<SelectSiteLocationScreen> createState() =>
      _SelectSiteLocationScreenState();
}

class _SelectSiteLocationScreenState extends State<SelectSiteLocationScreen> {

  late TextEditingController addressTextController;
  final debounce = Debouncer(milliseconds: 600);
  final mapKey = GlobalKey<CmoMapState>();

  String _legacyAddress = '';
  LatLng? _latLong;
  bool _loading = false;
  bool _isMapMovingBySelectingAddress = false;

  late VoidCallback addressChangedListener = () {
    if (_latLong != null && _legacyAddress != addressTextController.text) {
      _latLong = null;
      setState(() {});
    }
    _legacyAddress = addressTextController.text;
  };

  @override
  void initState() {
    super.initState();
    addressTextController = TextEditingController(text: widget.initAddress);
    _latLong = widget.initLatLng;
    Future.microtask(() async {
      await initData();
    });
    addressTextController.addListener(addressChangedListener);
  }

  Future<void> initData() async {
    if (widget.initLatLng != null) {
      onCameraMoved(
        widget.initLatLng!.latitude,
        widget.initLatLng!.longitude,
        isInit: true,
      );
    } else if (widget.initAddress.isBlank) {
      onCameraMoved(
        Constants.mapCenter.latitude,
        Constants.mapCenter.longitude,
        isInit: true,
      );
    } else {
      await onSuggestionSelected(widget.initAddress);
    }
  }

  void onCameraMoved(double latitude, double longitude, {bool isInit = false}) {
    if(widget.showMarker) {
      return;
    }
    setState(() {
      _latLong = LatLng(latitude, longitude);
    });

    if (_isMapMovingBySelectingAddress) {
      return;
    }

    debounce.run(() async {
      try {
        setState(() {
          _loading = true;
        });

        await setAddress(latitude, longitude);
      } finally {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  void onPinned(double latitude, double longitude) {
    setState(() {
      _latLong = LatLng(latitude, longitude);
    });

    if (_isMapMovingBySelectingAddress) {
      return;
    }

    debounce.run(() async {
      try {
        setState(() {
          _loading = true;
        });

        await setAddress(latitude, longitude);
      } finally {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  Future<void> setAddress(double latitude, double longitude) async {
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
            addressTextController.removeListener(addressChangedListener);
            addressTextController.text = address;
            _legacyAddress = addressTextController.text;
            addressTextController.addListener(addressChangedListener);
          });
        }
      }
    });
  }

  void submit() {
    if (_loading) return;
    if (addressTextController.text.isEmpty) {
      showSnackError(msg: LocaleKeys.please_choose_location.tr());
      return;
    }

    Navigator.of(context).pop(
      SiteLocationScreenResult(
        address: addressTextController.text,
        latLong: _latLong,
      ),
    );
  }

  Future<void> onSuggestionSelected(dynamic suggestion) async {
    addressTextController.removeListener(addressChangedListener);
    addressTextController.text = suggestion is String ? suggestion : suggestion.description as String;
    _legacyAddress = addressTextController.text;
    addressTextController.addListener(addressChangedListener);
    final locations = await locationFromAddress(addressTextController.text);
    if (locations.isNotEmpty) {
      _isMapMovingBySelectingAddress = true;
      await mapKey.currentState?.mapController
          .animateCamera(
        CameraUpdate.newLatLng(
          LatLng(
            locations.first.latitude,
            locations.first.longitude,
          ),
        ),
      );

      Future.delayed(const Duration(seconds: 3), () {
        _isMapMovingBySelectingAddress = false;
      });
    }
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
                      googleMapApiKey: Env.googlePlaceApiKey,
                      controller: addressTextController,
                      itemBuilder: (BuildContext context, suggestion) {
                        return ListTile(
                          title: Text(suggestion.description as String),
                        );
                      },
                      onSuggestionSelected: onSuggestionSelected,
                    ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            flex: 4,
            child: CmoMap(
              key: mapKey,
              onMapMoved: onCameraMoved,
              onPinned: onPinned,
              showResetAcceptIcons: widget.showResetAcceptIcons,
              showMarker: widget.showMarker,
              initialMapCenter: _latLong,
              selectedPoint: _latLong,
            ),
          ),
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

  @override
  void dispose() {
    debounce.dispose();
    super.dispose();
  }
}
