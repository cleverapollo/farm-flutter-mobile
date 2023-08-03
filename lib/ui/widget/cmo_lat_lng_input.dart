import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CmoLatLngInput extends StatelessWidget {
  const CmoLatLngInput({
    required this.latLong,
    required this.onLatLngChanged,
    super.key,
  });

  final LatLng? latLong;
  final ValueChanged<String>? onLatLngChanged;


  String _getLatLngText() {
    return latLong != null ? '${latLong!.latitude.toStringAsFixed(6)}, ${latLong!.longitude.toStringAsFixed(6)}' : '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          Text(
            LocaleKeys.lat_long.tr(),
            style: context.textStyles.bodyBold,
          ),
          Expanded(
            child: InputAttributeItem(
              textStyle: context.textStyles.bodyNormal,
              initialValue: _getLatLngText(),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 2,
              ),
              isDense: true,
              keyboardType: TextInputType.number,
              onChanged: onLatLngChanged,
            ),
          )
        ],
      ),
    );
  }
}
