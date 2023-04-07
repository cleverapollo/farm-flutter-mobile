import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AssessmentSelectedItem extends StatelessWidget {
  final String title;
  final String? selectedValue;
  final VoidCallback onTap;

  const AssessmentSelectedItem({
    required this.onTap,
    required this.title,
    this.selectedValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textStyles.bodyBold,
                    ),
                    Text(
                      selectedValue ?? title,
                      style: selectedValue != null
                          ? context.textStyles.bodyNormal
                          : context.textStyles.bodyNormal
                              .copyWith(color: context.colors.grey),
                    ),
                    // const SizedBox(height: 4),
                  ],
                ),
              ),
              Assets.icons.icArrowRight.svgBlack,
            ],
          ),
          Divider(
            height: 1,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: context.colors.grey,
          ),
        ],
      ),
    );
  }
}
