import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CmoCard extends StatelessWidget {
  const CmoCard({
    super.key,
    this.content = const [],
    this.shouldShowArrowRight = true,
    this.margin = EdgeInsets.zero,
    this.padding,
    this.trailing,
    this.containerGradient,
    this.onTap,
    this.backgroundColor,
    this.childAlignment,
  });

  final List<Widget> content;
  final bool shouldShowArrowRight;
  final EdgeInsetsGeometry margin;
  final EdgeInsets? padding;
  final Widget? trailing;
  final Gradient? containerGradient;
  final void Function()? onTap;
  final Color? backgroundColor;
  final MainAxisAlignment? childAlignment;

  @override
  Widget build(BuildContext context) {
    final background = backgroundColor ?? context.colors.blueDark1;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: containerGradient,
            color: containerGradient == null ? background : null,
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
                    padding: padding ?? const EdgeInsets.fromLTRB(6, 0, 0, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment:
                          childAlignment ?? MainAxisAlignment.start,
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
    this.valueEnd = '',
    this.maxLines = 1,
    this.textStyle,
  });

  final String title;
  final String value;
  final String valueEnd;
  final int maxLines;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: textStyle ?? context.textStyles.bodyBold.white,
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
          ),
        if (valueEnd.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Text(
              valueEnd,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodyBold.white,
            ),
          )
      ],
    );
  }
}

class CmoCardItem extends StatelessWidget {
  const CmoCardItem(
      {super.key,
      required this.title,
      this.value,
      this.ratioTitleSpace = 1,
      this.isLoading = false});

  final String title;

  final String? value;

  final int ratioTitleSpace;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: ratioTitleSpace,
          child: Text(
            title,
            style: context.textStyles.bodyNormal.white,
          ),
        ),
        if (value != null && value!.isNotEmpty)
          Expanded(
            child: isLoading
                ? const SizedBox.shrink()
                : Text(
                    value ?? '',
                    style: context.textStyles.bodyNormal.white,
                  ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}

class CmoCardItemWithIcon extends StatelessWidget {
  const CmoCardItemWithIcon({
    super.key,
    this.title,
    required this.icon,
    this.textStyle,
    this.iconColor,
  });

  final String? title;
  final TextStyle? textStyle;
  final Color? iconColor;
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
                  colorFilter: ColorFilter.mode(
                    iconColor ?? context.colors.white,
                    BlendMode.srcIn,
                  ),
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
                style: textStyle ?? context.textStyles.bodyNormal.white,
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
