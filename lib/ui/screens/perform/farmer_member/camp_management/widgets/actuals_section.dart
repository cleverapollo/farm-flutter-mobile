import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmo/ui/widget/common_widgets.dart';

class ActualSection extends StatelessWidget {
  const ActualSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddCampCubit, AddCampState, bool>(
      selector: (state) => state.addCampActualSectionState.isSectionCollapse,
      builder: (context, isSectionCollapse) {
        final cubit = context.read<AddCampCubit>();
        return ExpandableItemWidget(
          title: LocaleKeys.actuals.tr(),
          isCollapse: isSectionCollapse,
          onTap: cubit.onChangeActualState,
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 12, 8, 22),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    LocaleKeys.estimated_year_harvest.tr(),
                    style: context.textStyles.bodyBold.blueDark2,
                  ),
                ),
                AttributeItem(
                  child: _YearDropdown(
                      initialValue: cubit.state.camp?.plannedYearOfHarvest,
                      onChanged: (value) =>
                          cubit.onPlannedYearOfHarvestChanged(value)),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    LocaleKeys.actual_year_of_harvest.tr(),
                    style: context.textStyles.bodyBold.blueDark2,
                  ),
                ),
                AttributeItem(
                  child: _YearDropdown(
                      initialValue: cubit.state.camp?.actualYearOfHarvest,
                      onChanged: (value) =>
                          cubit.onActualYearOfHarvestChanged(value)),
                ),
                const SizedBox(height: 24),
                AttributeItem(
                  child: InputAttributeItem(
                    labelText: LocaleKeys.tons_will_be_produced.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    keyboardType: TextInputType.number,
                    initialValue: (cubit.state.camp?.tonsOfCharcoalProduced ?? '').toString(),
                    onChanged: cubit.onTonsOfProductChanged,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}


class _YearDropdown extends StatelessWidget {

  _YearDropdown({this.onChanged, this.initialValue, super.key});

  final ValueChanged<int?>? onChanged;
  final int? initialValue;
  final data = [
    CmoDropdownItem(id: DateTime.now().year - 1, name: '${DateTime.now().year - 1}'),
    CmoDropdownItem(id: DateTime.now().year, name: '${DateTime.now().year}'),
    CmoDropdownItem(id: DateTime.now().year + 1, name: '${DateTime.now().year + 1}'),
    CmoDropdownItem(id: DateTime.now().year + 2, name: '${DateTime.now().year + 2}'),
    CmoDropdownItem(id: DateTime.now().year + 3, name: '${DateTime.now().year + 3}'),
    CmoDropdownItem(id: DateTime.now().year + 4, name: '${DateTime.now().year + 4}'),
    CmoDropdownItem(id: DateTime.now().year + 5, name: '${DateTime.now().year + 5}'),
  ];

  void addInitValueIfNotExist() {
    final index = data.indexWhere((element) => element.id == initialValue);
    if(index == -1 && initialValue != null) {
      data.add(
        CmoDropdownItem(id: initialValue!, name: '$initialValue'),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    addInitValueIfNotExist();
    return CmoDropdown<int>(
      name: 'Year',
      onChanged: onChanged,
      initialValue: initialValue,
      inputDecoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        isDense: true,
        hintText:
        '${LocaleKeys.select.tr()} ${LocaleKeys.year.tr().toLowerCase()}',
        hintStyle: context.textStyles.bodyNormal.grey,
        border: InputBorder.none,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.blue)),
      ),
      itemsData: data,
    );
  }
}
