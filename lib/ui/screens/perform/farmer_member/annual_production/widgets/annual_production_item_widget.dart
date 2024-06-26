import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class AnnualProductionItemWidget extends StatelessWidget {
  const AnnualProductionItemWidget({
    super.key,
    required this.annualProduction,
  });

  final AnnualFarmProduction annualProduction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colors.blue,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: context.colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${annualProduction.year} ${LocaleKeys.annualProduction.tr()}',
                    style: context.textStyles.bodyBold.blue,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Divider(
                      height: 2,
                      thickness: 1,
                      color: context.colors.grey,
                    ),
                  ),
                  _buildInfoItemWidget(
                    context,
                    LocaleKeys.workCycles.tr(),
                    annualProduction.noOfCycles?.toString(),
                  ),
                  _buildInfoItemWidget(
                    context,
                    LocaleKeys.workers.tr(),
                    annualProduction.noOfWorkers?.toString(),
                  ),
                  _buildInfoItemWidget(
                    context,
                    LocaleKeys.productionPerWorker.tr(),
                    annualProduction.annualCharcoalProductionPerPerson?.toString(),
                  ),
                  _buildInfoItemWidget(
                    context,
                    LocaleKeys.productionPerTeam.tr(),
                    annualProduction.annualCharcoalProductionPerTeam?.toString(),
                  ),
                  _buildInfoItemWidget(
                    context,
                    LocaleKeys.biomassRemoved.tr(),
                    annualProduction.annualWoodBiomassRemoved?.toString(),
                  ),
                ],
              ),
            ),
            Assets.icons.icArrowRight.svgBlack,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItemWidget(
    BuildContext context,
    String key,
    String? value,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            key,
            style: context.textStyles.bodyNormal.black,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          value ?? '',
          style: context.textStyles.bodyNormal.black,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 32,
        ),
      ],
    );
  }
}
