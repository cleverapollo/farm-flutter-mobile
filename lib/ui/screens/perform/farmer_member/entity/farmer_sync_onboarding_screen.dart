import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmerSyncOnboardingScreen extends StatelessWidget {
  const FarmerSyncOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FarmerSyncOnboardingCubit(
        userDeviceCubit: context.read<UserDeviceCubit>(),
      ),
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
                        children: [
                          BlocSelector<FarmerSyncOnboardingCubit, FarmerSyncOnboardingState, Farm?>(
                            selector: (state) {
                              if (state.isLoading || state.isLoaded) {
                                return null;
                              }
                              return state.farm;
                            },
                            builder: (context, farm) {
                              if (farm == null) {
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
                                    farm.farmName ?? '',
                                    style: context.textStyles.bodyBold.black,
                                  ),
                                ],
                              );
                            },
                          ),
                          BlocSelector<FarmerSyncOnboardingCubit, FarmerSyncOnboardingState, String?>(
                            selector: (state) {
                              return state.syncMessage;
                            },
                            builder: (context, state) {
                              if (state == null) {
                                return const SizedBox.shrink();
                              }

                              return Text(
                                state,
                                style: context.textStyles.bodyNormal.black,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocSelector<FarmerSyncOnboardingCubit,
                      FarmerSyncOnboardingState, bool?>(
                    selector: (state) {
                      if (state.isLoaded || state.farm == null) return null;
                      return state.isLoading;
                    },
                    builder: (context, state) {
                      if (state == null) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 40),
                        child: CmoFilledButton(
                          title: LocaleKeys.sync.tr(),
                          loading: state,
                          onTap: () async {
                            await context
                                .read<FarmerSyncOnboardingCubit>()
                                .syncOnboarding(
                              onCompleted: () {
                                if (context.mounted) {
                                  CmoDashboardBase.push(context);
                                }
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
