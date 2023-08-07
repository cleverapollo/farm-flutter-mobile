import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActualSection extends StatelessWidget {
  const ActualSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddCampCubit, AddCampState, AddCampState>(
      selector: (state) => state,
      builder: (context, state) {
        return ExpandableItemWidget(
          title: LocaleKeys.areaMetrics.tr(),
          showTick: false, //data.isComplete,
          // isCollapse: data.isSectionCollapse,
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            ),
          ),
        );
      },
    );
  }
}