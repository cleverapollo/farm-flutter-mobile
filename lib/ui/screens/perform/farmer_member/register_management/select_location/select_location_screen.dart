import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';

class LocationModel {
  double? latitude;
  double? longitude;
  String? imageUri;
}

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({
    super.key,
    required this.appbarTitle,
  });

  final String appbarTitle;

  @override
  State<StatefulWidget> createState() => _SelectLocationScreenState();

  static Future push(BuildContext context, String appbarTitle) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectLocationScreen(appbarTitle: appbarTitle),
      ),
    );
  }
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  final ImagePickerService _imagePickerService = ImagePickerService();
  final _locationModel = LocationModel()
    ..latitude = Constants.mapCenter.latitude
    ..longitude = Constants.mapCenter.longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: widget.appbarTitle,
        showLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: CmoMap(
              onMapMoved: (latitude, longitude) {
                _locationModel.latitude = latitude;
                _locationModel.longitude = longitude;
              },
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                child: CmoFilledButton(
                  title: LocaleKeys.selectPhoto.tr(),
                  onTap: () async {
                    _locationModel.imageUri =
                        (await _imagePickerService.pickImageFromGallery())
                            ?.path;
                  },
                ),
              ),
              Align(
                child: CmoFilledButton(
                  title: LocaleKeys.takePhoto.tr(),
                  onTap: () async {
                    _locationModel.imageUri =
                        (await _imagePickerService.pickImageFromCamera())?.path;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: CmoFilledButton(
              title: LocaleKeys.save.tr(),
              onTap: () => save(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void save() {
    Navigator.of(context).pop(_locationModel);
  }
}
