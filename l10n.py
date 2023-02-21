import json
import sys
import os

data = sys.argv[1:]
count = 2
if len(data) % (count + 1) != 0:
    raise Exception('Invalid data')

en_path = "assets/l10n/en-US.json"
fr_path = "assets/l10n/fr-FR.json"

with open(en_path) as en_f:
    en_decoded = json.load(en_f)
with open(fr_path) as en_f:
    fr_decoded = json.load(en_f)

for i in range(0, len(data), count + 1):
    key = data[i]
    if en_decoded.get(key) is not None or fr_decoded.get(key) is not None:
        print(key, 'exists')
        continue

    en = data[i + 1]
    fr = data[i + 2]
    en_decoded[key] = en
    fr_decoded[key] = fr

with open(en_path, 'w') as f:
    json.dump(en_decoded, f, indent=2)
with open(fr_path, 'w') as f:
    json.dump(fr_decoded, f, indent=2)

os.system('flutter pub run easy_localization:generate -S assets/l10n -O lib/l10n -f keys -o locale_keys.g.dart')
