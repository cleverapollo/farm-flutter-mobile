import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/custom_widgets/status_filter_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionLogStatusFilter extends StatelessWidget {
  const ActionLogStatusFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionLogManagementCubit, ActionLogManagementState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: context.colors.blueDark2,
                width: 2.0,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: StatusFilterItem(
                  onTap: () {
                    context
                        .read<ActionLogManagementCubit>()
                        .onFilterGroupChanged(ActionLogStatusFilterEnum.open);
                  },
                  isSelected: state.statusFilter == ActionLogStatusFilterEnum.open,
                  title: LocaleKeys.open.tr().capitalize()!,
                  subtitle: state.openActions.length.toString(),
                ),
              ),
              if (state.activeUserRole != UserRoleEnum.farmerMember)
                Expanded(
                  child: StatusFilterItem(
                    onTap: () {
                      context
                          .read<ActionLogManagementCubit>()
                          .onFilterGroupChanged(
                              ActionLogStatusFilterEnum.upcoming);
                    },
                    isSelected: state.statusFilter ==
                        ActionLogStatusFilterEnum.upcoming,
                    title: LocaleKeys.upcoming.tr(),
                    subtitle: state.totalUpcoming.toString(),
                  ),
                ),
              Expanded(
                child: StatusFilterItem(
                  onTap: () {
                    context
                        .read<ActionLogManagementCubit>()
                        .onFilterGroupChanged(ActionLogStatusFilterEnum.closed);
                  },
                  isSelected: state.statusFilter == ActionLogStatusFilterEnum.closed,
                  title: LocaleKeys.closed.tr(),
                  subtitle: state.closedActions.length.toString(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
