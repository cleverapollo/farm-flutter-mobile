import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'CMO_API_URL', obfuscate: true)
  static final cmoApiUrl = _Env.cmoApiUrl;

  @EnviedField(varName: 'CMO_PUBSUB_APIKEY', obfuscate: true)
  static final cmoPubsubApiKey = _Env.cmoPubsubApiKey;

  @EnviedField(varName: 'GOOGLE_MAPS_API_KEY', obfuscate: true)
  static final googleMapsApiKey = _Env.googleMapsApiKey;

  @EnviedField(varName: 'GOOGLE_PLACE_API_KEY', obfuscate: true)
  static final googlePlaceApiKey = _Env.googlePlaceApiKey;

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

  @EnviedField(varName: 'PERFORM_APP_INSIGHTS_INSTRUMENT_KEY', obfuscate: true)
  static final performAppInsightsInstrumentKey = _Env.performAppInsightsInstrumentKey;

  @EnviedField(varName: 'APSTORY_MQ_API_URL', obfuscate: true)
  static final apstoryMqApiUrl = _Env.apstoryMqApiUrl;

  @EnviedField(varName: 'BEHAVE_APSTORY_MQ_KEY', obfuscate: true)
  static final behaveApstoryMqKey = _Env.behaveApstoryMqKey;

  @EnviedField(varName: 'PERFORM_APSTORY_MQ_KEY', obfuscate: true)
  static final performApstoryMqKey = _Env.performApstoryMqKey;

  @EnviedField(varName: 'BEHAVE_DNN_AUTH_URL', obfuscate: true)
  static final behaveDnnAuthUrl = _Env.behaveDnnAuthUrl;

  @EnviedField(varName: 'PERFORM_DNN_AUTH_URL', obfuscate: true)
  static final performDnnAuthUrl = _Env.performDnnAuthUrl;

  @EnviedField(varName: 'BEHAVE_DNN_API_URL', obfuscate: true)
  static final behaveDnnApiUrl = _Env.behaveDnnApiUrl;

  @EnviedField(varName: 'PERFORM_DNN_API_URL', obfuscate: true)
  static final performDnnApiUrl = _Env.performDnnApiUrl;

  @EnviedField(varName: 'DB_SCHEMA_VERSION', obfuscate: true)
  static final dbSchemaVersion = _Env.dbSchemaVersion;

  @EnviedField(varName: 'FORCE_RESYNC', obfuscate: true)
  static final forceResync = _Env.forceResync;

  @EnviedField(varName: 'PERFORM_FORESTRY_URL', obfuscate: true)
  static final performForestryUrl = _Env.performForestryUrl;

  @EnviedField(varName: 'API_GROUP_SCHEME_URL', obfuscate: true)
  static final apiGroupSchemeUrl = _Env.apiGroupSchemeUrl;
}
