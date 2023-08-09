import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:cmo/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModel {
  double? latitude;
  double? longitude;
  String? imageUri;
  List<String> listImage = <String>[];
}

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({
    super.key,
    required this.title,
    required this.locationModel,
    this.farmName,
  });

  final LocationModel locationModel;
  final String? farmName;
  final String title;

  static Future<dynamic> push(
    BuildContext context, {
    required String title,
    LocationModel? locationModel,
    String? farmName,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectLocationScreen(
          title: title,
          farmName: farmName,
          locationModel: locationModel ?? LocationModel(),
        ),
      ),
    );
  }

  @override
  State<SelectLocationScreen> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocationScreen> {
  LatLng? initLatLng;
  late LocationModel locationModel;

  final mapKey = GlobalKey<CmoMapState>();

  final ImagePickerService imagePickerService = ImagePickerService();

  bool get isEnableNextButton =>
      locationModel.latitude != null && locationModel.longitude != null;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    locationModel = widget.locationModel;
    if (locationModel.latitude != null && locationModel.longitude != null) {
      initLatLng = LatLng(locationModel.latitude!, locationModel.longitude!);
    }
  }

  void onPinned(double latitude, double longitude) {
    setState(() {
      locationModel.latitude = latitude;
      locationModel.longitude = longitude;
    });
  }

  void onRemoveMarker() {
    setState(() {
      locationModel.latitude = null;
      locationModel.longitude = null;
    });
  }

  Future<void> takePhotoFromCamera() async {
    setState(() {
      loading = true;
    });

    try {
      final croppedImage = await imagePickerService.pickImageFromCamera(
        title: DateTime.now().toString(),
      );

      if (croppedImage != null) {
        final base64 = await FileUtil.croppedFileToBase64(croppedImage);
        setState(() {
          locationModel.imageUri = croppedImage.path;
          locationModel.listImage.add(base64);
          showSnackSuccess(msg: 'Take photo successfully!');
        });
      }
    } catch (e) {
      logger.d(e.toString());
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> onSelectPhoto() async {
    setState(() {
      loading = true;
    });

    try {
      final croppedImage = await imagePickerService.pickImageFromGallery(
        title: DateTime.now().toString(),
      );

      if (croppedImage != null) {
        final base64 = await FileUtil.croppedFileToBase64(croppedImage);
        setState(() {
          locationModel.imageUri = croppedImage.path;
          locationModel.listImage.add(base64);
          showSnackSuccess(msg: 'Selected photo successfully!');
        });
      }
    } catch (e) {
      logger.d(e.toString());
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: widget.title,
        subtitle: widget.farmName ?? '',
        showTrailing: true,
      ),
      body: SizedBox.expand(
        child: ColoredBox(
          color: context.colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: CmoMap(
                  key: mapKey,
                  showMarker: true,
                  showButtonList: true,
                  onMapMoved: (_, __) {},
                  onPinned: onPinned,
                  onRemoveMarker: onRemoveMarker,
                  takePhotoFromCamera: takePhotoFromCamera,
                  onSelectPhotos: onSelectPhoto,
                  initialMapCenter: initLatLng,
                  selectedPoint: initLatLng,
                ),
              ),
              const SizedBox(height: 32),
              Align(
                child: CmoFilledButton(
                  title: LocaleKeys.next.tr(),
                  disable: !isEnableNextButton,
                  loading: loading,
                  onTap: () {
                    if (isEnableNextButton) {
                      Navigator.of(context).pop(locationModel);
                    }
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
