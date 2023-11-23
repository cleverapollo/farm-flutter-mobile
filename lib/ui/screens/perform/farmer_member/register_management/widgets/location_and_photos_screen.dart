import 'dart:convert';
import 'dart:io';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MapAndPhotoScreen extends StatefulWidget {
  const MapAndPhotoScreen({super.key, required this.title});

  final String title;

  static Future push(BuildContext context, {required String title}) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => MapAndPhotoScreen(title: title)));
  }

  @override
  State<MapAndPhotoScreen> createState() => _MapAndPhotoScreenState();
}

class _MapAndPhotoScreenState extends State<MapAndPhotoScreen> {
  double? _latitude;
  double? _longitude;
  final List<String> _imageBase64 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: widget.title,
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Expanded(
            child: CmoMap(
              onMapMoved: (latitude, longitude) {
                _latitude = latitude;
                _longitude = longitude;
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
                    final image = await ImagePicker().pickImage(
                        source: ImageSource.gallery, imageQuality: 30);

                    if (image?.path == null) return;

                    final imageFile = File(image!.path); //convert Path to File
                    final imageBytes =
                        await imageFile.readAsBytes(); //convert to bytes
                    final base64String = base64.encode(imageBytes);

                    _imageBase64.add('data:image/jpeg;base64,$base64String');
                  },
                ),
              ),
              Align(
                child: CmoFilledButton(
                  title: LocaleKeys.takePhoto.tr(),
                  onTap: () async {
                    final image = await ImagePicker().pickImage(
                        source: ImageSource.camera, imageQuality: 30);

                    if (image?.path == null) return;

                    final imageFile = File(image!.path); //convert Path to File
                    final imageBytes =
                        await imageFile.readAsBytes(); //convert to bytes
                    final base64String = base64.encode(imageBytes);

                    _imageBase64.add('data:image/jpeg;base64,$base64String');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: CmoFilledButton(
              title: LocaleKeys.save.tr(),
              onTap: () => Navigator.of(context).pop(LocationResult(
                latitude: _latitude,
                longitude: _longitude,
                photoBase64: _imageBase64,
              )),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class LocationResult {
  LocationResult(
      {this.latitude, this.longitude, this.photoBase64 = const <String>[]});

  final double? latitude;
  final double? longitude;
  final List<String> photoBase64;
}
