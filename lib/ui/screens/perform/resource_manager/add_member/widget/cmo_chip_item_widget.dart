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
    isSelect.value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
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
                  color: buildColor(value, true),
                  border: Border.all(width: 2),
                ),
                child: Text('Yes',
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
                  color: buildColor(value, false),
                  border: Border.all(width: 2),
                ),
                child: Text('No',
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
  final isSelect = ValueNotifier<int?>(null);

  @override
  void initState() {
    super.initState();
    isSelect.value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isSelect,
      builder: (_, value, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                isSelect.value = 1;
                widget.onTap?.call(1);
              },
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                    color: buildColor(isSelect.value, 1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: context.colors.grey)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text('Primary',
                    style: context.textStyles.bodyNormal.copyWith(
                      color: buildTextColor(isSelect.value, 1),
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                isSelect.value = 2;
                widget.onTap?.call(2);
              },
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                    color: buildColor(isSelect.value, 2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: context.colors.grey)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text('Secondary',
                    style: context.textStyles.bodyNormal.copyWith(
                      color: buildTextColor(isSelect.value, 2),
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                isSelect.value = 3;
                widget.onTap?.call(3);
              },
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                    color: buildColor(isSelect.value, 3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: context.colors.grey)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text('N/A',
                    style: context.textStyles.bodyNormal.copyWith(
                      color: buildTextColor(isSelect.value, 3),
                    )),
              ),
            ),
          ],
        );
      },
    );
  }

  Color buildColor(int? index, int questionNo) {
    if (index == null) {
      return Colors.white;
    }
    if (index == questionNo) {
      return const Color(0xff2072B9);
    }

    return Colors.white;
  }

  Color buildTextColor(int? index, int questionNo) {
    if (index == null) {
      return Colors.black;
    }
    if (index == questionNo) {
      return Colors.white;
    }
    return Colors.black;
  }
}
