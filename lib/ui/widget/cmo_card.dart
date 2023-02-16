import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CmoCard extends StatelessWidget {
  const CmoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 76),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.blueDark2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Member/s',
                      style: context.textStyles.bodyBold
                          .copyWith(color: context.colors.white),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Onboarded',
                            style: context.textStyles.bodyNormal
                                .copyWith(color: context.colors.white),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '5/10',
                            style: context.textStyles.bodyNormal
                                .copyWith(color: context.colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Incomplete',
                            style: context.textStyles.bodyNormal
                                .copyWith(color: context.colors.white),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '8/10',
                            style: context.textStyles.bodyNormal
                                .copyWith(color: context.colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Assets.icons.icArrowRight.svg(
                colorFilter:
                    ColorFilter.mode(context.colors.white, BlendMode.srcIn)),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
