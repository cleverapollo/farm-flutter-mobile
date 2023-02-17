import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CmoOptionTile extends StatelessWidget {
  const CmoOptionTile({
    super.key,
    required this.title,
    this.value,
    this.shouldShowArrow = true,
  });

  final String title;

  final String? value;

  final bool shouldShowArrow;

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
                child: Text(
                  title,
                  style: context.textStyles.bodyBold,
                ),
              ),
              if (value != null)
                Expanded(
                  child: Text(
                    value!,
                    style: context.textStyles.bodyNormal,
                  ),
                ),
              if (shouldShowArrow) Assets.icons.icArrowRight.svg(),
              if (shouldShowArrow) const SizedBox(width: 24),
            ],
          ),
        ),
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
