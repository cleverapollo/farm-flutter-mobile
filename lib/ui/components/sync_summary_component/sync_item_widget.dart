import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class SyncItemWidget extends StatelessWidget {
  const SyncItemWidget({
    super.key,
    required this.first,
    this.isTitle = false,
    this.isHighlight = false,
    this.count = 0,
  });

  final String first;
  final bool isTitle;
  final bool isHighlight;
  final num? count;

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
                    first,
                    style: isTitle
                        ? context.textStyles.titleBold
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
                    'Record Count',
                    style: isTitle
                        ? context.textStyles.titleBold
                            .copyWith(color: Colors.white)
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
                children: [
                  Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        first,
                        style: isTitle
                            ? context.textStyles.titleBold
                            : context.textStyles.bodyNormal.copyWith(
                                color: isHighlight
                                    ? Colors.amberAccent
                                    : Colors.black),
                      )),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text('${count ?? '*'}',
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
  SyncPairItemModel(this.title, {this.count, this.isTitle = false});

  final String title;
  final num? count;
  final bool isTitle;
}
