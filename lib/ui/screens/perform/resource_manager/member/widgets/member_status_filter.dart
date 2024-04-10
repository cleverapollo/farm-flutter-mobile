import 'package:cmo/enum/enum.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/components/custom_widgets/status_filter_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberStatusFilter extends StatelessWidget {
  const MemberStatusFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberManagementCubit, MemberManagementState>(
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
                        .read<MemberManagementCubit>()
                        .onFilterGroupChanged(MemberManagementStatusFilter.incomplete);
                  },
                  isSelected: state.statusFilter == MemberManagementStatusFilter.incomplete,
                  title: LocaleKeys.incomplete.tr(),
                  subtitle: state.incompleteFarms.length.toString(),
                ),
              ),
              Expanded(
                child: StatusFilterItem(
                  onTap: () {
                    context
                        .read<MemberManagementCubit>()
                        .onFilterGroupChanged(MemberManagementStatusFilter.complete);
                  },
                  isSelected: state.statusFilter == MemberManagementStatusFilter.complete,
                  title: LocaleKeys.members.tr(),
                  subtitle: state.completedFarms.length.toString(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

