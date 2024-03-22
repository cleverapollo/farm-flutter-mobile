import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/state/sync/rm/rm_sync_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RMSyncScreen extends BaseStatefulWidget {
  const RMSyncScreen({
    super.key,
  }) : super(screenName: 'RMSyncScreen');

  static Future<void> push(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => RMSyncCubit(
            userInfoCubit: context.read<UserInfoCubit>(),
            userDeviceCubit: context.read<UserDeviceCubit>(),
          ),
          child: const RMSyncScreen(),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => RMSyncScreenState();
}

class RMSyncScreenState extends BaseStatefulWidgetState<RMSyncScreen> {

  Future<void> processWithSyncOnboarding() async {
    await cmoDatabaseMasterService.deleteAll();
    await context.read<UserDeviceCubit>().createPerformUserDevice();
    await context.read<RMSyncCubit>().syncOnboarding();
    await configService.updateLatestLocalDatabaseStatus();
    if (context.mounted) CmoDashboardBase.push(context);
  }

  Future<void> goToDashBoard() async {
    if (context.mounted) CmoDashboardBase.push(context);
  }

  Future<void> onSync() async {
    final alreadyHaveOldData = await configService.alreadyHaveOldData();
    if (alreadyHaveOldData) {
      await onShowWarningDialog(
        context,
        title: LocaleKeys.warning.tr(),
        subtitle: LocaleKeys.existed_local_data_dialog_message.tr(),
        children: [
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await goToDashBoard();
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    color: context.colors.blue,
                    alignment: Alignment.center,
                    child: Text(
                      LocaleKeys.current_session.tr(),
                      style: context.textStyles.bodyBold
                          .copyWith(color: context.colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await processWithSyncOnboarding();
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    child: Text(
                      LocaleKeys.new_sync.tr(),
                      textAlign: TextAlign.center,
                      style: context.textStyles.bodyBold
                          .copyWith(color: context.colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      await processWithSyncOnboarding();
    }
  }

  @override
  bool get canPopWithoutWarningDialog => false;

  @override
  bool get shouldCheckConnectionSpeed => true;

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: '',
        titleWidget: BlocBuilder<RMSyncCubit, RMSyncState>(
          builder: (context, state) {
            return Center(
              child: Text(
                '${state.userInfo?.firstName ?? ''} ${state.userInfo?.lastName ?? ''}',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: context.textStyles.titleBold,
              ),
            );
          },
        ),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
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
                                LocaleKeys.you_re_about_to_sync_information_for.tr(),
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
                      onTap: onSync,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
