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

or run `python l10n.py <key> <en> <fr> <ms> <th> <zu>` to add strings and generate `LocaleKeys`.

## ENV

Use `envied` to generate .env:

Create `.env` file

```
CMO_API_URL=xxx
CMO_PUBSUB_APIKEY=xxx
CMO_APP_MODE=behave; (behave, resource_manager, farmer)
GOOGLE_MAPS_API_KEY=xxxxxx
```

Run this to generate file lib/env/env.g.dart

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

Protip: To enhance security, add `obfuscate:true` (instead of hardcoding) to make it more difficult for attackers to extract our app.

## Google Map Key

Double-check that the files containing your GOOGLE_MAPS_API_KEY contain the correct data. These files include:

⚠️ Warning: Create/Edit `ios/Runner/keys.plist` using Xcode. Avoid editing it with other code editors.

```
.env
android/local.properties
ios/Runner/keys.plist
```


## Sort import

Run:

```
flutter pub run import_sorter:main
```