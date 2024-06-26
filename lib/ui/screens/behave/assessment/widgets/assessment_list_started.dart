import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/behave/assessment/widgets/widgets.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssessmentListStarted extends StatefulWidget {
  const AssessmentListStarted({super.key});

  @override
  State<AssessmentListStarted> createState() => _AssessmentListStartedState();
}

class _AssessmentListStartedState extends State<AssessmentListStarted> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<AssessmentListCubit>().loadStarted();
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
        if (state.loadingStarted) {
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
            return context.read<AssessmentListCubit>().loadStarted();
          },
          child: ListView.builder(
            itemCount: state.dataStarted.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (BuildContext context, int index) {
              final item = state.dataStarted[index];
              return AssessmentTile(
                data: item,
                onRemovingCallback: removeAssessment,
              );
            },
          ),
        );
      },
    );
  }

  Future<void> removeAssessment(Assessment item) async {
    await context.read<AssessmentListCubit>().removeAssessment(item);
    await context.read<DashboardCubit>().refresh();
  }
}
