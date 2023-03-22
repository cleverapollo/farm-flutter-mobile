import 'package:flutter/material.dart';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';

class CmoCard extends StatelessWidget {
  const CmoCard({
    super.key,
    this.content = const [],
  });

  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.blueDark1,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: context.colors.shadow,
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 76),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: content,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Assets.icons.icArrowRight.svgWhite,
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

class CmoCardHeader extends StatelessWidget {
  const CmoCardHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textStyles.bodyBold.white,
    );
  }
}

class CmoCardItem extends StatelessWidget {
  const CmoCardItem({super.key, required this.title, required this.value});

  final String title;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: context.textStyles.bodyNormal.white,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: context.textStyles.bodyNormal.white,
          ),
        ),
      ],
    );
  }
}

class CmoCardItemHighlighted extends StatelessWidget {
  const CmoCardItemHighlighted({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;

  final String value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.minWidth / 2),
              child: Padding(
                padding: const EdgeInsets.only(right: 19),
                child: Text(
                  title,
                  style: context.textStyles.bodyNormal
                      .copyWith(color: context.colors.yellow),
                ),
              ),
            ),
            Text(
              value,
              style: context.textStyles.bodyNormal
                  .copyWith(color: context.colors.yellow),
            ),
          ],
        );
      },
    );
  }
}
