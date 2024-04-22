import 'package:cmo/enum/enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/action_log/close/close_action_log.dart';
import 'package:cmo/ui/screens/perform/action_log/detail/action_log_detail.dart';
import 'package:cmo/ui/screens/perform/action_log/widgets/action_log_item.dart';
import 'package:cmo/ui/screens/perform/action_log/widgets/action_log_status_filter.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionLogManagement extends BaseStatefulWidget {
  const ActionLogManagement() : super(screenName: 'ActionLogManagement');

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => ActionLogManagementCubit(),
            child: const ActionLogManagement(),
          );
        },
      ),
    );
  }

  @override
  _ActionLogManagementState createState() => _ActionLogManagementState();
}

class _ActionLogManagementState extends BaseStatefulWidgetState<ActionLogManagement> {

  late ActionLogManagementCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ActionLogManagementCubit>();
  }

  Future<void> onNavigateToDetail({
    ActionLog? actionLog,
  }) async {
    await ActionLogDetail.push(
      context,
      actionLog: actionLog,
    );
    await cubit.refresh();
  }

  Future<void> onClose(ActionLog actionLog) async {
    await CloseActionLog.push(context, actionLog: actionLog);
    await cubit.refresh();
  }

  @override
  Widget buildContent(BuildContext context) {
    return BlocBuilder<ActionLogManagementCubit, ActionLogManagementState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.action_log.tr(),
            subtitle: state.activeRMU?.regionalManagerUnitName,
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: state.activeUserRole == UserRoleEnum.farmerMember
                ? null
                : Assets.icons.icUpdatedAddButton.svgBlack,
            onTapTrailing: onNavigateToDetail,
          ),
          body: Column(
            children: [
              const ActionLogStatusFilter(),
              const SizedBox(height: 12),
              BlocSelector<ActionLogManagementCubit, ActionLogManagementState, ActionLogStatusFilterEnum>(
                selector: (state) => state.statusFilter,
                builder: (context, statusFilter) {
                  if (statusFilter == ActionLogStatusFilterEnum.upcoming) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                    child: CmoTextField(
                      name: LocaleKeys.search.tr(),
                      prefixIcon: Assets.icons.icSearch.svg(),
                      hintText: LocaleKeys.search.tr(),
                      onChanged: cubit.onSearchTextChanged,
                    ),
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<ActionLogManagementCubit, ActionLogManagementState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.displayList.length,
                      itemBuilder: (context, index) {
                        final disableClose = (state.displayList[index].isClosed ?? false) || (state.activeUserRole?.isFarmerMember ?? false);
                        return InkWell(
                          onTap: () => onNavigateToDetail(
                              actionLog: state.displayList[index]),
                          child: ActionLogItem(
                            actionLog: state.displayList[index],
                            mapData: generateInformationMapData(
                              state.displayList[index],
                            ),
                            onClose: disableClose
                                ? null
                                : () async {
                                    await onClose(state.displayList[index]);
                                  },
                          ),
                        );
                      },
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

  Map<String, String?> generateInformationMapData(ActionLog actionLog) {
    return {
      LocaleKeys.farm.tr(): '',
      LocaleKeys.action_name.tr(): actionLog.actionName,
      LocaleKeys.nc_reason.tr(): actionLog.rejectReasonName,
      LocaleKeys.raised_by.tr(): actionLog.raisedByName,
      LocaleKeys.due_date.tr(): convertDateTimeToLunarString(actionLog.dueDate),
    };
  }
}
