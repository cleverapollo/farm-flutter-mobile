import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtils {
  Future<bool> hasInternet () async {
    final connectionStatus = await Connectivity().checkConnectivity();
    return  connectionStatus != ConnectivityResult.none;
  }
}