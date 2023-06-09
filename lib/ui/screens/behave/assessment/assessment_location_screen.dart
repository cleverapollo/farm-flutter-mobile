// ignore_for_file: public_member_api_docs, sort_constructors_first, use_setters_to_change_properties

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

class AssessmentLocationScreenResult extends Equatable {
  final LatLng latLong;
  final String address;

  const AssessmentLocationScreenResult({
    required this.latLong,
    required this.address,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props =>
      [latLong, latLong.latitude, latLong.longitude, address];
}

class AssessmentLocationScreen extends StatefulWidget {
  const AssessmentLocationScreen({super.key});

  static Future<T?> push<T>(BuildContext context) async {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(builder: (_) => const AssessmentLocationScreen()),
    );
  }

  @override
  State<AssessmentLocationScreen> createState() =>
      _AssessmentLocationScreenState();
}

class _AssessmentLocationScreenState extends State<AssessmentLocationScreen> {
  late GoogleMapController mapController;
  String _address = '';
  bool _loading = false;
  final _debouncer = Debouncer(milliseconds: 600);
  LatLng _latLong = Constants.mapCenter;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      onCameraMoved(Constants.mapCenter.latitude, Constants.mapCenter.longitude);
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void onCameraMoved(double latitude, double longitude) {
    _latLong = LatLng(latitude, longitude);
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
      showSnackError(msg: LocaleKeys.please_choose_location.tr());
      return;
    }

    Navigator.of(context).pop(
      AssessmentLocationScreenResult(
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
          const SizedBox(height: 36),
          Expanded(
            flex: 3,
            child: CmoMap(
              onMapMoved: onCameraMoved,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
