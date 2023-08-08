import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_cubit.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_step2_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/widgets/infestation_details_section.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/member_detail/site_location_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widgets/actuals_section.dart';
import 'widgets/area_metrics_section.dart';

class AddCampScreen extends StatefulWidget {
  AddCampScreen({Key? key}) : super(key: key);

  static Future push(BuildContext context, {Camp? camp}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AddCampCubit(camp: camp)..init(),
            child: AddCampScreen(),
          );
        },
      ),
    );
  }

  @override
  State<AddCampScreen> createState() => _AddCampScreenState();
}

class _AddCampScreenState extends State<AddCampScreen> {
  late AddCampCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddCampCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddCampCubit, AddCampState, Farm?>(
      selector: (state) => state.farm,
      builder: (context, farm) {
        return Scaffold(
          appBar: CmoAppBarV2(
            title: LocaleKeys.add_camp.tr(),
            subtitle: farm?.farmName ?? '',
            showLeading: true,
            showTrailing: true,
            trailing: Assets.icons.icClose.svgBlack,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),
                const AreaMetricsSection(),
                const InfestationSection(),
                const ActualSection(),
                // GestureDetector(
                //   onTap: () async {
                //     final result = await CompartmentScreen.push(
                //       context,
                //       farmId: cubit.state.farm?.farmId,
                //       farmName: cubit.state.farm?.farmName,
                //       campId: cubit.state.camp?.campId,
                //     );
                //     if (result != null) {
                //       cubit.onCompartmentChanged(
                //           addingCompartmentResult: result!);
                //     }
                //   },
                //   child: BlocSelector<AddCampCubit, AddCampState,
                //       List<Compartment>>(
                //     selector: (state) => state.compartments,
                //     builder: (context, compartments) {
                //       return AttributeItem(
                //         child: SelectorAttributeItem(
                //           hintText: LocaleKeys.compartments.tr(),
                //           text: compartments.isNotEmpty
                //               ? LocaleKeys.compartments.tr()
                //               : null,
                //           trailing: compartments.isEmpty
                //               ? null
                //               : Row(
                //             children: [
                //               Assets.icons.icTick.widget,
                //               const SizedBox(width: 8),
                //               Assets
                //                   .icons.icArrowRight.svgBlack,
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () async {
                //     final result = await ASIScreen.push(
                //       context,
                //       farmId: cubit.state.farm?.farmId,
                //       farmName: cubit.state.farm?.farmName,
                //       campId: cubit.state.camp?.campId,
                //     );
                //     if (result != null) {
                //       cubit.onAsisChanged(asis: result);
                //     }
                //   },
                //   child: BlocSelector<AddCampCubit, AddCampState,
                //       List<Asi>>(
                //     selector: (state) => state.asis,
                //     builder: (context, asis) {
                //       return AttributeItem(
                //         child: SelectorAttributeItem(
                //           hintText: LocaleKeys.asi.tr(),
                //           text: asis.isNotEmpty
                //               ? LocaleKeys.asi.tr()
                //               : null,
                //           trailing: asis.isEmpty
                //               ? null
                //               : Row(
                //             children: [
                //               Assets.icons.icTick.widget,
                //               const SizedBox(width: 8),
                //               Assets
                //                   .icons.icArrowRight.svgBlack,
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                Center(
                  child: CmoFilledButton(
                    title: LocaleKeys.save.tr(),
                    onTap: () => _next(cubit.state),
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

  Future<void> _next(AddCampState state) async {
    final isValid = state.addCampAreaMetricsSectionState.isComplete && state.addCampInfestationDetailsState.isComplete;

    if (!isValid) {
      return showSnackError(msg: 'Please complete required field');
    }

    await cubit.saveCamp(context);
    await context.read<SiteManagementPlanCubit>().refresh();
    Navigator.of(context).pop();
  }
}

class SelectorAttributeItem extends StatelessWidget {
  final String hintText;
  final String? text;
  final Widget? textWidget;
  final EdgeInsetsGeometry contentPadding;
  final Widget? trailing;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;

  const SelectorAttributeItem({
    required this.hintText,
    this.text,
    this.labelText,
    this.labelStyle,
    this.textStyle,
    this.textWidget,
    this.contentPadding = const EdgeInsets.fromLTRB(14, 4, 14, 4),
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            minLines: 1,
            controller: TextEditingController()..text = text ?? '',
            style: textStyle ?? context.textStyles.bodyBold,
            enabled: false,
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              labelStyle: labelStyle,
              contentPadding: contentPadding,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        trailing ?? Assets.icons.icArrowRight.svgBlack,
        const SizedBox(width: 16),
      ],
    );
  }
}
