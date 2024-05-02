import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/state/sync/rm/rm_sync_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/sync_summary/widgets/rm_sync_summary_information_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceManagerSyncSummaryScreen extends BaseStatefulWidget {
  ResourceManagerSyncSummaryScreen({super.key}) : super(screenName: LocaleKeys.syncSummary.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => RMSyncCubit(
            userDeviceCubit: context.read<UserDeviceCubit>(),
          ),
          child: ResourceManagerSyncSummaryScreen(),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _ResourceManagerSyncSummaryScreenState();
}

class _ResourceManagerSyncSummaryScreenState extends BaseStatefulWidgetState<ResourceManagerSyncSummaryScreen> {

  @override
  bool get shouldCheckConnectionSpeed => true;

  Future<void> onSyncSuccess() async {
    await context.read<DashboardCubit>().initializeRM();
  }

  Future<void> onSyncFailure() async {
    final state = context.read<RMSyncCubit>().state;
    await onShowWarningDialog(
      context,
      title: LocaleKeys.sync_failed.tr(),
      subtitle: LocaleKeys.sync_failed_messages.tr(args: [
        state.rmUnit?.regionalManagerUnitName ?? '',
      ]),
      children: [
        ...state.errorMessageItems.map(
              (errorMessage) => Text(
            errorMessage,
            style: context.textStyles.bodyNormal.blueDark2,
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    LocaleKeys.continue_string.tr(),
                    textAlign: TextAlign.center,
                    style: context.textStyles.bodyBold.copyWith(
                      color: context.colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                  await context.read<RMSyncCubit>().syncSummary();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    LocaleKeys.sync_again.tr(),
                    textAlign: TextAlign.center,
                    style: context.textStyles.bodyBold.copyWith(
                      color: context.colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.syncSummary.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: BlocListener<RMSyncCubit, RMSyncState>(
        listenWhen: (previous, current) =>
            previous.isSyncError != current.isSyncError ||
            previous.isSynced != current.isSynced,
        listener: (context, state) async {
          if (state.isSyncError) {
            await onSyncFailure();
          } else if (state.isSynced) {
            await onSyncSuccess();
          }
        },
        child: RefreshIndicator(
          onRefresh: context.read<RMSyncCubit>().getSummaryInformation,
          child: Stack(
            children: [
              const RmSyncSummaryInformationWidget(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colors.white,
                  ),
                  child: BlocBuilder<RMSyncCubit, RMSyncState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (state.isSynced && !state.isSyncError)
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              margin: const EdgeInsets.only(bottom: 16.0),
                              width: double.infinity,
                              color: context.colors.green,
                              alignment: Alignment.center,
                              child: Text(
                                LocaleKeys.sync_successfully_completed.tr(),
                                style: context.textStyles.bodyBold.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          if (!state.isSyncing)
                            const SizedBox.shrink()
                          else
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                state.syncMessage ?? '',
                                style: context.textStyles.bodyNormal.blueDark2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            CmoFilledButton(
                            loading: state.isLoading,
                            title: LocaleKeys.sync.tr(),
                            onTap: context.read<RMSyncCubit>().syncSummary,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
