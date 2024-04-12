import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_switch.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionLogDetail extends BaseStatefulWidget{
  const ActionLogDetail() : super(screenName: 'ActionLogDetail');

  static Future<void> push(
    BuildContext context, {
    ActionLog? actionLog,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => ActionLogDetailCubit(actionLog),
            child: const ActionLogDetail(),
          );
        },
      ),
    );
  }

  @override
  _ActionLogDetailState createState() => _ActionLogDetailState();
}

class _ActionLogDetailState extends BaseStatefulWidgetState<ActionLogDetail> {

  @override
  Widget buildContent(BuildContext context) {
    return BlocSelector<ActionLogDetailCubit, ActionLogDetailState, ResourceManagerUnit?>(
      selector: (state) => state.activeRMU,
      builder: (context, resourceManagerUnit) => Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.action_log.tr(),
          subtitle: resourceManagerUnit?.regionalManagerUnitName,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: onShowWarningDispose,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              isMajorWidget(),
              AttributeItem(
                child: BlocSelector<ActionLogDetailCubit, ActionLogDetailState, DateTime?>(
                  selector: (state) => state.actionLog.dateRaised,
                  builder: (context, dateRaised) {
                    return DatePickerWidget(
                      lastDate: DateTime.now(),
                      firstDate: DateTime.now().add(const Duration(days: -Constants.DEFAULT_DAY_DURATION_OFFSET)),
                      initialDate: dateRaised,
                      onConfirm: context.read<ActionLogDetailCubit>().onDateRaisedChanged,
                      title: LocaleKeys.date_raised.tr(),
                    );
                  },
                ),
              ),
              AttributeItem(
                child: BlocSelector<ActionLogDetailCubit, ActionLogDetailState, DateTime?>(
                  selector: (state) => state.actionLog.dueDate,
                  builder: (context, dateRaised) {
                    return DatePickerWidget(
                      lastDate: DateTime.now(),
                      firstDate: DateTime.now().add(const Duration(days: -Constants.DEFAULT_DAY_DURATION_OFFSET)),
                      initialDate: dateRaised,
                      onConfirm: context.read<ActionLogDetailCubit>().onDueDateChanged,
                      title: LocaleKeys.due_date.tr(),
                    );
                  },
                ),
              ),
              CmoHeaderTile(
                title: LocaleKeys.raised_against.tr(),
                backgroundColor: context.colors.blueDark2,
              ),
              // Expanded(
              //   child: BlocSelector<MemberManagementCubit, MemberManagementState, MemberManagementStatusFilter>(
              //     selector: (state) => state.statusFilter,
              //     builder: (context, statusFilter) {
              //       switch (statusFilter) {
              //         case MemberManagementStatusFilter.incomplete:
              //           return MembersListView(
              //             shouldShowSearchField: false,
              //             onNavigateToDetail: (farm) =>
              //                 onNavigateToDetail(farm: farm),
              //             onRemoveFarm: onRemoveFarm,
              //           );
              //         case MemberManagementStatusFilter.complete:
              //           return completedMemberContent();
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget isMajorWidget() {
    return BlocSelector<ActionLogDetailCubit, ActionLogDetailState, bool?>(
      selector: (state) => state.actionLog.isMajor,
      builder: (context, isMajor) {
        final titleString = (isMajor ?? false) ? LocaleKeys.major_action_detail.tr() : LocaleKeys.minor_action_detail.tr();
        final titleBackgroundColor = (isMajor ?? false) ? context.colors.red : context.colors.orange9736;
        final titleIcon = (isMajor ?? false) ? Assets.icons.icWarningWhite.svg() : Assets.icons.icCloseWhite.svg();
        return Column(
          children: [
            Container(
              color: titleBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      titleString,
                      style: context.textStyles.bodyBold.white,
                    ),
                  ),
                  titleIcon,
                ],
              ),
            ),
            CmoSwitch(
              displaySwitchAsPrefix: true,
              value: isMajor ?? false,
              title: '${LocaleKeys.major_action.tr()}?',
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              spaceBetween: 10,
              textStyle: context.textStyles.bodyNormalItalic.blueDark2,
              onChanged: context.read<ActionLogDetailCubit>().changeMajorAction,
            ),
          ],
        );
      },
    );
  }
}
