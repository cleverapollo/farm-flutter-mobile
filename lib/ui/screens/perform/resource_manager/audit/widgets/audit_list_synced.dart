import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/widgets/dismissible_audit_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuditListSynced extends StatefulWidget {
  const AuditListSynced({
    super.key,
    required this.onTap,
  });

  final void Function(Audit) onTap;

  @override
  State<AuditListSynced> createState() => _AuditListSyncedState();
}

class _AuditListSyncedState extends State<AuditListSynced> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<AuditListCubit>().loadSynced();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuditListCubit, AuditListState, AuditListState>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        if (state.loadingSynced) {
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
            return context.read<AuditListCubit>().loadSynced();
          },
          child: ListView.builder(
            itemCount: state.dataSynced.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              final item = state.dataSynced[index];
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