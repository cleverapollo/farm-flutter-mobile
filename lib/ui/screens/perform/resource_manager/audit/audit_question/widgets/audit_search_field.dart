import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditSearchField extends StatelessWidget {
  AuditSearchField({
    super.key,
    this.debounceInputTimer,
  });

  Timer? debounceInputTimer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CmoTextField(
            name: LocaleKeys.search.tr(),
            hintText: LocaleKeys.search.tr(),
            prefixIcon: Assets.icons.icSearchOutline.svg(),
            onChanged: (input) {
              debounceInputTimer?.cancel();
              debounceInputTimer = Timer(
                const Duration(milliseconds: 300),
                () => context.read<AuditListQuestionsCubit>().searching(input),
              );
            },
          ),
        );
      },
    );
  }
}
