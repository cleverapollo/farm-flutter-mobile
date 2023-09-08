import 'dart:convert';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/compartment_cubit/compartment_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_map_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompartmentItemWidget extends StatelessWidget {
  final Compartment model;

  const CompartmentItemWidget({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: () async {
        List<PolygonItem>? points = <PolygonItem>[];
        if (model.polygon.isNotBlank) {
          final jsonArray = json.decode(model.polygon ?? '') as List?;
          points = jsonArray?.map((model) => PolygonItem.fromJson(model as Map<String, dynamic>)).toList();
        }

        final farm = await cmoDatabaseMasterService.getFarmById(model.farmId ?? '');
        await CompartmentMapScreen.push(
          context,
          farmId: model.farmId ?? '',
          farmName: farm?.farmName ?? '',
          points: points?.map((e) => LatLng(e.latitude ?? 0, e.longitude ?? 0)).toList(),
          compartment: model,
        );
        context.read<CompartmentCubit>().loadListCompartment();
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
            title: '${LocaleKeys.compartment.tr()}: ${model.unitNumber ?? ''}',
          ),
          CmoCardItem(
            title:
                model.productGroupTemplateName ?? LocaleKeys.productGroup.tr(),
            value: '${model.polygonArea?.toStringAsFixed(2)} ha',
            ratioTitleSpace: 3,
          ),
          CmoCardItem(
            title:
                model.speciesGroupTemplateName ?? LocaleKeys.speciesGroup.tr(),
            value: '',
            ratioTitleSpace: 3,
          ),
        ],
      ),
    );
  }
}
