import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class KeyValueItemWidget extends StatelessWidget {
  const KeyValueItemWidget({
    super.key,
    required this.keyLabel,
    this.valueLabel,
    this.backgroundColor,
  });

  final String keyLabel;
  final String? valueLabel;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            keyLabel,
            style: context.textStyles.bodyNormal.black,
          ),
          Expanded(
            child: Text(
              valueLabel ?? '',
              maxLines: 1,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodyNormal.black,
            ),
          ),
        ],
      ),
    );
  }
}
