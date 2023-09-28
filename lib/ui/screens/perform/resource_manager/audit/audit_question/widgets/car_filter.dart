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
        return CmoDropdown<CarFilterEnum>(
          name: 'car',
          hintText: LocaleKeys.all_cars.tr(),
          onChanged: (CarFilterEnum? filterEnum) {
            context.read<AuditListQuestionsCubit>().setCarFilter(filterEnum);
          },
          itemsData: state.carFilterEnums
              .map(
                (e) => CmoDropdownItem<CarFilterEnum>(
                  id: e,
                  name: e.valueName,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
