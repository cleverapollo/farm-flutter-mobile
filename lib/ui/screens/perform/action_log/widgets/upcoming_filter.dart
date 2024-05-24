import 'package:cmo/enum/enum.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingFilter extends StatelessWidget {
  const UpcomingFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionLogManagementCubit, ActionLogManagementState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: DropdownStateless<UpcomingActionLogTimeFilter>(
                keyName: 'upcoming_action_log_time_filter',
                isDropdownOpened: state.isOpenedUpcomingFilter,
                textStyle: context.textStyles.bodyNormal.blueDark2.copyWith(fontSize: 15),
                onTapDropdown: context.read<ActionLogManagementCubit>().onTapUpcomingTimeFilterDropdown,
                listItems: state.upcomingActionLogTimeFiltersEnum
                    .map(
                      (item) => OptionItem<UpcomingActionLogTimeFilter>(
                    id: item,
                    title: item.valueName,
                  ),
                )
                    .toList(),
                hintText: LocaleKeys.no_filter.tr(),
                itemSelected: state.selectedUpcomingActionLogTimeFilter == null
                    ? null
                    : OptionItem<UpcomingActionLogTimeFilter>(
                  id: state.selectedUpcomingActionLogTimeFilter,
                  title: state.selectedUpcomingActionLogTimeFilter.valueName,
                ),
                onSelected: context.read<ActionLogManagementCubit>().setUpcomingTimeFilter,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: DatePickerWidget(
                  title: LocaleKeys.select_date.tr(),
                  lastDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: Constants.DEFAULT_DAY_DURATION_OFFSET)),
                  initialDate: DateTime.now(),
                  onConfirm: (_) {},
                  // cubit.onDateReleasedChanged,
                  // child: SelectorAttributeItem(
                  //   labelText: LocaleKeys.dateReleased.tr(),
                  //   labelStyle: context.textStyles.bodyBold.blueDark3,
                  //   text: state.agent.dateReleased == null
                  //       ? ''
                  //       : convertDateTimeToLunarString(state.agent.dateReleased),
                  //   textStyle: context.textStyles.bodyNormal.blueDark2,
                  //   contentPadding: const EdgeInsets.symmetric(
                  //     horizontal: 12,
                  //     vertical: 8,
                  //   ),
                  //   trailing: Assets.icons.icCalendar.svgBlack,
                  // ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
