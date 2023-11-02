import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CmoDropDownLayoutWidget extends StatelessWidget {
  const CmoDropDownLayoutWidget({
    super.key,
    this.label = '',
    required this.title,
    this.subTitle,
    this.showTick = false,
    this.onTap,
    this.trailingWidget,
    this.subTitleAlignment,
    this.subTitleTextStyle,
    this.isHideBorder = false,
  });

  final String label;
  final String title;
  final String? subTitle;
  final bool showTick;
  final Function? onTap;
  final Widget? trailingWidget;
  final Alignment? subTitleAlignment;
  final TextStyle? subTitleTextStyle;
  final bool isHideBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Text(label,
                style: context.textStyles.bodyNormal
                    .copyWith(color: context.colors.black, fontSize: 16))
          else
            const SizedBox(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
                color: context.colors.white,
                border: isHideBorder ? null : Border.all(width: 1, color: context.colors.grey),
                borderRadius: isHideBorder ? null : BorderRadius.circular(12)),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.textStyles.titleBold.copyWith(fontSize: 16),
                ),
                if (subTitle.isNotBlank)
                  Expanded(
                    child: Align(
                      alignment: subTitleAlignment ?? Alignment.centerLeft,
                      child: Text(
                        subTitle!,
                        style: subTitleTextStyle ?? context.textStyles.bodyNormal.copyWith(fontSize: 16),
                      ),
                    ),
                  )
                else
                  const Spacer(),
                if (showTick) Assets.icons.icTick.widget else const SizedBox(),
                if (trailingWidget != null)
                  trailingWidget!
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Assets.icons.icArrowRight.svgBlack,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
