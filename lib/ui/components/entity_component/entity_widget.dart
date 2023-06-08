import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class EntityWidget extends StatelessWidget {
  const EntityWidget(this.text, {required this.onTap, super.key});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: context.textStyles.bodyBold
                      .copyWith(color: context.colors.black),
                ),
                Assets.icons.icArrowRight.svgBlack
              ],
            ),
          ],
        ),
      ),
    );
  }
}
