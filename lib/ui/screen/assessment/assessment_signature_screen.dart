import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class AssessmentSignatureScreen extends StatefulWidget {
  const AssessmentSignatureScreen({
    super.key,
    required this.assessment,
  });

  final Assessment assessment;

  static void push(
    BuildContext context,
    Assessment assessment,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AssessmentSignatureScreen(
          assessment: assessment,
        ),
      ),
    );
  }

  @override
  State<AssessmentSignatureScreen> createState() =>
      _AssessmentSignatureScreenState();
}

class _AssessmentSignatureScreenState extends State<AssessmentSignatureScreen> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
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
                  child: SfSignaturePad(
                    key: signatureGlobalKey,
                    // backgroundColor: Colors.white,
                    strokeColor: Colors.black,
                    minimumStrokeWidth: 2.0,
                    maximumStrokeWidth: 4.0,
                  ),
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
              final data = await signatureGlobalKey.currentState!
                  .toImage(pixelRatio: 3.0);

              if (context.mounted) Navigator.of(context).pop();
            },
          ),
          const SafeArea(top: false, child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
