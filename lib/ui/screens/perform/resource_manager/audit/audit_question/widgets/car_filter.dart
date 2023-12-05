import 'package:cmo/enum/enum.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarFilter extends StatelessWidget {
  const CarFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
      builder: (context, state) {
        return DropdownStateless<CarFilterEnum>(
          keyName: 'car_filter',
          isDropdownOpened: state.isOpenedCarFilter,
          onTapDropdown: context.read<AuditListQuestionsCubit>().onTapCarFilterDropdown,
          listItems: state.carFilterEnums
              .map((item) => OptionItem<CarFilterEnum>(id: item, title: item.valueName))
              .toList(),
          hintText: LocaleKeys.all_cars.tr(),
          itemSelected: state.selectedCARFilter == null
              ? null
              : OptionItem<CarFilterEnum>(
            id: state.selectedCARFilter!,
            title: state.selectedCARFilter!.valueName,
          ),
          onSelected: context.read<AuditListQuestionsCubit>().setCarFilter,
        );
        return CmoCustomDropdown<CarFilterEnum>(
          keyName: 'car_filter',
          listItems: state.carFilterEnums
              .map((item) => OptionItem<CarFilterEnum>(id: item, title: item.valueName))
              .toList(),
          hintText: LocaleKeys.all_cars.tr(),
          itemSelected: state.selectedCARFilter == null
              ? null
              : OptionItem<CarFilterEnum>(
            id: state.selectedCARFilter!,
            title: state.selectedCARFilter!.valueName,
          ),
          onSelected: context.read<AuditListQuestionsCubit>().setCarFilter,
        );
      },
    );
  }
}
