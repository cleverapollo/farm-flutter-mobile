import 'package:flutter/material.dart';

import 'package:cmo/ui/theme/theme.dart';

class CmoHeaderTile extends StatelessWidget {
  CmoHeaderTile({
    super.key,
    required this.title,
    this.child,
    this.backgroundColor,
  });

  final String title;
  final Widget? child;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? context.colors.blueDark1,
      child: SizedBox(
        height: 35,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 16, 0),
            child: Row(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: context.textStyles.bodyBold.white,
                  ),
                ),
                if (child != null) Expanded(child: child!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
