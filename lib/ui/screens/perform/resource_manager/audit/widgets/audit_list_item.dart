import 'package:cmo/model/model.dart';
import 'package:cmo/state/audit_list_cubit/audit_list_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/dismissible_audit_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditListItem extends StatefulWidget {
  const AuditListItem({
    super.key,
    required this.onTap,
  });

  final void Function(Audit) onTap;

  @override
  State<AuditListItem> createState() => _AuditListItemState();
}

class _AuditListItemState extends State<AuditListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuditListCubit, AuditListState, AuditListState>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        if (state.loading) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: context.colors.white,
            ),
          );
        }

        if (state.error != null && kDebugMode) {
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
                onTapAudit: () => widget.onTap(item),
                onRemove: () async {
                  await context.read<AuditListCubit>().removeAudit(item);
                },
              );
            },
          ),
        );
      },
    );
  }
}
