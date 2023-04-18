import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dismissible_audit_item.dart';

class AuditListCompleted extends StatefulWidget {
  const AuditListCompleted({super.key});

  @override
  State<AuditListCompleted> createState() => _AuditListCompletedState();
}

class _AuditListCompletedState extends State<AuditListCompleted> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<AuditListCubit>().loadCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuditListCubit, AuditListState, AuditListState>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        if (state.loadingCompleted) {
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
            return context.read<AuditListCubit>().loadCompleted();
          },
          child: ListView.builder(
            itemCount: state.dataCompleted.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              final item = state.dataCompleted[index];
              return DismissibleAuditItem();
              // return AssessmentTile(data: item);
            },
          ),
        );
      },
    );
  }
}