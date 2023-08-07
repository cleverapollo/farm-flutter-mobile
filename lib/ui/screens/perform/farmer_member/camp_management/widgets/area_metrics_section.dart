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

class AreaMetricsSection extends StatelessWidget {
  const AreaMetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddCampCubit, AddCampState, AddCampAreaMetricsSectionState>(
      selector: (state) => state.addCampAreaMetricsSectionState,
      builder: (context, state) {
        final cubit = context.read<AddCampCubit>();
        return ExpandableItemWidget(
          title: LocaleKeys.areaMetrics.tr(),
          showTick: state.isComplete,
          isCollapse: state.isSectionCollapse,
          onTap: () => cubit.onChangeAreaMetricsSection(onTapCollapse: true),
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            color: Colors.white,
            child: Column(
                children: [
                  AttributeItem(
                    child: InputAttributeItem(
                      labelText: LocaleKeys.campName.tr(),
                      labelTextStyle: context.textStyles.bodyBold,
                      initialValue: state.campName,
                      onChanged: (value) => cubit.onChangeAreaMetricsSection(campName: value),
                      validator: requiredValidator,
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      labelText: LocaleKeys.hectares_camp_protected.tr(),
                      labelTextStyle: context.textStyles.bodyNormal.copyWith(fontSize: 14),
                      initialValue: state.protectedArea,
                      maxLines: 2,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) => cubit.onChangeAreaMetricsSection(protectedArea: value),
                      validator: requiredValidator,
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      labelText: LocaleKeys.hectares_camp_cattle_posts_housing.tr(),
                      labelTextStyle: context.textStyles.bodyNormal.copyWith(fontSize: 14),
                      initialValue: state.protectedArea,
                      maxLines: 2,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) => cubit.onChangeAreaMetricsSection(cattlePostHousing: value),
                      validator: requiredValidator,
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      labelText: LocaleKeys.hectares_are_corridors.tr(),
                      labelTextStyle: context.textStyles.bodyNormal.copyWith(fontSize: 14),
                      initialValue: state.corridors,
                      maxLines: 2,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) => cubit.onChangeAreaMetricsSection(corridors: value),
                      validator: requiredValidator,
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      labelText: LocaleKeys.hectares_road_fire_breaks.tr(),
                      labelTextStyle: context.textStyles.bodyNormal.copyWith(fontSize: 14),
                      initialValue: state.roadAndFireBreaks,
                      maxLines: 2,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) => cubit.onChangeAreaMetricsSection(roadAndFireBreaks: value),
                      validator: requiredValidator,
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      labelText: LocaleKeys.hectares_poaching_alleviation_zones.tr(),
                      labelTextStyle: context.textStyles.bodyNormal.copyWith(fontSize: 14),
                      initialValue: state.poachingAlleviationZone,
                      maxLines: 2,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) => cubit.onChangeAreaMetricsSection(poachingAlleviationZone: value),
                      validator: requiredValidator,
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      labelText: LocaleKeys.hectares_converted_to_grasslands.tr(),
                      labelTextStyle: context.textStyles.bodyNormal.copyWith(fontSize: 14),
                      initialValue: state.convertedToGrassland,
                      maxLines: 2,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) => cubit.onChangeAreaMetricsSection(convertedToGrassland: value),
                      validator: requiredValidator,
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      labelText: LocaleKeys.hectares_is_range_land.tr(),
                      labelTextStyle: context.textStyles.bodyNormal.copyWith(fontSize: 14),
                      initialValue: state.rangeLand,
                      maxLines: 2,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) => cubit.onChangeAreaMetricsSection(rangeLand: value),
                      validator: requiredValidator,
                    ),
                  ),
                ],
              ),
            ),
        );
      },
    );
  }
}
