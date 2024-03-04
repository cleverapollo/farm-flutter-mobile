import 'dart:async';

import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/add_audit/audit_add_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_questions_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/dismissible_audit_item.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/status_button.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditManagementScreen extends BaseStatefulWidget {
  AuditManagementScreen({super.key})
      : super(screenName: LocaleKeys.audits.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AuditManagementScreen(),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _AuditManagementScreenState();
}

class _AuditManagementScreenState extends BaseStatefulWidgetState<AuditManagementScreen> {

  @override
  void initState() {
    super.initState();
    context.read<AuditListCubit>().refresh();
  }

  Timer? _debounceInputTimer;

  @override
  Widget buildContent(BuildContext context) {
    return BlocSelector<AuditListCubit, AuditListState, ResourceManagerUnit?>(
      selector: (state) => state.resourceManagerUnit,
      builder: (context, resourceManagerUnit) {
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.audits.tr(),
            subtitle:
                '${LocaleKeys.rmu_name.tr()}: ${resourceManagerUnit?.regionalManagerUnitName}',
            subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icUpdatedAddButton.svgBlack,
            onTapTrailing: () => AuditAddScreen.push(
              context,
              AuditComeFromEnum.dashboard,
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
                child: CmoTextField(
                  name: LocaleKeys.search.tr(),
                  hintText: LocaleKeys.search.tr(),
                  suffixIcon: Assets.icons.icSearch.svg(),
                  onChanged: (input) {
                    _debounceInputTimer?.cancel();
                    _debounceInputTimer = Timer(
                      const Duration(milliseconds: 200),
                      () => context.read<AuditListCubit>().searching(input),
                    );
                  },
                ),
              ),
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
                          onTap: () =>
                              context.read<AuditListCubit>().changeIndexTab(0),
                          isDisable: indexTab != 0,
                          title: LocaleKeys.incomplete.tr(),
                        ),
                        StatusButton(
                          onTap: () =>
                              context.read<AuditListCubit>().changeIndexTab(1),
                          isDisable: indexTab != 1,
                          title: LocaleKeys.completed.tr(),
                        ),
                        StatusButton(
                          onTap: () =>
                              context.read<AuditListCubit>().changeIndexTab(2),
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
                child: BlocBuilder<AuditListCubit, AuditListState>(
                  builder: (context, state) {
                    if (state.loading) {
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: context.colors.white,
                        ),
                      );
                    }

                    if (state.error != null) {
                      return Center(
                        child: Text(
                          '${state.error}',
                        ),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () {
                        return context.read<AuditListCubit>().refresh();
                      },
                      child: ListView.builder(
                        itemCount: state.filterAudits.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (BuildContext context, int index) {
                          final item = state.filterAudits[index];
                          return DismissibleAuditItem(
                            audit: item,
                            createdDate: convertDateTimeToLunar(DateTime.tryParse(item.created ?? '')),
                            onTapAudit: () => onTapAudit(context, item),
                            onRemove: () async {
                              await context.read<AuditListCubit>().removeAudit(
                                item,
                                callback: () =>
                                    context.read<DashboardCubit>().refresh(),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> onTapAudit(BuildContext context, Audit audit) async {
    await AuditListQuestionsScreen.push(
      context,
      audit,
      AuditComeFromEnum.dashboard,
    );
  }
}
