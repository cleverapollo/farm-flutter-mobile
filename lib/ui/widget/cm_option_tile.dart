import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CmoOptionTile extends StatelessWidget {
  const CmoOptionTile({
    super.key,
    required this.title,
    this.value,
    this.shouldShowArrow = true,
    this.shouldShowDivider = true,
  });

  final String title;

  final String? value;

  final bool shouldShowArrow;

  final bool shouldShowDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: Row(
            children: [
              const SizedBox(width: 24),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: context.textStyles.bodyBold,
                ),
              ),
              if (value != null)
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      value!,
                      style: context.textStyles.bodyNormal,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: SizedBox(
                  width: 20,
                  child:
                      shouldShowArrow ? Assets.icons.icArrowRight.svg() : null,
                ),
              ),
            ],
          ),
        ),
        if (shouldShowDivider)
          Divider(
            height: 1,
            thickness: 1,
            indent: 24,
            endIndent: 24,
            color: context.colors.grey,
          ),
      ],
    );
  }
}
