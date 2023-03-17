import json
import sys
import os

data = sys.argv[1:]
count = 5
if len(data) % (count + 1) != 0:
    raise Exception('Invalid data')

en_path = "assets/l10n/en.json"
fr_path = "assets/l10n/fr.json"
ms_path = "assets/l10n/ms.json"
th_path = "assets/l10n/th.json"
zu_path = "assets/l10n/zu.json"

with open(en_path) as en_f:
    en_decoded = json.load(en_f)
with open(fr_path) as fr_f:
    fr_decoded = json.load(fr_f)
with open(ms_path) as ms_f:
    ms_decoded = json.load(ms_f)
with open(th_path) as th_f:
    th_decoded = json.load(th_f)
with open(zu_path) as zu_f:
    zu_decoded = json.load(zu_f)

for i in range(0, len(data), count + 1):
    key = data[i]
    if (
        en_decoded.get(key) is not None
        or fr_decoded.get(key) is not None
        or ms_decoded.get(key) is not None
        or th_decoded.get(key) is not None
        or zu_decoded.get(key) is not None
    ):
        print(key, 'exists')
        continue
    print(data, 'data')

    en = data[i + 1]
    fr = data[i + 2]
    ms = data[i + 3]
    th = data[i + 4]
    zu = data[i + 5]

    en_decoded[key] = en
    fr_decoded[key] = fr
    ms_decoded[key] = ms
    th_decoded[key] = th
    zu_decoded[key] = zu

with open(en_path, 'w') as f:
    json.dump(en_decoded, f, indent=2, sort_keys=True, ensure_ascii=False)
with open(fr_path, 'w') as f:
    json.dump(fr_decoded, f, indent=2, sort_keys=True, ensure_ascii=False)
with open(ms_path, 'w') as f:
    json.dump(ms_decoded, f, indent=2, sort_keys=True, ensure_ascii=False)
with open(th_path, 'w') as f:
    json.dump(th_decoded, f, indent=2, sort_keys=True, ensure_ascii=False)
with open(zu_path, 'w') as f:
    json.dump(zu_decoded, f, indent=2, sort_keys=True, ensure_ascii=False)

os.system('flutter pub run easy_localization:generate -S assets/l10n -O lib/l10n -f keys -o locale_keys.g.dart')
