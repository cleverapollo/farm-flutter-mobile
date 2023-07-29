import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CmoSlimfQuestion extends StatefulWidget {
  const CmoSlimfQuestion({
    super.key,
    this.onTap,
    this.initialValue,
  });

  final bool? initialValue;
  final Function(bool?)? onTap;

  @override
  State<CmoSlimfQuestion> createState() => _CmoSlimfQuestionState();
}

class _CmoSlimfQuestionState extends State<CmoSlimfQuestion> {
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
          children: [
            const Spacer(),
            InkWell(
              onTap: () {
                isSelect.value = true;
                widget.onTap?.call(true);
              },
              child: Container(
                alignment: Alignment.center,
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: buildColor(context, value, true),
                  border: Border.all(width: 2),
                ),
                child: Text('C',
                    style: context.textStyles.bodyNormal.copyWith(
                        color: (value ?? false) ? Colors.white : Colors.black)),
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
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: buildColor(context, value, false),
                  border: Border.all(width: 2),
                ),
                child: Text('NC',
                    style: context.textStyles.bodyNormal.copyWith(
                        color: !(value ?? true) ? Colors.white : Colors.black)),
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }

  Color buildColor(BuildContext context, bool? isSelect, bool isC) {
    if (isC) {
      if (isSelect == null) {
        return Colors.white;
      }
      if (isSelect) {
        return context.colors.green;
      }
      return Colors.white;
    }

    if (isSelect == null) {
      return Colors.white;
    }
    if (isSelect) {
      return Colors.white;
    }

    return context.colors.yellow;
  }

  @override
  void dispose() {
    isSelect.dispose();
    super.dispose();
  }
}

class CmoYesNoQuestion extends StatefulWidget {
  const CmoYesNoQuestion({
    super.key,
    this.onTap,
    this.initialValue,
  });

  final bool? initialValue;
  final Function(bool)? onTap;

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
          children: [
            InkWell(
              onTap: () {
                isSelect.value = true;
                widget.onTap?.call(true);
              },
              child: Container(
                alignment: Alignment.center,
                width: 110,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: buildColor(value, true),
                  border: (value ?? false) ? null : Border.all(
                    width: 2,
                    color: context.colors.blueDark2,
                  ),
                ),
                child: Text('Yes',
                    style: context.textStyles.bodyBold.copyWith(
                        color: (value ?? false) ? Colors.white : Colors.black)),
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
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: buildColor(value, false),
                  border: (value ?? true) ? Border.all(
                    width: 2,
                    color: context.colors.blueDark2,
                  ) : null,
                ),
                child: Text('No',
                    style: context.textStyles.bodyBold.copyWith(
                        color: !(value ?? true) ? Colors.white : Colors.black)),
              ),
            ),
            const Spacer(),
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

