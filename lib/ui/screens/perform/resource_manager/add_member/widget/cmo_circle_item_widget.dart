import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CmoChipAnswerWidget extends StatelessWidget {
  const CmoChipAnswerWidget._({
    super.key,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.hasBorder = false,
    required this.letters,
    this.size = const Size(70, 70),
    this.onTap,
    this.isCircle = true,
  });

  factory CmoChipAnswerWidget.c(
      {bool? isSelect = false, void Function()? onTap}) {
    return CmoChipAnswerWidget._(
      onTap: onTap,
      letters: LocaleKeys.letter_c.tr(),
      color: (isSelect ?? false) ? const Color(0xff04C504) : Colors.white,
      textColor: (isSelect ?? false) ? Colors.white : Colors.black,
    );
  }
  factory CmoChipAnswerWidget.nc(
      {bool? isSelect = false, void Function()? onTap}) {
    return CmoChipAnswerWidget._(
      onTap: onTap,
      letters: LocaleKeys.letter_nc.tr(),
      color: (isSelect ?? false) ? const Color(0xff04C504) : Colors.white,
      textColor: (isSelect ?? false) ? Colors.white : Colors.black,
    );
  }

  final Color color;
  final Color textColor;
  final bool hasBorder;
  final String letters;
  final Size size;
  final void Function()? onTap;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return isCircle
        ? InkWell(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(width: 2),
              ),
              child: Text(letters,
                  style:
                      context.textStyles.bodyNormal.copyWith(color: textColor)),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: context.colors.grey)),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(letters,
                  style:
                      context.textStyles.bodyNormal.copyWith(color: textColor)),
            ),
          );
    ;
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
  final isSelect = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    isSelect.value = widget.initialValue ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isSelect.value = !isSelect.value;
        widget.onTap?.call(isSelect.value);
      },
      child: ValueListenableBuilder(
        valueListenable: isSelect,
        builder: (_, value, __) {
          return Row(
            children: [
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? const Color(0xff2072B9) : Colors.white,
                  border: Border.all(width: 2),
                ),
                child: Text('Yes',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: value ? Colors.white : Colors.black)),
              ),
              const SizedBox(width: 12),
              Container(
                alignment: Alignment.center,
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: !value ? const Color(0xff2072B9) : Colors.white,
                  border: Border.all(width: 2),
                ),
                child: Text('No',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: !value ? Colors.white : Colors.black)),
              ),
              Spacer(),
            ],
          );
        },
      ),
    );
  }
}

class CmoMFOQuestion extends StatefulWidget {
  const CmoMFOQuestion({
    super.key,
    this.onTap,
    this.initialValue,
  });

  final int? initialValue;
  final Function(int)? onTap;

  @override
  State<CmoMFOQuestion> createState() => _CmoMFOQuestionState();
}

class _CmoMFOQuestionState extends State<CmoMFOQuestion> {
  final isSelect = ValueNotifier<int>(1);

  @override
  void initState() {
    super.initState();
    isSelect.value = widget.initialValue ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call(isSelect.value);
      },
      child: ValueListenableBuilder(
        valueListenable: isSelect,
        builder: (_, value, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  isSelect.value = 1;
                  widget.onTap?.call(isSelect.value);
                },
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                      color: isSelect.value == 1
                          ? const Color(0xff2072B9)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: context.colors.grey)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text('Primary',
                      style: context.textStyles.bodyNormal.copyWith(
                        color:
                            isSelect.value == 1 ? Colors.white : Colors.black,
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  isSelect.value = 2;
                  widget.onTap?.call(isSelect.value);
                },
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                      color: isSelect.value == 2
                          ? const Color(0xff2072B9)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: context.colors.grey)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text('Secondary',
                      style: context.textStyles.bodyNormal.copyWith(
                        color:
                            isSelect.value == 2 ? Colors.white : Colors.black,
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  isSelect.value = 3;
                  widget.onTap?.call(isSelect.value);
                },
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                      color: isSelect.value == 3
                          ? const Color(0xff2072B9)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: context.colors.grey)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text('N/A',
                      style: context.textStyles.bodyNormal.copyWith(
                        color:
                            isSelect.value == 3 ? Colors.white : Colors.black,
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
