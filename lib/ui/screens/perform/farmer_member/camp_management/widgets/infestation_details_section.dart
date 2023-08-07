import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_cubit.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_chip_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InfestationSection extends StatelessWidget {
  const InfestationSection({super.key});

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
