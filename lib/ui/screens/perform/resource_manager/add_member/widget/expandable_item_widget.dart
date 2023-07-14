import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class ExpandableItemWidget extends StatefulWidget {
  final String title;
  final Widget child;
  final bool? showTick;
  final bool isCollapse;
  final VoidCallback onTap;

  const ExpandableItemWidget({
    super.key,
    required this.title,
    required this.child,
    required this.onTap,
    this.isCollapse = false,
    this.showTick = false,
  });

  @override
  State<StatefulWidget> createState() => _ExpandableItemWidgetState();
}

class _ExpandableItemWidgetState extends State<ExpandableItemWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: widget.onTap,
          tileColor: context.colors.blueDark1,
          title: Text(
            widget.title,
            style: context.textStyles.titleBold.copyWith(
              color: context.colors.white,
              fontSize: 16,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showTick ?? false)
                Assets.icons.icTick.widget
              else
                const SizedBox(),
              Icon(
                widget.isCollapse ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: context.colors.white,
                size: 40,
              ),
            ],
          ),
        ),
        Visibility(
          visible: !widget.isCollapse,
          child: widget.child,
        ),
      ],
    );
  }
}