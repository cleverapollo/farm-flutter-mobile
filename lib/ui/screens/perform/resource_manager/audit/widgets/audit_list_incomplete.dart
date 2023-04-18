import 'package:cmo/state/audit_list_cubit/audit_list_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dismissible_audit_item.dart';

class AuditListIncomplete extends StatefulWidget {
  const AuditListIncomplete({super.key});

  @override
  State<AuditListIncomplete> createState() => _AuditListIncompleteState();
}

class _AuditListIncompleteState extends State<AuditListIncomplete> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<AuditListCubit>().loadIncomplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuditListCubit, AuditListState, AuditListState>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        if (state.loadingIncomplete) {
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
            return context.read<AuditListCubit>().loadIncomplete();
          },
          child: ListView.builder(
            itemCount: state.dataIncomplete.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              final item = state.dataIncomplete[index];
              return DismissibleAuditItem();
              // return AssessmentTile(
              //   data: item,
              //   onRemovingCallback: (item) async =>
              //       context.read<AssessmentListCubit>().removeAssessment(item),
              // );
            },
          ),
        );
      },
    );
  }
}