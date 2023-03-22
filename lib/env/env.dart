import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'CMO_API_URL', obfuscate: true)
  static final cmoApiUrl = _Env.cmoApiUrl;

  @EnviedField(varName: 'CMO_PUBSUB_APIKEY', obfuscate: true)
  static final cmoPubsubApiKey = _Env.cmoPubsubApiKey;

  @EnviedField(varName: 'CMO_APP_MODE', obfuscate: true)
  static final cmoAppMode = _Env.cmoAppMode;

  @EnviedField(varName: 'GOOGLE_MAPS_API_KEY', obfuscate: true)
  static final googleMapsApiKey = _Env.googleMapsApiKey;
}
