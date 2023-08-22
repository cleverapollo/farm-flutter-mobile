import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmerSyncOnboardingScreen extends StatelessWidget {
  const FarmerSyncOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FarmerSyncSummaryCubit(
        userDeviceCubit: context.read<UserDeviceCubit>(),
      )..initDataConfig(),
      child: BlocListener<FarmerSyncSummaryCubit, FarmerSyncSummaryState>(
        listenWhen: (previous, current) =>
            previous.isDoneSyncing != current.isDoneSyncing,
        listener: (context, state) {
          if (state.isDoneSyncing) {
            CmoDashboardBase.push(context);
          }
        },
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            appBar: CmoAppBar(
              title: LocaleKeys.farmer.tr(),
            ),
            body: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            _FarmSyncOnboardingContentWidget(),
                            _FarmSyncOnboardingMessageWidget(),
                          ],
                        ),
                      ),
                    ),
                    const _FarmSyncOnboardingSyncButtonWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FarmSyncOnboardingSyncButtonWidget extends StatelessWidget {
  const _FarmSyncOnboardingSyncButtonWidget();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FarmerSyncSummaryCubit, FarmerSyncSummaryState, bool?>(
      selector: (state) => state.isSyncing,
      builder: (context, isSyncing) {
        if (isSyncing == null) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 40),
          child: CmoFilledButton(
            title: LocaleKeys.sync.tr(),
            loading: isSyncing,
            onTap: () async =>
                context.read<FarmerSyncSummaryCubit>().syncOnboarding(
              onCompleted: () {
                if (context.mounted) {
                  CmoDashboardBase.push(context);
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class _FarmSyncOnboardingMessageWidget extends StatelessWidget {
  const _FarmSyncOnboardingMessageWidget();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FarmerSyncSummaryCubit, FarmerSyncSummaryState,
        String?>(
      selector: (state) => state.syncMessage,
      builder: (context, syncMessage) {
        if (syncMessage == null) {
          return const SizedBox.shrink();
        }

        return Text(
          syncMessage,
          textAlign: TextAlign.center,
          style: context.textStyles.bodyNormal.black,
        );
      },
    );
  }
}

class _FarmSyncOnboardingContentWidget extends StatelessWidget {
  const _FarmSyncOnboardingContentWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FarmerSyncSummaryCubit, FarmerSyncSummaryState>(
      buildWhen: (previous, current) =>
          previous.isSyncing != current.isSyncing ||
          previous.farmName != current.farmName,
      builder: (context, state) {
        if (state.farmName == null) {
          return const CircularProgressIndicator();
        }
        if (state.isSyncing) {
          return const SizedBox.shrink();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.you_re_about_to_sync_information_for.tr(),
              style: context.textStyles.bodyNormal.black,
            ),
            Text(
              state.farmName ?? '',
              style: context.textStyles.bodyBold.black,
            ),
          ],
        );
      },
    );
  }
}
