import 'dart:convert';
import 'dart:typed_data';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RteSpeciesPhotoSection extends StatelessWidget {

  RteSpeciesPhotoSection({
    required this.navigateToCamera,
    required this.onRemove,
  });

  final void Function() navigateToCamera;
  final void Function(RteSpeciesPhotoModel) onRemove;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RteSpeciesDetailCubit, RteSpeciesDetailState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 21),
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
                    if (state.rtePhotos.isEmpty)
                      Assets.icons.icCameraRte.svg(
                        width: 24,
                        height: 24,
                      ),
                  ],
                ),
              ),
              if (state.rtePhotos.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: state.rtePhotos
                        .map(
                          (e) => RteSpeciesPhotoItem(
                            rteSpeciesPhotoModel: e,
                            onRemoved: () => onRemove(e),
                          ),
                        )
                        .toList()
                        .withSpaceBetween(width: 12),
                  ),
                ),
                if (state.rtePhotos.length < Constants.MAX_UPLOADED_PHOTOS_RTE_SPECIES)
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
              ]
            ],
          ),
        );
      },
    );
  }
}

class RteSpeciesPhotoItem extends StatelessWidget {
  final RteSpeciesPhotoModel rteSpeciesPhotoModel;
  final void Function()? onRemoved;

  const RteSpeciesPhotoItem({
    required this.rteSpeciesPhotoModel,
    this.onRemoved,
  });

  Future<Uint8List?> decodeImage() async {
    try {
      return base64Decode(rteSpeciesPhotoModel.photo ?? '');
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    const heightImage = 74.0;
    const widthImage = 80.0;
    return FutureBuilder(
      future: decodeImage(),
      builder: (context, snap) {
        if (snap.data == null) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          width: widthImage,
          height: heightImage,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (rteSpeciesPhotoModel.photo.isNotBlank) {
                    final imageProvider = MemoryImage(
                        base64Decode(rteSpeciesPhotoModel.photo ?? ''));
                    showImageViewer(context, imageProvider);
                  }
                },
                child: Image.memory(
                  snap.data!,
                  fit: BoxFit.fitHeight,
                  width: widthImage,
                  height: heightImage,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => onRemoved?.call(),
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.topRight,
                    child: Assets.icons.icUpdatedCloseButton.svg(
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
