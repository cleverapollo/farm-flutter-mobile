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
      letters: 'C',
      color: (isSelect ?? false) ? const Color(0xff04C504) : Colors.white,
      textColor: (isSelect ?? false) ? Colors.white : Colors.black,
    );
  }
  factory CmoChipAnswerWidget.nc(
      {bool? isSelect = false, void Function()? onTap}) {
    return CmoChipAnswerWidget._(
      onTap: onTap,
      letters: 'NC',
      color: (isSelect ?? false) ? const Color(0xff04C504) : Colors.white,
      textColor: (isSelect ?? false) ? Colors.white : Colors.black,
    );
  }
  factory CmoChipAnswerWidget.yes(
      {bool? isSelect = false, void Function()? onTap}) {
    return CmoChipAnswerWidget._(
      onTap: onTap,
      letters: 'Yes',
      color: (isSelect ?? false) ? const Color(0xff2072B9) : Colors.white,
      textColor: (isSelect ?? false) ? Colors.white : Colors.black,
    );
  }

  factory CmoChipAnswerWidget.no(
      {bool? isSelect = false, void Function()? onTap}) {
    return CmoChipAnswerWidget._(
      onTap: onTap,
      letters: 'No',
      color: (isSelect ?? false) ? const Color(0xff2072B9) : Colors.white,
      textColor: (isSelect ?? false) ? Colors.white : Colors.black,
    );
  }

  factory CmoChipAnswerWidget.primary(
      {bool? isSelect = false, void Function()? onTap}) {
    return CmoChipAnswerWidget._(
      onTap: onTap,
      letters: 'Primary',
      isCircle: false,
      color: (isSelect ?? false) ? const Color(0xff2072B9) : Colors.white,
      textColor: (isSelect ?? false) ? Colors.white : Colors.black,
    );
  }

  factory CmoChipAnswerWidget.secondary(
      {bool? isSelect = false, void Function()? onTap}) {
    return CmoChipAnswerWidget._(
      onTap: onTap,
      letters: 'Secondary',
      isCircle: false,
      color: (isSelect ?? false) ? const Color(0xff2072B9) : Colors.white,
      textColor: (isSelect ?? false) ? Colors.white : Colors.black,
    );
  }

  factory CmoChipAnswerWidget.na(
      {bool? isSelect = false, void Function()? onTap}) {
    return CmoChipAnswerWidget._(
      onTap: onTap,
      letters: 'N/A',
      isCircle: false,
      color: (isSelect ?? false) ? const Color(0xff2072B9) : Colors.white,
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
