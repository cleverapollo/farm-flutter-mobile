import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';

class CmoSwitch extends StatelessWidget {
  const CmoSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.title = '',
    this.displaySwitchAsPrefix = false,
    this.padding,
    this.textStyle,
    this.spaceBetween,
  });

  final String title;

  final void Function(bool)? onChanged;

  final bool value;

  final bool displaySwitchAsPrefix;

  final EdgeInsets? padding;

  final TextStyle? textStyle;

  final double? spaceBetween;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final titleWidget = Expanded(
      child: Text(
        title,
        style: textStyle ?? context.textStyles.bodyBold.blueDark2,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
    final switchWidget = CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: context.colors.blue71B8,
      thumbColor: context.colors.blueDark2,
      trackColor: context.colors.grey,
    );
    if (displaySwitchAsPrefix) {
      children.addAll([
        switchWidget,
        titleWidget,
      ]);
    } else {
      children.addAll([
        titleWidget,
        switchWidget,
      ]);
    }

    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
      child: Row(
        children: children.withSpaceBetween(width: spaceBetween),
      ),
    );
  }
}
