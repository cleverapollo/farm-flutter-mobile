import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ASIMapScreen extends StatefulWidget {
  final String? farmName;
  final String farmId;
  final String? campId;

  const ASIMapScreen({
    super.key,
    required this.farmId,
    this.farmName,
    this.campId,
  });

  static Future<void> push(
    BuildContext context, {
    String? farmId,
    String? farmName,
    String? campId,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ASIMapScreen(
          farmId: farmId ?? '',
          farmName: farmName,
            campId: campId,
        ),
      ),
    );
  }

  @override
  State<ASIMapScreen> createState() => _ASIMapScreenState();
}

class _ASIMapScreenState extends State<ASIMapScreen> {
  GlobalKey mapWidgetKey = GlobalKey();
  LatLng? marker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.addASI.tr(),
        subtitle: widget.farmName ?? '',
        showTrailing: true,
      ),
      body: SizedBox.expand(
        child: ColoredBox(
          color: context.colors.white,
          child: Column(
            children: [
              CmoMapWidget.markerWithPhotos(
                key: mapWidgetKey,
                initialPoint: null,
                marker: (p0) => marker = p0,
              ),
              const SizedBox(height: 40),
              Align(
                child: CmoFilledButton(
                    title: LocaleKeys.next.tr(),
                    onTap: () {
                      LocationModel? locationModel;
                      if (mapWidgetKey.currentState is CmoMapWidgetState) {
                        final mapState =
                        mapWidgetKey.currentState! as CmoMapWidgetState;
                        locationModel = mapState.locationModel;
                      }
                      ASIDetailScreen.push(
                        context,
                        farmId: widget.farmId,
                        farmName: widget.farmName,
                        locationModel: locationModel,
                        campId: widget.campId,
                      );
                    }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
