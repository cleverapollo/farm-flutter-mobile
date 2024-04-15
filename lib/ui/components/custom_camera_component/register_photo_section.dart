import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/custom_camera_component/register_thumbnail_photo_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';

class RegisterPhotoModel {
  final String? photo;
  final int? photoId;

  const RegisterPhotoModel({
    required this.photo,
    required this.photoId,
  });
}

class RegisterPhotoSection extends StatelessWidget {
  RegisterPhotoSection({
    required this.navigateToCamera,
    required this.onRemove,
    this.photos = const <RegisterPhotoModel>[],
    this.margin,
  });

  final void Function() navigateToCamera;
  final void Function(int?) onRemove;
  final List<RegisterPhotoModel> photos;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 21),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colors.blueDark2,
            width: 2,
          ),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: navigateToCamera,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.add_photo.tr(),
                    style: context.textStyles.bodyNormal.blueDark2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (photos.isEmpty)
                  Assets.icons.icCameraRte.svg(
                    width: 24,
                    height: 24,
                  ),
              ],
            ),
          ),
          if (photos.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: photos
                    .map(
                      (e) => RegisterThumbnailPhotoItem(
                        photo: e.photo,
                        onRemoved: () => onRemove(e.photoId),
                      ),
                    )
                    .toList()
                    .withSpaceBetween(width: 12),
              ),
            ),
            if (photos.length < Constants.MAX_UPLOADED_REGISTER_PHOTOS)
              InkWell(
                onTap: navigateToCamera,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.icAddMorePhoto.svg(
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      LocaleKeys.add_more.tr(),
                      style: context.textStyles.bodyNormal.blue,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }
}
