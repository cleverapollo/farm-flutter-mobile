import 'package:cmo/enum/enum.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarFilter extends StatelessWidget {
  final GlobalKey actionKey;

  const CarFilter({
    required this.actionKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuditListQuestionsCubit, AuditListQuestionsState>(
      builder: (context, state) {
        return CmoCustomDropdown<CarFilterEnum>(
          keyName: 'car_filter',
          actionKey: actionKey,
          automaticallyChangeIsDropDownOpenedValue: state.isNCComplianceFilter,
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
