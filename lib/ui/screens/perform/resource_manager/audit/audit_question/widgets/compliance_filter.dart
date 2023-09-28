import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplianceFilter extends StatelessWidget {
  const ComplianceFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
      builder: (context, state) {
        return CmoDropdown<Compliance?>(
          name: 'compliance',
          hintText: LocaleKeys.all_compliances.tr(),
          onChanged: (Compliance? compliance) {
            context.read<AuditListQuestionsCubit>().setComplianceFilter(compliance);
          },
          itemsData: state.compliances
              .map(
                (e) => CmoDropdownItem<Compliance>(
                  id: e,
                  name: e.complianceName ?? '',
                ),
              )
              .toList()
            ..insert(
              0,
              CmoDropdownItem<Compliance>(
                id: const Compliance(complianceId: -1),
                name: LocaleKeys.all_compliances.tr(),
              ),
            ),
        );
      },
    );
  }
}
