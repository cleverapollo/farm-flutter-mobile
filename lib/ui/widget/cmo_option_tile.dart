import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CmoOptionTile extends StatelessWidget {
  const CmoOptionTile({
    super.key,
    required this.title,
    this.value,
    this.height = 45,
    this.shouldAddPadding = true,
    this.shouldShowArrow = true,
    this.shouldShowDivider = true,
    this.useFittedBox = true,
  });

  final String title;

  final String? value;

  final double? height;

  final bool shouldAddPadding;

  final bool shouldShowArrow;

  final bool shouldShowDivider;

  final bool useFittedBox;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                child: shouldShowArrow ? Assets.icons.icArrowRight.svg() : null,
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
