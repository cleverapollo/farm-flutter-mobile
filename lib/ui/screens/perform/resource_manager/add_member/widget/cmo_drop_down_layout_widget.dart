import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CmoDropDownLayoutWidget extends StatelessWidget {
  const CmoDropDownLayoutWidget({
    super.key,
    this.label = '',
    required this.title,
    this.subTitle = '',
    this.showTick = false,
    this.onTap,
    this.trailingWidget,
  });

  final String label;
  final String title;
  final String subTitle;
  final bool showTick;
  final Function? onTap;
  final Widget? trailingWidget;

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
                border: Border.all(width: 1, color: context.colors.grey),
                borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.textStyles.titleBold.copyWith(fontSize: 16),
                ),
                const Spacer(),
                if (subTitle.isNotEmpty)
                  Text(
                    subTitle,
                    style: context.textStyles.bodyNormal.copyWith(fontSize: 16),
                  )
                else
                  const SizedBox(),
                const Spacer(),
                if (showTick) Assets.icons.icTick.widget else const SizedBox(),
                if (trailingWidget != null)
                  trailingWidget!
                else
                  const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
