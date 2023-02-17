import json
import sys
import os

data = sys.argv[1:]
if (len(data) % 2 != 0):
    raise Exception('Invalid data')

en_path = "assets/l10n/en-US.json"

with open(en_path) as en_f:
    en_decoded = json.load(en_f)

for i in range(0, len(data), 2):
    key = data[i]
    if en_decoded.get(key) is not None:
        print(key, 'exists')
        continue

    en = data[i + 1]
    en_decoded[key] = en

with open(en_path, 'w') as f:
    json.dump(en_decoded, f, indent=2)

os.system('flutter pub run easy_localization:generate -S assets/l10n -O lib/l10n -f keys -o locale_keys.g.dart')
