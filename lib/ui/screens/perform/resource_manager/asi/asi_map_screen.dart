import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:cmo/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ASIMapScreen extends StatefulWidget {
  final String? farmName;
  final String farmId;
  final String? campId;

  const ASIMapScreen({
    super.key,
    required this.farmId,
    this.farmName,
    this.campId,
  });

  static Future<void> push(
    BuildContext context, {
    String? farmId,
    String? farmName,
    String? campId,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ASIMapScreen(
          farmId: farmId ?? '',
          farmName: farmName,
            campId: campId,
        ),
      ),
    );
  }

  @override
  State<ASIMapScreen> createState() => _ASIMapScreenState();
}

class _ASIMapScreenState extends State<ASIMapScreen> {

  late LocationModel locationModel;

  final mapKey = GlobalKey<CmoMapState>();

  final ImagePickerService imagePickerService = ImagePickerService();

  bool get isEnableNextButton => locationModel.latitude != null && locationModel.longitude != null;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    locationModel = LocationModel();
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
        /// Comment code for supporting multiple image
        // final uint8ListImage = await croppedImage.readAsBytes();
        // final imageFile = await FileUtil.writeToFileWithUint8List(uint8ListImage);
        // final base64 = await FileUtil.toBase64(imageFile);
        setState(() {

          locationModel.imageUri = croppedImage.path;
          // locationModel.listImage.add(base64);
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
        /// Comment code for supporting multiple image
        // final uint8ListImage = await croppedImage.readAsBytes();
        // final imageFile = await FileUtil.writeToFileWithUint8List(uint8ListImage);
        // final base64 = await FileUtil.toBase64(imageFile);
        setState(() {

          locationModel.imageUri = croppedImage.path;
          // locationModel.listImage.add(base64);
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
        title: LocaleKeys.asi.tr(),
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
                        ASIDetailScreen.push(
                          context,
                          farmId: widget.farmId,
                          farmName: widget.farmName,
                          locationModel: locationModel,
                          campId: widget.campId,
                        );
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
