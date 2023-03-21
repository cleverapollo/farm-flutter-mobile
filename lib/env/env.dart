import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'PUBSUB_APIKEY', obfuscate: true)
  static final pubsubApiKey = _Env.pubsubApiKey;

  @EnviedField(varName: 'GOOGLE_MAPS_API_KEY', obfuscate: true)
  static final googleMapsApiKey = _Env.googleMapsApiKey;

  @EnviedField(varName: 'APP_MODE', obfuscate: true)
  static final appMode = _Env.appMode;
}
