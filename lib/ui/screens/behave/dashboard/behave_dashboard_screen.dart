import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/behave/assessment/assessment_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BehaveDashboardScreen extends StatefulWidget {
  const BehaveDashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BehaveDashboardScreenState();
}

class _BehaveDashboardScreenState extends State<BehaveDashboardScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<DashboardCubit>().getDataBehaveRole();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DashboardCubit, DashboardState, DashboardState>(
      selector: (state) => state,
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
          onRefresh: () async => context.read<DashboardCubit>().getDataBehaveRole(),
          child: ListView(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.all(20),
            children: [
              CmoTappable(
                onTap: () => AssessmentScreen.push(context),
                child: CmoCard(
                  content: [
                    CmoCardHeader(title: LocaleKeys.assessments.tr()),
                    CmoCardItem(
                      title: LocaleKeys.completed.tr(),
                      value: '${state.totalCompletedAssessments ?? 0}/${state.totalAssessments ?? 0}',
                    ),
                    CmoCardItem(
                      title: LocaleKeys.incomplete.tr(),
                      value: '${state.totalIncompleteAssessments ?? 0}/${state.totalAssessments ?? 0}',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CmoTappable(
                onTap: () => WorkerAddScreen.push(context),
                child: CmoCard(
                  content: [
                    CmoCardHeader(title: LocaleKeys.createWorker.tr()),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CmoTappable(
                onTap: () => SyncSummaryScreen.push(context),
                child: CmoCard(
                  content: [
                    CmoCardHeader(title: LocaleKeys.sync.tr()),
                    CmoCardItem(
                      title: LocaleKeys.synced.tr(),
                      value: (state.totalUnsyncBehave ?? 0).toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
