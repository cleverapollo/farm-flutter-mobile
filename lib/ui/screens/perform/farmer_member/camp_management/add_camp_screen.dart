import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/compartments/compartment_detail_screen.dart';
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
                        onChanged: (value) => camp.hectaresCampProtected = double.tryParse(value),
                      ),
                    ),
                    AttributeItem(
                      child: InputAttributeItem(
                        maxLines: 2,
                        keyboardType: TextInputType.number,
                        hintText: LocaleKeys.hectares_camp_cattle_posts_housing.tr(),
                        onChanged: (value) => camp.hectaresCampCattlePostsHousing = double.tryParse(value),
                      ),
                    ),
                    AttributeItem(
                      child: InputAttributeItem(
                        maxLines: 2,
                        keyboardType: TextInputType.number,
                        hintText: LocaleKeys.hectares_are_corridors.tr(),
                        onChanged: (value) => camp.hectaresAreCorridors = double.tryParse(value),
                      ),
                    ),
                    AttributeItem(
                      child: InputAttributeItem(
                        maxLines: 2,
                        keyboardType: TextInputType.number,
                        hintText: LocaleKeys.hectares_road_fire_breaks.tr(),
                        onChanged: (value) => camp.hectaresRoadFireBreaks = double.tryParse(value),
                      ),
                    ),
                    AttributeItem(
                      child: InputAttributeItem(
                        maxLines: 2,
                        keyboardType: TextInputType.number,
                        hintText: LocaleKeys.hectares_poaching_alleviation_zones.tr(),
                        onChanged: (value) => camp.hectaresPoachingAlleviationZones = double.tryParse(value),
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
          )
        ],
      ),
    );
  }
}

class InputAttributeItem extends StatefulWidget {
  final String hintText;
  final int maxLines;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const InputAttributeItem({
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.onChanged,
    super.key,
  });

  @override
  State<InputAttributeItem> createState() => _InputAttributeItemState();
}

class _InputAttributeItemState extends State<InputAttributeItem> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      onChanged: widget.onChanged,
      maxLines: _controller.text.isEmpty ? widget.maxLines : 1,
      controller: _controller,
      style: context.textStyles.bodyBold,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: _controller.text.isEmpty ? null : widget.hintText,
        labelStyle: context.textStyles.bodyNormal.copyWith(fontSize: 16, overflow: TextOverflow.ellipsis),
        hintStyle: context.textStyles.bodyNormal.copyWith(color: context.colors.grey),
        contentPadding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}

class SelectorAttributeItem extends StatelessWidget {
  final String hintText;
  final String? text;

  const SelectorAttributeItem({
    required this.hintText,
    this.text,
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
              contentPadding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Assets.icons.icArrowRight.svgBlack,
        const SizedBox(width: 16),
      ],
    );
  }
}

class Camp {
  double? latitude;
  double? longitude;
  String? campName;
  double? hectaresCampProtected;
  double? hectaresCampCattlePostsHousing;
  double? hectaresAreCorridors;
  double? hectaresRoadFireBreaks;
  double? hectaresPoachingAlleviationZones;
}

