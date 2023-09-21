import 'package:cmo/extensions/string.dart';
import 'package:cmo/ui/ui.dart';
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
}
