import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final _signatureController = HandSignatureControl(
    velocityRange: 3.0,
  );
  String? _legacySignature;

  void _handleClearButtonPressed() {
    _signatureController.clear();
    _legacySignature = null;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    cmoDatabaseMasterService
        .getCachedAssessment(id: widget.assessmentId)
        .then((assessment) {
      if (assessment?.signatureImage != null) {
        _legacySignature = assessment?.signatureImage;
        setState(() {});
      }
    });
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
            child: Column(
              children: [
                BlocSelector<UserInfoCubit, UserInfoState, String?>(
                  selector: (state) => state.userInfo?.userEmail,
                  builder: (context, userEmail) {
                    return Text(
                      LocaleKeys.iNameDeclareThatIWasAssessedByEmailOnDate.tr(
                        namedArgs: {
                          'name': 'hereby',
                          'email': userEmail ?? '',
                          'date': DateTime.now().yMd(),
                        },
                      ),
                      style: context.textStyles.bodyNormal,
                    );
                  },
                ),
              ],
            ),
          ),
          LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              return Center(
                child: Container(
                  width: constraints.maxWidth - 32 * 2,
                  height: constraints.maxWidth - 32 * 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: context.colors.grey),
                  ),
                  child: _legacySignature == null
                      ? HandSignature(
                          control: _signatureController,
                          color: Colors.blueGrey,
                          width: 3.0,
                          maxWidth: 4.0,
                        )
                      : SvgPicture.string(_legacySignature!),
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
              var assessment = await cmoDatabaseMasterService.getCachedAssessment(id: widget.assessmentId);
              assessment = assessment
                  ?.copyWith(signatureImage: _signatureController.toSvg());
              if (assessment != null) {
                await cmoDatabaseMasterService.cacheAssessment(assessment);
              }
              if (context.mounted) Navigator.of(context).pop();
            },
          ),
          const SafeArea(top: false, child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
