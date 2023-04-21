import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CarFilter extends StatelessWidget {
  const CarFilter({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    const name = 'car';

    return BlocSelector<AuditListQuestionsCubit, AuditListQuestionsState, List<Car>>(
      selector: (state) {
        return state.cars;
      },
      builder: (context, cars) {
        return CmoDropdown(
          name: name,
          hintText: LocaleKeys.car.tr(),
          onChanged: (int? id) {
            if (id == -1) {
              formKey.currentState!.fields[name]?.reset();
            }

            context.read<AuditListQuestionsCubit>().setCarFilter(id);
          },
          itemsData: cars
              .map(
                (e) => CmoDropdownItem(
                  id: e.carId,
                  name: e.carName ?? '',
                ),
              )
              .toList()
            ..insert(
              0,
              CmoDropdownItem(
                id: -1,
                name: LocaleKeys.car.tr(),
              ),
            ),
        );
      },
    );
  }
}
