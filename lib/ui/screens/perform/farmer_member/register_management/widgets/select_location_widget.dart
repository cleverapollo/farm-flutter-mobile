import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/location_and_photos_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class SelectLocationWidget extends StatefulWidget {
  const SelectLocationWidget({
    super.key,
    required this.appbarTitle,
    required this.longitudeTitle,
    required this.latitudeTitle,
    required this.onChooseLocation,
    this.lng = '',
    this.lat = '',
  });

  final String latitudeTitle;
  final String longitudeTitle;
  final String appbarTitle;
  final String lng;
  final String lat;
  final void Function(LocationResult) onChooseLocation;

  @override
  State<StatefulWidget> createState() => _SelectLocationWidgetState();
}

class _SelectLocationWidgetState extends State<SelectLocationWidget> {
  late LocationResult locationModel;

  @override
  void initState() {
    super.initState();
    locationModel = LocationResult();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await MapAndPhotoScreen.push(
          context,
          title: widget.appbarTitle,
        );
        if (result == null) return;
        final mapResult = result as LocationResult;
        locationModel = mapResult;
        setState(() {});
        widget.onChooseLocation(locationModel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AttributeItem(
            child: _buildAutoFillWidget(
              widget.latitudeTitle,
              '${locationModel.latitude ?? widget.lat}',
            ),
          ),
          AttributeItem(
            child: _buildAutoFillWidget(
              widget.longitudeTitle,
              '${locationModel.longitude ?? widget.lng}',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAutoFillWidget(
    String key,
    String? value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            key,
            style: context.textStyles.bodyBold.black,
          ),
          Row(
            children: [
              Text(
                value ?? '',
                style: context.textStyles.bodyNormal.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
