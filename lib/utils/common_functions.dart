import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommonFunctions {
  static Future<void> makePhoneCall(String? phoneNumber) async {
    if (phoneNumber.isBlank) {
      return;
    }

    final url = 'tel:$phoneNumber';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      showSnackError(msg:'Could not make a phone call to $phoneNumber');
    }
  }

  static Future<void> sendSms(String? phoneNumber) async {
    if (phoneNumber.isBlank) {
      return;
    }

    final url = 'sms:$phoneNumber';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      showSnackError(msg:'Could not send sms to $phoneNumber');
    }
  }

  static Future<Marker> generateMarkerFromLatLng(LatLng position) async {
    return Marker(
      markerId: MarkerId('place_name_${position.latitude}_${position.longitude}'),
      position: position,
      icon: await BitmapDescriptorHelper.getBitmapDescriptorFromSvgAsset(
        Assets.icons.mapPolygonPoint.path,
        const Size(8, 8),
      ),
    );
  }
}
