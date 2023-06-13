import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../../widget/cmo_app_bar_v2.dart';
import '../../../../widget/cmo_buttons.dart';
import 'add_member_done_screen.dart';

class AddMemberSignContractScreen extends StatefulWidget {
  const AddMemberSignContractScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => const AddMemberSignContractScreen()));
  }

  @override
  State<AddMemberSignContractScreen> createState() =>
      _AddMemberSignContractScreenState();
}

class _AddMemberSignContractScreenState
    extends State<AddMemberSignContractScreen> {
  final signatureKey = GlobalKey<SfSignaturePadState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.addMember.tr(),
        subtitle: LocaleKeys.siteName.tr(),
        showTrailing: true,
      ),
      body: SizedBox.expand(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                width: size.width,
                color: context.colors.white,
                child: Text(
                  LocaleKeys.agree_to_the_conditions_laid_out_in_this_legally_binding_document.tr(args: ['XXXxx']),
                    style: context.textStyles.bodyNormal
                        .copyWith(color: context.colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: size.height * 0.5,
                  width: size.width,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12)),
                  child: SfSignaturePad(
                    key: signatureKey,
                    maximumStrokeWidth: 1,
                    minimumStrokeWidth: 1,
                    onDrawStart: () {
                      return false;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                  child: CmoFilledButton(
                      title: LocaleKeys.clear.tr(),
                      onTap: () {
                        signatureKey.currentState?.clear();
                      })),
              const Spacer(),
              Center(
                  child: CmoFilledButton(
                      title: LocaleKeys.accept_signature_and_finalise.tr(),
                      onTap: () {
                        AddMemberDone.push(context);
                      })),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
