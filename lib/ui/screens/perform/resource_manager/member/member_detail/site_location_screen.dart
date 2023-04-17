import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

class SiteLocationScreen extends StatefulWidget {
  const SiteLocationScreen({Key? key}) : super(key: key);

  static Future<T?> push<T>(BuildContext context) async {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(builder: (_) => const SiteLocationScreen()),
    );
  }

  @override
  State<SiteLocationScreen> createState() => _SiteLocationScreenState();
}

class _SiteLocationScreenState extends State<SiteLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.siteLocation.tr(),
        showLeading: true,
        subtitle: "Site Name",
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: CmoMap(
              onMapMoved: (lat, long) {
                print("lat: $lat, long: $long");
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
                  print("Submit location");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
