import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_cubit.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_step2_screen.dart';
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

class AddCampScreen extends StatefulWidget {
  AddCampScreen({Key? key}) : super(key: key);

  static Future push(BuildContext context, {Camp? camp}) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return BlocProvider(
          create: (_) => AddCampCubit(camp: camp)..init(),
          child: AddCampScreen(),
        );
      },),
    );
  }

  @override
  State<AddCampScreen> createState() => _AddCampScreenState();
}

class _AddCampScreenState extends State<AddCampScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late AddCampCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddCampCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.site.tr(),
        subtitle: LocaleKeys.imbeza.tr(),
        showLeading: true,
        showTrailing: true,
        trailing: Assets.icons.icClose.svgBlack,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          CmoHeaderTile(
            title:
                '${LocaleKeys.areaMetrics.tr()} - ${LocaleKeys.total.tr()} 7ha',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      AttributeItem(
                        child: InputAttributeItem(
                          initialValue: cubit.state.camp?.campName,
                          maxLines: 1,
                          hintText: LocaleKeys.campName.tr(),
                          onChanged: (value) => cubit.onCampNameChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          initialValue: cubit.state.camp?.protectedArea?.toString(),
                          maxLines: 2,
                          keyboardType: TextInputType.number,
                          hintText: LocaleKeys.hectares_camp_protected.tr(),
                          onChanged: (value) => cubit.onProtectedAreaChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          initialValue: cubit.state.camp?.protectedArea?.toString(),
                          maxLines: 2,
                          keyboardType: TextInputType.number,
                          hintText: LocaleKeys.hectares_camp_cattle_posts_housing.tr(),
                          onChanged: (value) => cubit.onCattlePostHousingChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          initialValue: cubit.state.camp?.corridors?.toString(),
                          maxLines: 2,
                          keyboardType: TextInputType.number,
                          hintText: LocaleKeys.hectares_are_corridors.tr(),
                          onChanged: (value) => cubit.onCorridorsChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          initialValue: cubit.state.camp?.roadAndFireBreaks?.toString(),
                          maxLines: 2,
                          keyboardType: TextInputType.number,
                          hintText: LocaleKeys.hectares_road_fire_breaks.tr(),
                          onChanged: (value) => cubit.onRoadAndFireBreaksChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          initialValue: cubit.state.camp?.poachingAlleviationZone?.toString(),
                          maxLines: 2,
                          keyboardType: TextInputType.number,
                          hintText: LocaleKeys.hectares_poaching_alleviation_zones.tr(),
                          onChanged: (value) => cubit.onPoachingAlleviationZoneChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final latLong = await SiteLocationScreen.push(
                              context,
                              cubit.state.camp?.latitude == null
                                  ? null
                                  : LatLng(
                                      cubit.state.camp!.latitude!,
                                      cubit.state.camp!.longitude!,
                                    ));
                          cubit.onLocationChanged(
                            latitude: latLong[0] as double,
                            longitude: latLong[1] as double,
                          );
                          setState(() {});
                        },
                        child: AttributeItem(
                          child: SelectorAttributeItem(
                            hintText: LocaleKeys.siteLocation.tr(),
                            text: cubit.state.camp?.latitude == null ? null:
                            '${cubit.state.camp!.latitude!.toStringAsFixed(6)}, ${cubit.state.camp!.longitude!.toStringAsFixed(6)}',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final result = await CompartmentScreen.push(
                            context,
                            farmId: cubit.state.farm?.farmId,
                            farmName: cubit.state.farm?.farmName,
                            campId: cubit.state.camp?.campId,
                          );
                          if (result != null) {
                            cubit.onCompartmentChanged(
                                addingCompartmentResult: result!);
                          }
                        },
                        child: BlocSelector<AddCampCubit, AddCampState, List<Compartment>>(
                          selector: (state) => state.compartments,
                          builder: (context, compartments) {
                            return AttributeItem(
                              child: SelectorAttributeItem(
                                hintText: LocaleKeys.compartments.tr(),
                                text: compartments.isNotEmpty
                                    ? LocaleKeys.compartments.tr()
                                    : null,
                                trailing: compartments.isEmpty
                                    ? null
                                    : Row(
                                        children: [
                                          Assets.icons.icTick.widget,
                                          const SizedBox(width: 8),
                                          Assets.icons.icArrowRight.svgBlack,
                                        ],
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final result = await ASIScreen.push(
                            context,
                            farmId: cubit.state.farm?.farmId,
                            farmName: cubit.state.farm?.farmName,
                            campId: cubit.state.camp?.campId,
                          );
                          if (result != null) {
                            cubit.onAsisChanged(asis: result);
                          }
                        },
                        child: BlocSelector<AddCampCubit, AddCampState, List<Asi>>(
                          selector: (state) => state.asis,
                          builder: (context, asis) {
                            return AttributeItem(
                              child: SelectorAttributeItem(
                                hintText: LocaleKeys.asi.tr(),
                                text: asis.isNotEmpty
                                    ? LocaleKeys.asi.tr()
                                    : null,
                                trailing: asis.isEmpty
                                    ? null
                                    : Row(
                                  children: [
                                    Assets.icons.icTick.widget,
                                    const SizedBox(width: 8),
                                    Assets.icons.icArrowRight.svgBlack,
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: CmoFilledButton(
              title: LocaleKeys.next.tr(),
              onTap: () => _next(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Future _next() async{
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    await cubit.saveCamp(context);
    AddCampStep2Screen.push(context, cubit);
  }
}

class SelectorAttributeItem extends StatelessWidget {
  final String hintText;
  final String? text;
  final Widget? textWidget;
  final EdgeInsetsGeometry contentPadding;
  final Widget? trailing;

  const SelectorAttributeItem({
    required this.hintText,
    this.text,
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
            style: context.textStyles.bodyBold,
            enabled: false,
            decoration: InputDecoration(
              hintText: hintText,
              isCollapsed: true,
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
