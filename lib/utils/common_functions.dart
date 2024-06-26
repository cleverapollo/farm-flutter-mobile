import 'package:cmo/extensions/string.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommonFunctions {

  static Future<void> openMap(double latitude, double longitude) async {
    final googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    await openUrl(googleUrl);
  }

  static Future<void> openUrl(String? url) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (url.isBlank) {
      return;
    }

    if (await canLaunchUrlString(url!)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      showSnackError(msg:'Could not launch $url');
    }
  }

  static Future<void> sendEmail(String? email) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (email.isBlank) {
      return;
    }

    final url = 'mailto:$email';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      showSnackError(msg:'Could not send email to $email');
    }
  }

  static Future<void> makePhoneCall(String? phoneNumber) async {
    FocusManager.instance.primaryFocus?.unfocus();
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
    FocusManager.instance.primaryFocus?.unfocus();
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
}
