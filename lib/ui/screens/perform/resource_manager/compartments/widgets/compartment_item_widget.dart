import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_map_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompartmentItemWidget extends StatelessWidget {
  final Compartment model;
  final void Function() onTap;

  const CompartmentItemWidget({
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
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
          CmoCardHeader(
            title: '${LocaleKeys.compartment.tr()} ${model.compartmentName}',
          ),
          CmoCardItem(
            title: LocaleKeys.productGroup.tr(),
            value: '${model.productGroup} ha',
          ),
          CmoCardItem(
            title: LocaleKeys.speciesGroup.tr(),
            value: (model.speciesGroup ?? 0).toString(),
          ),
        ],
      ),
    );
  }
}
