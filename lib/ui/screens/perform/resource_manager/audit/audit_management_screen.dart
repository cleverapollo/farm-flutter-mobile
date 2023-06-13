import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/audit_list_cubit/audit_list_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/add_audit/audit_add_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_questions_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/audit_list_incomplete.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/audit_list_synced.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/status_button.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/audit_list_completed.dart';

class AuditManagementScreen extends StatelessWidget {
  const AuditManagementScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AuditManagementScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.audits.tr(),
        subtitle: '${LocaleKeys.rmu_name.tr()}: Border Timbers',
        subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => AuditAddScreen.push(context),
      ),
      body: Column(
        children: [
          Row(),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: BlocSelector<AuditListCubit, AuditListState, int>(
              selector: (state) {
                return state.indexTab;
              },
              builder: (context, indexTab) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StatusButton(
                      onTap: () => context.read<AuditListCubit>().changeIndexTab(0),
                      isDisable: indexTab != 0,
                      title: LocaleKeys.incomplete.tr(),
                    ),
                    StatusButton(
                      onTap: () => context.read<AuditListCubit>().changeIndexTab(1),
                      isDisable: indexTab != 1,
                      title: LocaleKeys.completed.tr(),
                    ),
                    StatusButton(
                      onTap: () => context.read<AuditListCubit>().changeIndexTab(2),
                      isDisable: indexTab != 2,
                      title: LocaleKeys.synced.tr(),
                    ),
                  ].withSpaceBetween(width: 20),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocSelector<AuditListCubit, AuditListState, int>(
              selector: (state) {
                return state.indexTab;
              },
              builder: (context, indexTab) {
                switch (indexTab) {
                  case 0:
                    return AuditListIncomplete(
                      onTap: (audit) => onTapAudit(context, audit),
                    );
                  case 1:
                    return AuditListCompleted(
                      onTap: (audit) => onTapAudit(context, audit),
                    );
                  case 2:
                    return AuditListSynced(
                      onTap: (audit) => onTapAudit(context, audit),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onTapAudit(BuildContext context, Audit audit) async {
    final result = await AuditListQuestionsScreen.push(
      context,
      audit,
    );
    if (result != null && result && context.mounted) {
      await context.read<AuditListCubit>().refresh();
    }
  }
}
