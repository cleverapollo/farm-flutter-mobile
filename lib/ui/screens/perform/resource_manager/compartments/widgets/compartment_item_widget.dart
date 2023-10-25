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
  final void Function() onTap;

  const CompartmentItemWidget({
    required this.model,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: onTap,
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
