import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingFilter extends StatelessWidget {
  const UpcomingFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormatEnum = context.read<SettingsCubit>().state.settingConfig.dateFormatEnum;
    return BlocBuilder<ActionLogManagementCubit, ActionLogManagementState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
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
                  itemSelected: OptionItem<UpcomingActionLogTimeFilter>(
                    id: state.selectedUpcomingActionLogTimeFilter,
                    title: state.selectedUpcomingActionLogTimeFilter.valueName,
                  ),
                  onSelected: context.read<ActionLogManagementCubit>().selectUpcomingTimeRangeEnumFilter,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: DatePickerWidget(
                    title: LocaleKeys.select_date.tr(),
                    lastDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(const Duration(days: Constants.DEFAULT_DAY_DURATION_OFFSET)),
                    initialDate: state.selectedDateUpcomingFilter,
                    onConfirm: context.read<ActionLogManagementCubit>().selectUpcomingTimeFilter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateFormatEnum.displayFormat(state.selectedDateUpcomingFilter),
                            maxLines: 3,
                            style: context.textStyles.bodyNormal.blueDark2,
                            textAlign: TextAlign.left,
                          ),
                          Assets.icons.icCalendar.svgBlack,
                        ],
                    ),
                  ),
                ),
              ),
            ].withSpaceBetween(width: 12),
          ),
        );
      },
    );
  }
}
