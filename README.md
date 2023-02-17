# CMO - Supply Chain Integrity

Use `flutter_gen` to generate assets and fonts:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

To generate localization keys after adding new strings to `assets/l10n`:

```
flutter pub run easy_localization:generate -S assets/l10n -O lib/l10n -f keys -o locale_keys.g.dart
```

or run `python l10n.py <key> <en> <fr>` add strings and generate `LocaleKeys`.