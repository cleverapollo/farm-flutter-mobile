import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CmoTitleCollapseWidget extends StatelessWidget {
  const CmoTitleCollapseWidget(
      {super.key, required this.title, this.showTick = false});

  final String title;
  final bool showTick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      color: context.colors.blueDark1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(title,
                  style: context.textStyles.titleBold
                      .copyWith(color: context.colors.white, fontSize: 16))),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: showTick,
                child: Assets.icons.icTick.widget,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: context.colors.white,
                size: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
