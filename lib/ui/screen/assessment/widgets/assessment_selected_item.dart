import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AssessmentSelectedItem extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  final VoidCallback onTap;

  const AssessmentSelectedItem({
    required this.onTap,
    required this.title,
    required this.textEditingController,
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
                    TextFormField(
                      enabled: false,
                      minLines: 1,
                      maxLines: 5,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: title,
                        isCollapsed: true,
                        errorStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .error, // or any other color
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colors.grey,
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colors.grey,
                          ),
                        ),
                      ),
                      validator: requiredValidator,
                      autovalidateMode: AutovalidateMode.always,
                    ),
                  ],
                ),
              ),
              Assets.icons.icArrowRight.svgBlack,
            ],
          ),
        ],
      ),
    );
  }
}
