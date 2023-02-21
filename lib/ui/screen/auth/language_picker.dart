import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/settings_cubit.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagePicker extends StatefulWidget {
  const LanguagePicker({super.key, this.hidden = true, this.onPick});

  final bool hidden;

  final Function()? onPick;

  @override
  State<LanguagePicker> createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late final Animation<double> _heightValue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _heightValue = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(covariant LanguagePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.hidden == widget.hidden) return;

    if (widget.hidden) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Align(
            heightFactor: _heightValue.value,
            alignment: Alignment.topCenter,
            child: child,
          );
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: context.colors.grey, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 42),
              buildOption(locale: AppLocale.en),
              const SizedBox(height: 4),
              buildOption(locale: AppLocale.fr),
              const SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOption({required Locale locale}) {
    return CmoTappable(
      onTap: () {
        context.read<SettingsCubit>().changeLanguage(context, locale);
        widget.onPick?.call();
      },
      child: Text(
        LocaleKeys.locale.tr(gender: locale.languageCode),
        textAlign: TextAlign.center,
      ),
    );
  }
}
