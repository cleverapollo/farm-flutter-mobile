import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CmoCard extends StatelessWidget {
  const CmoCard({
    super.key,
    this.content = const [],
    this.shouldShowArrowRight = true,
    this.margin = const EdgeInsets.all(0),
    this.padding = EdgeInsets.zero,
    this.trailing,
    this.containerGradient,
    this.onTap,
  });

  final List<Widget> content;
  final bool shouldShowArrowRight;
  final EdgeInsetsGeometry margin;
  final EdgeInsets padding;
  final Widget? trailing;
  final Gradient? containerGradient;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: containerGradient,
            color: containerGradient == null ? context.colors.blueDark1 : null,
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
                    padding: const EdgeInsets.fromLTRB(6, 0, 0, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: content,
                    ),
                  ),
                ),
              ),
              if (shouldShowArrowRight) ...[
                const SizedBox(width: 12),
                trailing ?? Assets.icons.icArrowRight.svgWhite,
                const SizedBox(width: 6),
              ],
              const SizedBox(width: 6),
            ],
          ),
        ),
      ),
    );
  }
}

class CmoCardHeader extends StatelessWidget {
  const CmoCardHeader({
    super.key,
    required this.title,
    this.value = '',
    this.maxLines = 1,
  });

  final String title;
  final String value;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.bodyBold.white,
          ),
        ),
        if (value.isNotEmpty)
          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodyBold.white,
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}

class CmoCardItem extends StatelessWidget {
  const CmoCardItem({super.key, required this.title, this.value = ''});

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
        if (value.isNotEmpty)
          Expanded(
            child: Text(
              value,
              style: context.textStyles.bodyNormal.white,
            ),
          )
        else
          const SizedBox(),
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

class CmoCardItemWithIcon extends StatelessWidget {
  const CmoCardItemWithIcon({
    super.key,
    this.title,
    required this.icon,
  });

  final String? title;

  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: icon.svg(
                  width: 15,
                  height: 15,
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Text(
                title ?? '',
                textAlign: TextAlign.start,
                style: context.textStyles.bodyNormal.white,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }
}
