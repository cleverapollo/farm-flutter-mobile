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
        return CmoCustomDropdown<Compliance?>(
          actionKey: 'compliance_filter',
          listItems: state.compliances
              .map(
                (item) => OptionItem<Compliance?>(
                  id: item,
                  title: item.complianceName ?? '',
                ),
              )
              .toList()
            ..insert(
              0,
              OptionItem<Compliance?>(
                id: const Compliance(complianceId: -1),
                title: LocaleKeys.compliance.tr(),
              ),
            ),
          hintText: LocaleKeys.compliance.tr(),
          itemSelected: state.selectedComplianceFilter == null || state.selectedComplianceFilter?.complianceId == -1
              ? null
              : OptionItem<Compliance?>(
                  id: state.selectedComplianceFilter,
                  title: state.selectedComplianceFilter!.complianceName ?? '',
                ),
          onSelected:
              context.read<AuditListQuestionsCubit>().setComplianceFilter,
        );
      },
    );
  }
}