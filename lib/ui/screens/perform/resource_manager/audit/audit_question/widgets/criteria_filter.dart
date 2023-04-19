import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CriteriaFilter extends StatelessWidget {
  const CriteriaFilter({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    const name = 'criteria';

    return BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, List<Criteria>>(
      selector: (state) {
        return state.criterias;
      },
      builder: (context, criterias) {
        return CmoDropdown(
          name: name,
          hintText: LocaleKeys.criteria.tr(),
          onChanged: (int? id) {
            if (id == -1) {
              formKey.currentState!.fields[name]?.reset();
            }
            context.read<AuditListQuestionsCubit>().setCriteriaFilter(id);
          },
          itemsData: criterias
              .map(
                (e) => CmoDropdownItem(
                  id: e.criteriaId,
                  name: e.criteriaName ?? '',
                ),
              )
              .toList()
            ..insert(
              0,
              CmoDropdownItem(
                id: -1,
                name: LocaleKeys.criteria.tr(),
              ),
            ),
        );
      },
    );
  }
}
