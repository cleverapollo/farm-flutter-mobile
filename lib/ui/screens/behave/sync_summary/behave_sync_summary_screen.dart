import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/behave_sync_summary_cubit/sync_summary_cubit.dart';
import 'package:cmo/state/behave_sync_summary_cubit/sync_summary_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/behave/sync_summary/behave_sync_summary_enum.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncSummaryScreen extends StatefulWidget {
  const SyncSummaryScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SyncSummaryScreen()),
    );
  }

  @override
  State<StatefulWidget> createState() => _SyncSummaryScreenState();
}

class _SyncSummaryScreenState extends State<SyncSummaryScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<SyncSummaryCubit>().onInitialData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SyncSummaryCubit, SyncSummaryState, SyncSummaryState>(
          selector: (state) => state,
          builder: (context, state) {
            return Scaffold(
              appBar: CmoAppBar(
                title: LocaleKeys.syncSummary.tr(),
                leading: Assets.icons.icArrowLeft.svgBlack,
                onTapLeading: () {
                  if (!state.isLoadingSync) {
                    return Navigator.pop(context);
                  }
                },
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  if (!state.isLoadingSync) {
                    await context.read<SyncSummaryCubit>().onInitialData();
                  }
                },
                child: Stack(
                  children: [
                    if (state.isLoading)
                      const _BuildLoadingIndicator()
                    else
                      SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: BehaveSyncSummaryEnum.all.getViews
                                .withSpaceBetween(height: 16)
                              ..add(
                                const SizedBox(height: 60),
                              )),
                      ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CmoFilledButton(
                            onTap: () async {
                              await context
                                  .read<SyncSummaryCubit>()
                                  .onSyncData(() async {
                                await context.read<DashboardCubit>().refresh();
                              });
                            },
                            title: state.isLoadingSync
                                ? state.syncMessage
                                : LocaleKeys.sync.tr(),
                            leading: state.isLoadingSync
                                ? const Padding(
                                    padding: EdgeInsets.only(right: 16.0),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }
}

class _BuildLoadingIndicator extends StatelessWidget {
  const _BuildLoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
