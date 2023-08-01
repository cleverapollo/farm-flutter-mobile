import 'dart:convert';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hand_signature/signature.dart';

class AssessmentSignatureScreen extends StatefulWidget {
  const AssessmentSignatureScreen({
    super.key,
    required this.assessmentId,
  });

  final int assessmentId;

  static void push(
    BuildContext context,
    Assessment assessment,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AssessmentSignatureScreen(
          assessmentId: assessment.id,
        ),
      ),
    );
  }

  @override
  State<AssessmentSignatureScreen> createState() =>
      _AssessmentSignatureScreenState();
}

class _AssessmentSignatureScreenState extends State<AssessmentSignatureScreen> {
  final legacySignature = ValueNotifier<Image?>(null);

  final _signatureController = HandSignatureControl(
    velocityRange: 3.0,
  );

  UserInfo? userInfo;

  void _handleClearButtonPressed() {
    legacySignature.value = null;
    _signatureController.clear();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    try {
      cmoDatabaseMasterService
          .getCachedAssessment(id: widget.assessmentId)
          .then((assessment) {
        if (assessment?.signatureImage != null) {
          legacySignature.value = Image.memory(
              base64Decode(assessment!.signatureImage!),
              fit: BoxFit.cover);
        }
      });

      Future.microtask(() async {
        userInfo = await configService.getActiveUser();
        setState(() {});
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.assessments.tr(),
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Row(),
          const SizedBox(height: 16),
          CmoHeaderTile(title: LocaleKeys.signature.tr()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(
              LocaleKeys.iNameDeclareThatIWasAssessedByEmailOnDate.tr(
                namedArgs: {
                  'name': 'hereby',
                  'email': userInfo?.userEmail ?? '',
                  'date': DateTime.now().yMd(),
                },
              ),
              style: context.textStyles.bodyNormal,
            ),
          ),
          LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              return Center(
                child: ValueListenableBuilder(
                  valueListenable: legacySignature,
                  builder: (context, image, __) {
                    return Container(
                        width: constraints.maxWidth - 32 * 2,
                        height: constraints.maxWidth - 32 * 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: context.colors.grey),
                        ),
                        child: image ??
                            HandSignature(
                              control: _signatureController,
                              color: Colors.blueGrey,
                              width: 3.0,
                              maxWidth: 4.0,
                            ));
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          CmoFilledButton(
            title: LocaleKeys.clear.tr(),
            onTap: _handleClearButtonPressed,
          ),
          const SizedBox(height: 24),
          CmoFilledButton(
            title: LocaleKeys.acceptSignature.tr(),
            onTap: () async {
              try {
                var assessment = await cmoDatabaseMasterService
                    .getCachedAssessment(id: widget.assessmentId);

                final image = await _signatureController.toImage();

                final file = await FileUtil.writeToFile(image!);
                final imageBase64 = await FileUtil.toBase64(file);

                assessment = assessment?.copyWith(
                  signatureImage: imageBase64,
                  signatureDate: DateTime.now().toIso8601String(),
                );

                if (assessment != null) {
                  await cmoDatabaseMasterService.cacheAssessment(assessment);
                }
                if (context.mounted) Navigator.of(context).pop();
              } catch (e) {
                debugPrint(e.toString());
              }
            },
          ),
          const SafeArea(top: false, child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
