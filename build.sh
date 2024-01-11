#get variable
while getopts ":e:" opt; do
  case ${opt} in
    e) env="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

flutter clean

if [[ ! -z "$env" ]]; then
  #Update environment
  printf "Environment now: $env\n"
  cp -a lib/env/"${env}"/.env .env
  printf "Setup environment finish\n"
else
  printf "Environment must be set!!!!!\n"
fi

flutter packages get

flutter pub run easy_localization:generate -S assets/l10n -O lib/l10n -f keys -o locale_keys.g.dart

flutter packages pub run build_runner build --delete-conflicting-outputs

flutter build apk