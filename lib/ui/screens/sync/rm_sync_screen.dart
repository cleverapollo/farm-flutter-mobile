import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/state/sync/rm/rm_sync_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RMSyncScreen extends StatelessWidget {
  const RMSyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RMSyncCubit(
          userInfoCubit: context.read<UserInfoCubit>(),
          userDeviceCubit: context.read<UserDeviceCubit>()),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: CmoAppBar(
            title: 'Regional Manager',
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
                          BlocSelector<RMSyncCubit, RMSyncState, GroupScheme?>(
                            selector: (state) {
                              if (state.isLoading || state.isLoaded) {
                                return null;
                              }
                              return state.groupScheme;
                            },
                            builder: (context, state) {
                              if (state == null) {
                                return const SizedBox.shrink();
                              }
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "You're about to sync information for",
                                    style: context.textStyles.bodyNormal.black,
                                  ),
                                  Text(
                                    state.groupSchemeName ?? '',
                                    style: context.textStyles.bodyBold.black,
                                  ),
                                ],
                              );
                            },
                          ),
                          BlocSelector<RMSyncCubit, RMSyncState, String?>(
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
                  BlocSelector<RMSyncCubit, RMSyncState, bool?>(
                    selector: (state) {
                      if (state.isLoaded ||
                          state.groupScheme == null ||
                          state.rmUnit == null) return null;
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
                            await context.read<RMSyncCubit>().sync(context);
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
