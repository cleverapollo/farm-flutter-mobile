import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cmo/utils/utils.dart';

class SiteLocationScreen extends StatefulWidget {
  final LatLng? mapCenter;
  const SiteLocationScreen({Key? key, this.mapCenter}) : super(key: key);

  static Future<T?> push<T>(BuildContext context, LatLng? mapCenter) async {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(builder: (_) => SiteLocationScreen(mapCenter: mapCenter,)),
    );
  }

  @override
  State<SiteLocationScreen> createState() => _SiteLocationScreenState();
}

class _SiteLocationScreenState extends State<SiteLocationScreen> {
  double? latitude;
  double? longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.siteLocation.tr(),
        showLeading: true,
        subtitle: LocaleKeys.siteName.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: CmoMap(
              initialMapCenter: widget.mapCenter ?? Constants.mapCenter,
              onMapMoved: (lat, long) {
                latitude = lat;
                longitude = long;
              },
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            flex: 1,
            child: Center(
              child: CmoFilledButton(
                title: LocaleKeys.save.tr(),
                onTap: () {
                  Navigator.of(context)
                      .pop(latitude != null ? [latitude, longitude] : null);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
