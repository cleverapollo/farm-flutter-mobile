import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/state/assessment_list_cubit/assessment_list_cubit.dart';
import 'package:cmo/ui/screen/assessments/widgets/assessment_tile.dart';
import 'package:cmo/ui/theme/theme.dart';

class ListSynced extends StatefulWidget {
  const ListSynced({super.key});

  @override
  State<ListSynced> createState() => _ListSyncedState();
}

class _ListSyncedState extends State<ListSynced> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<AssessmentListCubit>().loadSynced();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AssessmentListCubit, AssessmentListState,
        AssessmentListState>(
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
            return context.read<AssessmentListCubit>().loadSynced();
          },
          child: ListView.builder(
            itemCount: state.dataSynced.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              final item = state.dataSynced[index];
              return AssessmentTile(data: item);
            },
          ),
        );
      },
    );
  }
}
