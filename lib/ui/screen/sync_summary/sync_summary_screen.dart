import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screen/sync_summary/cubit/sync_summary_cubit.dart';
import 'package:cmo/ui/screen/sync_summary/sync_summary_enum.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/sync_summary_state.dart';

class SyncSummaryScreen extends StatelessWidget {
  const SyncSummaryScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SyncSummaryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.syncSummary.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: BlocProvider<SyncSummaryCubit>(
        create: (_) => SyncSummaryCubit(),
        child: BlocBuilder<SyncSummaryCubit, SyncSummaryState>(
          builder: (_, state) => state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: SyncSummaryEnum.all.getViews
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
                            onTap: () {
                              context.read<SyncSummaryCubit>().onSync();
                            },
                            title: LocaleKeys.sync.tr(),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
