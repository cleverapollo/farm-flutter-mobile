import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/components/loading_circle.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:cmo/utils/logger.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModel {
  double? latitude;
  double? longitude;
  String? imageUri;
  List<String> listImage = <String>[];
}

class SelectLocationScreen extends BaseStatefulWidget {
  SelectLocationScreen({
    super.key,
    required this.title,
    required this.locationModel,
    this.farmName,
    this.shouldShowPhotoButton = true,
    this.shouldShowDangerIcon = false,
    this.shouldShowBackIcon = false,
    this.alwaysEnableSaveButton,
    this.saveTitle,
    this.onSave,
  }) : super(screenName: title);

  final LocationModel locationModel;
  final String? farmName;
  final String title;
  final String? saveTitle;
  final bool shouldShowPhotoButton;
  final bool shouldShowDangerIcon;
  final bool shouldShowBackIcon;
  final bool? alwaysEnableSaveButton;
  final void Function(LocationModel)? onSave;

  static Future<dynamic> push(
    BuildContext context, {
    required String title,
    LocationModel? locationModel,
    String? farmName,
    bool shouldShowPhotoButton = true,
    bool shouldShowDangerIcon = false,
    bool shouldShowBackIcon = false,
    bool? alwaysEnableSaveButton,
    String? saveTitle,
    void Function(LocationModel)? onSave,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectLocationScreen(
          title: title,
          farmName: farmName,
          locationModel: locationModel ?? LocationModel(),
          shouldShowPhotoButton: shouldShowPhotoButton,
          shouldShowDangerIcon: shouldShowDangerIcon,
          shouldShowBackIcon: shouldShowBackIcon,
          alwaysEnableSaveButton: alwaysEnableSaveButton,
          saveTitle: saveTitle,
          onSave: onSave,
        ),
      ),
    );
  }

  @override
  State<SelectLocationScreen> createState() => _SelectLocationState();
}

class _SelectLocationState extends BaseStatefulWidgetState<SelectLocationScreen> {
  LatLng? initLatLng;
  late LocationModel locationModel;

  final mapKey = GlobalKey<CmoMapState>();

  final ImagePickerService imagePickerService = ImagePickerService();

  bool get isEnableNextButton =>
      widget.alwaysEnableSaveButton ??
      (locationModel.latitude != null && locationModel.longitude != null);

  bool loading = true;

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
    return Stack(
      children: [
        Positioned.fill(
          child: Scaffold(
            appBar: CmoAppBar(
              title: widget.title,
              subtitle: widget.farmName ?? '',
              trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
              onTapTrailing: Navigator.of(context).pop,
              leading: widget.shouldShowBackIcon ? Assets.icons.icBackButton.svgBlack : null,
              onTapLeading: Navigator.of(context).pop,
            ),
            body: SizedBox.expand(
                    child: ColoredBox(
                      color: context.colors.white,
                      child: Column(
                        children: [
                          if (widget.shouldShowDangerIcon)
                            Icon(
                              IconsaxOutline.danger,
                              size: 30.0,
                              color: context.colors.red,
                            ),
                          Expanded(
                            flex: 6,
                            child: CmoMap(
                              key: mapKey,
                              showMarker: true,
                              showButtonList: true,
                              onMapMoved: (_, __) {},
                              onPinned: onPinned,
                              shouldShowPhotoButton: widget.shouldShowPhotoButton,
                              onRemoveMarker: onRemoveMarker,
                              takePhotoFromCamera: takePhotoFromCamera,
                              onSelectPhotos: onSelectPhoto,
                              initialMapCenter: initLatLng,
                              selectedPoint: initLatLng,
                              onMapCreated: () {
                                setState(() {
                                  loading = false;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 32),
                          Align(
                            child: CmoFilledButton(
                              title: widget.saveTitle ?? LocaleKeys.next.tr(),
                              disable: !isEnableNextButton,
                              loading: loading,
                              onTap: () {
                                if (isEnableNextButton) {
                                  if (widget.onSave == null) {
                                    Navigator.of(context).pop(locationModel);
                                  } else {
                                    widget.onSave!(locationModel);
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).padding.bottom),
                        ],
                      ),
                    ),
                  ),

          ),
        ),

        if (loading)
          Positioned.fill(
            child: LoadingCircle(),
          ),
      ],
    );
  }
}
