import 'dart:convert';
import 'dart:ui';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignatureWidget extends StatelessWidget {
  final void Function(String? image, String? points) onDrawEnd;
  final void Function() onClearSignature;

  final double height;

  SignatureWidget({
    required this.onDrawEnd,
    required this.onClearSignature,
    String? signatureImage,
    this.height = 200,
  }) {
    if (signatureImage.isNotBlank) {
      legacySignature.value = Image.memory(
        base64Decode(signatureImage!.base64SyncServerToString!),
        fit: BoxFit.cover,
      );
    }
  }

  final signatureKey = GlobalKey<SfSignaturePadState>();
  final legacySignature = ValueNotifier<Image?>(null);

  Future<void> _onDrawEnd() async {
    final points = signatureKey.currentState?.toString();
    final image = await signatureKey.currentState?.toImage();
    final byteData = await image?.toByteData(format: ImageByteFormat.png);
    final file = await FileUtil.writeToFile(byteData!);
    final base64 = await FileUtil.toBase64(file);
    onDrawEnd(base64, points);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ValueListenableBuilder(
              valueListenable: legacySignature,
              builder: (context, signature, __) {
                return signature ??
                    SfSignaturePad(
                      key: signatureKey,
                      maximumStrokeWidth: 1,
                      minimumStrokeWidth: 1,
                      onDrawEnd: _onDrawEnd,
                    );
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: CmoFilledButton(
            title: LocaleKeys.clear.tr(),
            onTap: () async {
              legacySignature.value = null;
              signatureKey.currentState?.clear();
              onClearSignature();
            },
          ),
        ),
      ],
    );
  }
}
