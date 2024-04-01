import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class CompartmentItemWidget extends StatelessWidget {
  final Compartment model;
  final void Function() onTap;
  final bool isConservationArea;
  final String areaValue;

  const CompartmentItemWidget({
    required this.model,
    required this.onTap,
    required this.isConservationArea,
    required this.areaValue,
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
          if (isConservationArea) ...[
            CmoCardItem(
              title: LocaleKeys.conservation_area.tr(),
              value: areaValue,
              ratioTitleSpace: 3,
            ),
          ] else ...[
            CmoCardItem(
              title: model.productGroupTemplateName ??
                  LocaleKeys.productGroup.tr(),
              value: areaValue,
              ratioTitleSpace: 3,
            ),
            CmoCardItem(
              title: model.speciesGroupTemplateName ??
                  LocaleKeys.speciesGroup.tr(),
              value: '',
              ratioTitleSpace: 3,
            ),
          ],
        ],
      ),
    );
  }
}
