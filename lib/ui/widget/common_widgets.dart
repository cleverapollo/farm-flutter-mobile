import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AttributeItem extends StatelessWidget {
  final Widget child;

  const AttributeItem({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: context.colors.grey),
        ),
      ),
      child: child,
    );
  }
}

class GeoLocationText extends StatelessWidget {
  final LatLng? latLong;
  const GeoLocationText({this.latLong, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'Lat | Long',
          ),
          const TextSpan(
            text: ' ',
          ),
          TextSpan(
            text: latLong?.latitude.toStringAsFixed(6)  ?? '',
            style: context.textStyles.bodyNormal,
          ),
          TextSpan(
            text: ', ',
            style: context.textStyles.bodyNormal,
          ),
          TextSpan(
            text: latLong?.longitude.toStringAsFixed(6)  ?? '',
            style: context.textStyles.bodyNormal,
          ),
        ],
      ),
      style: context.textStyles.bodyBold,
    );
  }
}