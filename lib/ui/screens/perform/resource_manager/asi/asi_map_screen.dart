import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ASIMapScreen extends StatefulWidget {
  final String? farmName;
  const ASIMapScreen({super.key, this.farmName});

  static Future<void> push(BuildContext context, {String? farmId, String? farmName}) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ASIMapScreen()));
  }

  @override
  State<ASIMapScreen> createState() => _ASIMapScreenState();
}

class _ASIMapScreenState extends State<ASIMapScreen> {
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
                initialPoint:
                    const LatLng(-26.015368927981065, 28.042593151330948),
                marker: (p0) => marker = p0,
              ),
              const SizedBox(height: 40),
              Align(
                child: CmoFilledButton(
                    title: LocaleKeys.next.tr(),
                    onTap: () {
                      ASIDetailScreen.push(context, point: marker);
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
