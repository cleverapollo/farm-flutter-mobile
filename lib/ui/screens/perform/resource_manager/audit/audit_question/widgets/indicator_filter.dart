import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IndicatorFilter extends StatelessWidget {
  const IndicatorFilter({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    const name = 'indicator';

    return BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, List<Indicator>>(
      selector: (state) {
        return state.indicators;
      },
      builder: (context, indicators) {
        return CmoDropdown(
          name: name,
          hintText: LocaleKeys.indicators.tr(),
          onChanged: (int? id) {
            if (id == -1) {
              formKey.currentState!.fields[name]?.reset();
            }
            context.read<AuditListQuestionsCubit>().setIndicatorFilter(id);
          },
          itemsData: indicators
              .map(
                (e) => CmoDropdownItem(
                  id: e.indicatorId,
                  name: e.indicatorName ?? '',
                ),
              )
              .toList()
            ..insert(
              0,
              CmoDropdownItem(
                id: -1,
                name: LocaleKeys.indicators.tr(),
              ),
            ),
        );
      },
    );
  }
}
