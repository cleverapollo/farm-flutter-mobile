import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/widget/cmo_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncompleteFilter extends StatelessWidget {
  const IncompleteFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
        builder: (context, state) {
          final incompleteFilter = state.incompleteFilter == 1;
          return CmoSwitch(
            title: LocaleKeys.show_incomplete_questions.tr(),
            value: incompleteFilter,
            onChanged: (value) {
              context
                  .read<AuditListQuestionsCubit>()
                  .setIncompleteFilter(incompleteFilter ? 0 : 1);
            },
          );
        },
      ),
    );
  }
}
