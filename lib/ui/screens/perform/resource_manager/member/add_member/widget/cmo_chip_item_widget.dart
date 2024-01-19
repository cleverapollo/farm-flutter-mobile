import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CmoYesNoQuestion extends StatefulWidget {
  const CmoYesNoQuestion({
    super.key,
    this.onTap,
    this.initialValue,
    this.alignCenter = false,
    this.textStyle,
  });

  final bool? initialValue;
  final Function(bool)? onTap;
  final bool alignCenter;
  final TextStyle? textStyle;

  @override
  State<CmoYesNoQuestion> createState() => _CmoYesNoQuestionState();
}

class _CmoYesNoQuestionState extends State<CmoYesNoQuestion> {
  final isSelect = ValueNotifier<bool?>(null);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isSelect.value = widget.initialValue;
    return ValueListenableBuilder(
      valueListenable: isSelect,
      builder: (_, value, __) {
        return Row(
          mainAxisAlignment: widget.alignCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                isSelect.value = true;
                widget.onTap?.call(true);
              },
              child: Container(
                alignment: Alignment.center,
                width: 110,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: buildColor(value, true),
                  border: Border.all(
                    width: 2,
                    color: (value ?? false) ? Colors.transparent : context.colors.blueDark2,
                  ),
                ),
                child: Text(
                  LocaleKeys.yes.tr(),
                  style: (widget.textStyle ?? context.textStyles.bodyNormal)
                      .copyWith(
                    color: (value ?? false) ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            InkWell(
              onTap: () {
                isSelect.value = false;
                widget.onTap?.call(false);
              },
              child: Container(
                alignment: Alignment.center,
                width: 110,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: buildColor(value, false),
                  border: Border.all(
                    width: 2,
                    color: (value ?? true) ? context.colors.blueDark2 : Colors.transparent,
                  ),
                ),
                child: Text(
                  LocaleKeys.no.tr(),
                  style: (widget.textStyle ?? context.textStyles.bodyNormal)
                      .copyWith(
                    color: !(value ?? true) ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Color buildColor(bool? isSelect, bool isC) {
    if (isC) {
      if (isSelect == null) {
        return Colors.white;
      }
      if (isSelect) {
        return const Color(0xff2072B9);
      }
      return Colors.white;
    }

    if (isSelect == null) {
      return Colors.white;
    }
    if (isSelect) {
      return Colors.white;
    }
    return const Color(0xff2072B9);
  }
}

