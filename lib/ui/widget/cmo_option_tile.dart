import 'package:flutter/material.dart';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';

enum ArrowDirection {
  left,
  right,
  up,
  down,
}

class CmoOptionTile extends StatelessWidget {
  const CmoOptionTile({
    super.key,
    required this.title,
    this.value,
    this.height = 45,
    this.shouldAddPadding = true,
    this.shouldShowArrow = true,
    this.shouldShowDivider = true,
    this.shouldShowDividerTop = false,
    this.useFittedBox = true,
    this.arrowDirection = ArrowDirection.right,
  });

  final String title;

  final String? value;

  final double? height;

  final bool shouldAddPadding;

  final bool shouldShowArrow;

  final bool shouldShowDivider;

  final bool shouldShowDividerTop;

  final bool useFittedBox;

  final ArrowDirection arrowDirection;

  @override
  Widget build(BuildContext context) {
    Widget arrow = Assets.icons.icArrowRight.svg();

    if (arrowDirection == ArrowDirection.left) {
      arrow = RotatedBox(
        quarterTurns: 2,
        child: Assets.icons.icArrowRight.svg(),
      );
    }
    if (arrowDirection == ArrowDirection.up) {
      arrow = RotatedBox(
        quarterTurns: 3,
        child: Assets.icons.icArrowRight.svg(),
      );
    }
    if (arrowDirection == ArrowDirection.down) {
      arrow = RotatedBox(
        quarterTurns: 1,
        child: Assets.icons.icArrowRight.svg(),
      );
    }

    return Column(
      children: [
        if (shouldShowDivider && shouldShowDividerTop)
          Divider(
            height: 1,
            thickness: 1,
            indent: 24,
            endIndent: 24,
            color: context.colors.grey,
          ),
        SizedBox(
          height: height,
          child: Row(
            children: [
              if (shouldAddPadding) const SizedBox(width: 24),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: context.textStyles.bodyBold,
                ),
              ),
              if (value != null)
                Expanded(
                  child: useFittedBox
                      ? FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            value ?? '',
                            style: context.textStyles.bodyNormal,
                          ),
                        )
                      : Text(
                          value ?? '',
                          style: context.textStyles.bodyNormal,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
              SizedBox(
                width: 20,
                child: shouldShowArrow ? arrow : null,
              ),
              if (shouldAddPadding) const SizedBox(width: 24),
            ],
          ),
        ),
        if (shouldShowDivider)
          Divider(
            height: 1,
            thickness: 1,
            indent: shouldAddPadding ? 24 : 0,
            endIndent: shouldAddPadding ? 24 : 0,
            color: context.colors.grey,
          ),
      ],
    );
  }
}
