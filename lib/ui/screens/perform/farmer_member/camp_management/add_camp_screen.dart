import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_cubit.dart';
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

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return BlocProvider(
          create: (_) => AddCampCubit(),
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
                          maxLines: 1,
                          hintText: LocaleKeys.campName.tr(),
                          onChanged: (value) => cubit.onCampNameChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          maxLines: 2,
                          keyboardType: TextInputType.number,
                          hintText: LocaleKeys.hectares_camp_protected.tr(),
                          onChanged: (value) => cubit.onProtectedAreaChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          maxLines: 2,
                          keyboardType: TextInputType.number,
                          hintText: LocaleKeys.hectares_camp_cattle_posts_housing.tr(),
                          onChanged: (value) => cubit.onCattlePostHousingChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          maxLines: 2,
                          keyboardType: TextInputType.number,
                          hintText: LocaleKeys.hectares_are_corridors.tr(),
                          onChanged: (value) => cubit.onCorridorsChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
                          maxLines: 2,
                          keyboardType: TextInputType.number,
                          hintText: LocaleKeys.hectares_road_fire_breaks.tr(),
                          onChanged: (value) => cubit.onRoadAndFireBreaksChanged(value),
                          validator:requiredValidator,
                        ),
                      ),
                      AttributeItem(
                        child: InputAttributeItem(
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
                          await CompartmentScreen.push(context);
                        },
                        child: AttributeItem(
                          child: SelectorAttributeItem(
                            hintText: LocaleKeys.compartments.tr(),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await ASIScreen.push(context);
                        },
                        child: AttributeItem(
                          child: SelectorAttributeItem(
                            hintText: LocaleKeys.asi.tr(),
                          ),
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
    await cubit.saveCamp();
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
