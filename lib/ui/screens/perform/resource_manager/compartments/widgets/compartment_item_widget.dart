import 'dart:convert';

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
        // final points = model.locations
        //         ?.map((e) => LatLng(e.latitude ?? 0, e.longitude ?? 0)).toList();
        // if (points == null) {
        //   return;
        // }
        if (model.jsonLocations == null) {
          return;
        }
        var jsonArray = json.decode(model.jsonLocations!) as List?;
        var points = List<GeoLocation>.from(jsonArray!.map(
            (model) => GeoLocation.fromJson(model as Map<String, dynamic>)));
        if (points == null) {
          return;
        }
        CompartmentMapScreen.push(context,
            points: points
                .map((e) => LatLng(e.latitude ?? 0, e.longitude ?? 0))
                .toList());
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
            title: '${LocaleKeys.compartment.tr()}: ${model.compartmentName}',
          ),
          CmoCardItem(
            title: model.productGroupName ?? LocaleKeys.productGroup.tr(),
            value: '${model.polygonArea?.toStringAsFixed(2)} ha',
            ratioTitleSpace: 3,
          ),
          CmoCardItem(
            title: model.speciesGroupName ?? LocaleKeys.speciesGroup.tr(),
            value: '',
            ratioTitleSpace: 3,
          ),
        ],
      ),
    );
  }
}
