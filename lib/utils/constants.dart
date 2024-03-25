// ignore_for_file: constant_identifier_names

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Constants {
  static const int MAX_UPLOADED_PHOTOS_AUDIT = 10;
  static const int MAX_UPLOADED_REGISTER_PHOTOS = 3;
  static const int IMAGE_QUALITY = 30;
  static const int MAX_FARM_STEPS = 7;
  static const double IMAGE_MAXHEIGHT = 1024.0;
  static const double IMAGE_MAXWIDTH = 1024.0;
  static const behaveRoleName = "CMO Behave Platform";
  static const performRoleName = "CMO GroupScheme Platform";
  static const regionalManagerRoleName = "Regional Manager";
  static const LatLng mapCenter = LatLng(-26.024176, 28.042453);
  static const double mapZoom = 18.0;
  static const int DEFAULT_DAY_DURATION_OFFSET = 10000;
}

class SecureStorageConstant {
  static const String USER_PASSWORD = 'user_password';
  static const String USER_NAME = 'user_name';
  static const String BEHAVE_ACCESS_TOKEN = 'behave_access_token';
  static const String PERFORM_ACCESS_TOKEN = 'perform_access_token';
  static const String BEHAVE_RENEWAL_TOKEN = 'behave_renewal_token';
  static const String PERFORM_RENEWAL_TOKEN = 'perform_renewal_token';
}
