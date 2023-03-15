# CMO - Supply Chain Integrity

## L10n
Use `flutter_gen` to generate assets and fonts:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

To generate localization keys after adding new strings to `assets/l10n`:

```
flutter pub run easy_localization:generate -S assets/l10n -O lib/l10n -f keys -o locale_keys.g.dart
```

or run `python l10n.py <key> <en> <fr>` to add strings and generate `LocaleKeys`.

## ENV
Use `envied` to generate .env:

Create `.env` file
```
PUBSUB_APIKEY=xxx
APP_MODE=behave; (behave, resource_manager, farmer)
```

Run this to generate file lib/env/env.g.dart
```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

Protip: add `obfuscate:true` not hardcoded & making it much harder to extract if an attacker decompiles our app .