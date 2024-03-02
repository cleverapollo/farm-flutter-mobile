import 'package:cmo/enum/enum.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
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
                child: MemberStatusItem(
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
                child: MemberStatusItem(
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

class MemberStatusItem extends StatelessWidget {
  const MemberStatusItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.title,
    required this.subtitle,
  });

  final void Function() onTap;
  final bool isSelected;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textColor =
        isSelected ? context.colors.white : context.colors.blueDark2;
    final backgroundColor =
        isSelected ? context.colors.blue : context.colors.white;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.textStyles.bodyBold.copyWith(
                color: textColor,
              ),
            ),
            Text(
              '($subtitle)',
              style: context.textStyles.bodyNormal.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
