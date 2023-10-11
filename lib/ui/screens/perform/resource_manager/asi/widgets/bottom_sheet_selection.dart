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
  final TextStyle? hintTextStyle;
  final bool isRequiredField;

  const BottomSheetSelection({
    required this.onTap,
    required this.hintText,
    this.value,
    this.rightIconData,
    this.padding,
    this.margin,
    this.hintTextStyle,
    this.displayHorizontal = true,
    this.isRequiredField = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (displayHorizontal) {
      child = Row(
        children: [
          buildTitleWidget(context),
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
                buildTitleWidget(context),
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

  Widget buildTitleWidget(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      text: TextSpan(
        children: <TextSpan>[
          if (isRequiredField)
            TextSpan(
            text: '*',
            style: context.textStyles.bodyNormal.red,
          ),
          TextSpan(
            text: hintText,
            style: hintTextStyle ?? context.textStyles.bodyBold.blueDark2,
          ),
        ],
      ),
    );
  }
}
