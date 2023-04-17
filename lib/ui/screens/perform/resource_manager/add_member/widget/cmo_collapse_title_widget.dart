import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CmoCollapseTitle extends StatefulWidget {
  const CmoCollapseTitle({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  State<CmoCollapseTitle> createState() => _CmoCollapseTitleState();
}

class _CmoCollapseTitleState extends State<CmoCollapseTitle> {
  bool isCollapse = true;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (value) {
        isCollapse = !isCollapse;
        if (mounted) setState(() {});
      },
      backgroundColor: context.colors.blueDark1,
      collapsedBackgroundColor: context.colors.blueDark1,
      trailing: Icon(
        isCollapse ? Icons.arrow_drop_down : Icons.arrow_drop_up,
        color: context.colors.white,
        size: 40,
      ),
      title: Text(widget.title,
          style: context.textStyles.titleBold
              .copyWith(color: context.colors.white, fontSize: 16)),
      children: [widget.child],
    );
  }
}
