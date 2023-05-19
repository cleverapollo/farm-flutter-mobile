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

  @EnviedField(varName: 'VERSION', obfuscate: true)
  static final version = _Env.version;

  @EnviedField(varName: 'ENV', obfuscate: true)
  static final env = _Env.env;

  @EnviedField(varName: 'PRODUCTION', obfuscate: true)
  static final production = _Env.production;

  @EnviedField(varName: 'LOGGING_LEVEL_CONSOLE', obfuscate: true)
  static final loggingLevelConsole = _Env.loggingLevelConsole;

  @EnviedField(varName: 'BEHAVE_APP_INSIGHTS_INSTRUMENT_KEY', obfuscate: true)
  static final behaveAppInsightsInstrumentKey = _Env.behaveAppInsightsInstrumentKey;

  @EnviedField(varName: 'APSTORY_MQ_API_URL', obfuscate: true)
  static final apstoryMqApiUrl = _Env.apstoryMqApiUrl;

  @EnviedField(varName: 'BEHAVE_APSTORY_MQ_KEY', obfuscate: true)
  static final behaveApstoryMqKey = _Env.behaveApstoryMqKey;

  @EnviedField(varName: 'PERFORM_APP_INSIGHTS_INSTRUMENT_KEY', obfuscate: true)
  static final performAppInsightsInstrumentKey = _Env.performAppInsightsInstrumentKey;

  @EnviedField(varName: 'PERFORM_APSTORY_MQ_KEY', obfuscate: true)
  static final performApstoryMqKey = _Env.performApstoryMqKey;

  @EnviedField(varName: 'DNN_AUTH_URL', obfuscate: true)
  static final dnnAuthUrl = _Env.dnnAuthUrl;

  @EnviedField(varName: 'DNN_API_URL', obfuscate: true)
  static final dnnApiUrl = _Env.dnnApiUrl;

  @EnviedField(varName: 'DB_SCHEMA_VERSION', obfuscate: true)
  static final dbSchemaVersion = _Env.dbSchemaVersion;

  @EnviedField(varName: 'FORCE_RESYNC', obfuscate: true)
  static final forceResync = _Env.forceResync;
}
