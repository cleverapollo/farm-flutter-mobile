import 'package:cmo/utils/utils.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

//Picks and crops image from gallery
class ImagePickerService {
  // * Add the following keys to your Info.plist file, located in <project root>/ios/Runner/Info.plist:
  // NSPhotoLibraryUsageDescription - describe why your app needs permission for the photo library. This is called Privacy - Photo Library Usage Description in the visual editor.
  // NSCameraUsageDescription - describe why your app needs access to the camera. This is called Privacy - Camera Usage Description in the visual editor.
  // NSMicrophoneUsageDescription - describe why your app needs access to the microphone, if you intend to record videos. This is called Privacy - Microphone Usage Description in the visual editor.

  final ImagePicker _imagePicker = ImagePicker();
  final ImageCropper _imageCropper = ImageCropper();

  Future<CroppedFile?> pickImageFromGallery({
    String? title,
  }) async {
    final imageFromGallery = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: Constants.IMAGE_QUALITY,
      maxHeight: Constants.IMAGE_MAXHEIGHT,
      maxWidth: Constants.IMAGE_MAXWIDTH,
    );

    return _imageCropper.cropImage(
      sourcePath: imageFromGallery!.path,
      maxHeight: 1920,
      maxWidth: 1080,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: title ?? 'Crop Image',
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: title ?? 'Crop Image'),
      ],
    );
  }

  Future<CroppedFile?> pickImageFromCamera({
    String? title,
  }) async {
    final imageFromGallery = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: Constants.IMAGE_QUALITY,
      maxHeight: Constants.IMAGE_MAXHEIGHT,
      maxWidth: Constants.IMAGE_MAXWIDTH,
    );

    return _imageCropper.cropImage(
      sourcePath: imageFromGallery!.path,
      maxHeight: 1920,
      maxWidth: 1080,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: title ?? 'Crop Image',
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: title ?? 'Crop Image'),
      ],
    );
  }
}
