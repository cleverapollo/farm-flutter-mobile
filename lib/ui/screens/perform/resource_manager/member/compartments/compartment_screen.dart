import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/compartments/compartment_map_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompartmentScreen extends StatelessWidget {
  const CompartmentScreen({Key? key}) : super(key: key);

  static dynamic push(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CompartmentScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.compartment.tr(),
        subtitle: LocaleKeys.siteName.tr(),
        showLeading: true,
        showTrailing: true,
        trailing: GestureDetector(
            onTap: () {
              CompartmentMapScreen.push(context);
            },
            child: Assets.icons.icAdd.svgBlack),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CmoTappable(
              onTap: () => print("onSummary tapped"),
              child: CmoCard(
                content: [
                  CmoCardHeader(title: LocaleKeys.summary.tr()),
                  CmoCardItem(title: LocaleKeys.total.tr(), value: '10 ha'),
                  CmoCardItem(title: LocaleKeys.compartments.tr(), value: '1'),
                ],
                trailing: Assets.icons.icDown.svgWhite,
              ),
            ),
            const SizedBox(height: 24),
            CmoTappable(
              onTap: () {
                final points = <LatLng>[
                  LatLng(-26.015368927981065, 28.042593151330948),
                  LatLng(-26.025381761698664, 28.049022741615772),
                  LatLng(-26.02768170340819, 28.038567155599594),
                  LatLng(-26.01968835342607, 28.036944083869457),
                ];
                CompartmentMapScreen.push(context, points: points);
              },
              child: CmoCard(
                containerGradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF2072B9),
                    Color(0xFF1B294A),
                  ],
                ),
                content: [
                  CmoCardHeader(title: '${LocaleKeys.compartment.tr()} A123'),
                  CmoCardItem(
                      title: LocaleKeys.productGroup.tr(), value: '10 ha'),
                  CmoCardItem(title: LocaleKeys.speciesGroup.tr(), value: '0'),
                ],
              ),
            ),
            const Spacer(),
            CmoFilledButton(
              title: LocaleKeys.done.tr(),
              onTap: () {
                print("Submit location");
              },
            ),
          ],
        ),
      ),
    );
  }
}
