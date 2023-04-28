import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_step2_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/compartments/compartment_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/member_detail/site_location_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddCampScreen extends StatefulWidget {
  AddCampScreen({Key? key}) : super(key: key);

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AddCampScreen()),
    );
  }

  @override
  State<AddCampScreen> createState() => _AddCampScreenState();
}

class _AddCampScreenState extends State<AddCampScreen> {

  Camp camp = Camp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.site.tr(),
        subtitle: 'Imbeza',
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
                child: Column(
                  children: [
                    AttributeItem(
                      child: InputAttributeItem(
                        maxLines: 1,
                        hintText: LocaleKeys.campName.tr(),
                        onChanged: (value) => camp.campName = value,
                      ),
                    ),
                    AttributeItem(
                      child: InputAttributeItem(
                        maxLines: 2,
                        keyboardType: TextInputType.number,
                        hintText: LocaleKeys.hectares_camp_protected.tr(),
                        onChanged: (value) => camp.protectedArea = double.tryParse(value),
                      ),
                    ),
                    AttributeItem(
                      child: InputAttributeItem(
                        maxLines: 2,
                        keyboardType: TextInputType.number,
                        hintText: LocaleKeys.hectares_camp_cattle_posts_housing.tr(),
                        onChanged: (value) => camp.cattlePostHousing = double.tryParse(value),
                      ),
                    ),
                    AttributeItem(
                      child: InputAttributeItem(
                        maxLines: 2,
                        keyboardType: TextInputType.number,
                        hintText: LocaleKeys.hectares_are_corridors.tr(),
                        onChanged: (value) => camp.corridors = double.tryParse(value),
                      ),
                    ),
                    AttributeItem(
                      child: InputAttributeItem(
                        maxLines: 2,
                        keyboardType: TextInputType.number,
                        hintText: LocaleKeys.hectares_road_fire_breaks.tr(),
                        onChanged: (value) => camp.roadAndFireBreaks = double.tryParse(value),
                      ),
                    ),
                    AttributeItem(
                      child: InputAttributeItem(
                        maxLines: 2,
                        keyboardType: TextInputType.number,
                        hintText: LocaleKeys.hectares_poaching_alleviation_zones.tr(),
                        onChanged: (value) => camp.poachingAlleviationZone = double.tryParse(value),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final latLong = await SiteLocationScreen.push(context, camp.latitude == null ? null : LatLng(camp.latitude!, camp.longitude!));
                        if (latLong == null) {
                          return;
                        }
                        camp.latitude = latLong[0] as double;
                        camp.longitude = latLong[1] as double;
                        setState(() {});
                      },
                      child: AttributeItem(
                        child: SelectorAttributeItem(
                          hintText: LocaleKeys.siteLocation.tr(),
                          text: camp.latitude == null ? null:
                          '${camp.latitude!.toStringAsFixed(6)}, ${camp.longitude!.toStringAsFixed(6)}',
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

  void _next() {
    AddCampStep2Screen.push(context, camp);
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
