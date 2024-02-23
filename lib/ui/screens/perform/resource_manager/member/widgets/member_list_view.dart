import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'member_item.dart';

class MembersListView extends StatelessWidget {
  const MembersListView({
    required this.onNavigateToDetail,
    required this.onRemoveFarm,
    super.key,
  });

  final void Function(Farm?) onNavigateToDetail;
  final void Function(Farm) onRemoveFarm;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberManagementCubit, MemberManagementState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.separated(
          itemCount: state.filteringFarms.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (_, index) {
            final farm = state.filteringFarms[index];
            return InkWell(
              onTap: () => onNavigateToDetail(farm),
              child: MemberItem(
                farm: farm,
                canDelete: state.statusFilter ==
                    MemberManagementStatusFilter.incomplete,
                onDelete: () => onRemoveFarm(farm),
              ),
            );
          },
        );
      },
    );
  }
}
