import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PrincipleFilter extends StatelessWidget {
  const PrincipleFilter({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    const name = 'principle';

    return BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, List<Principle>>(
      selector: (state) {
        return state.principles;
      },
      builder: (context, principles) {
        return CmoDropdown(
          name: name,
          hintText: LocaleKeys.principle.tr(),
          onChanged: (int? id) {
            if (id == -1) {
              formKey.currentState!.fields[name]?.reset();
            }

            context.read<AuditListQuestionsCubit>().setPrincipleFilter(id);
          },
          itemsData: principles
              .map(
                (e) => CmoDropdownItem(
                  id: e.principleId,
                  name: e.principleName ?? '',
                ),
              )
              .toList()
            ..insert(
              0,
              CmoDropdownItem(
                id: -1,
                name: LocaleKeys.principle.tr(),
              ),
            ),
        );
      },
    );
  }
}
