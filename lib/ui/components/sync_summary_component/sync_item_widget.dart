import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class SyncItemWidget extends StatelessWidget {
  const SyncItemWidget({
    super.key,
    required this.label,
    this.count,
    this.isTitle = false,
    this.isHighlight = false,
  });

  final String label;
  final bool isTitle;
  final bool isHighlight;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return isTitle
        ? Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.only(left: 12, top: 4, bottom: 4),
            color: context.colors.blueDark1,
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    label,
                    style: isTitle
                        ? context.textStyles.bodyBold
                            .copyWith(color: context.colors.white)
                        : context.textStyles.bodyNormal.copyWith(
                            color: isHighlight
                                ? context.colors.yellow
                                : context.colors.black),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    LocaleKeys.record_count.tr(),
                    style: isTitle
                        ? context.textStyles.bodyBold
                            .copyWith(color: context.colors.white)
                        : context.textStyles.bodyBold.copyWith(
                            color: isHighlight
                                ? Colors.amberAccent
                                : Colors.black),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        label,
                        style: isTitle
                            ? context.textStyles.titleBold
                            : context.textStyles.bodyNormal.copyWith(
                                color: isHighlight
                                    ? Colors.amberAccent
                                    : Colors.black),
                      )),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(count == null ? '' : count.toString(),
                        style: isTitle
                            ? context.textStyles.titleBold
                            : context.textStyles.bodyNormal.copyWith(
                                color: isHighlight
                                    ? Colors.amberAccent
                                    : Colors.black)),
                  ),
                ],
              ),
            ),
          );
  }
}

class SyncPairItemModel {
  SyncPairItemModel(this.title,
      {this.count, this.isTitle = false, this.isActive = false});

  final String title;
  final num? count;
  final bool isTitle;
  final bool isActive;
}
