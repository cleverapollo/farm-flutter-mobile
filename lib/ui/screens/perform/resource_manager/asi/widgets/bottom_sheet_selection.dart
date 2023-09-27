import 'package:cmo/extensions/string.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class BottomSheetSelection extends StatelessWidget {
  final VoidCallback onTap;
  final String? value;
  final String hintText;
  final Widget? rightIconData;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool displayHorizontal;

  const BottomSheetSelection({
    required this.onTap,
    required this.hintText,
    this.value,
    this.rightIconData,
    this.padding,
    this.margin,
    this.displayHorizontal = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (displayHorizontal) {
      child = Row(
        children: [
          Expanded(
            child: Text(
              hintText,
              maxLines: 3,
              style: context.textStyles.bodyBold.blueDark2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Text(
              value ?? '',
              maxLines: 3,
              style: context.textStyles.bodyNormal.blueDark2,
              textAlign: TextAlign.center,
            ),
          ),
          rightIconData ??
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: context.colors.black,
                size: 32,
              ),
        ],
      );
    } else {
      child = Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hintText,
                  maxLines: 3,
                  style: context.textStyles.bodyBold.blueDark2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (value.isNotBlank)
                  Text(
                    value!,
                    maxLines: 3,
                    style: context.textStyles.bodyNormal.blueDark2,
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
          rightIconData ??
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: context.colors.black,
                size: 32,
              ),
        ],
      );
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: context.colors.grey),
          ),
        ),
        child: child,
      ),
    );
  }
}
