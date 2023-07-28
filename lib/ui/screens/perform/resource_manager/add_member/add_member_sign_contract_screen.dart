import 'dart:developer';
import 'dart:ui';

import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_done_screen.dart';

class AddMemberSignContractScreen extends StatefulWidget {
  const AddMemberSignContractScreen({super.key, this.farm});
  final Farm? farm;

  static Future<void> push(BuildContext context, {Farm? farm}) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => AddMemberSignContractScreen(farm: farm,)));
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
        subtitle: widget.farm?.farmName ?? '',
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
                    LocaleKeys
                        .agree_to_the_conditions_laid_out_in_this_legally_binding_document
                        .tr(args: ['${widget.farm?.firstName ?? ''} ${widget.farm?.lastName ?? ''}']),
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
                    onDrawEnd: (){
                      setState(() {

                      });
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
                      onTap: () async {
                        final points = signatureKey.currentState?.toString();
                        final image = await signatureKey.currentState?.toImage();
                        final byteData = await image?.toByteData(format: ImageByteFormat.png);
                        final file = await FileUtil.writeToFile(byteData!);
                        final base64 = await FileUtil.toBase64(file);

                        await context
                            .read<AddMemberCubit>()
                            .onDataChangeMemberSignContract(
                              base64,
                              points,
                              DateTime.now().toIso8601String(),
                            );

                        final state =
                            context.read<AddMemberCubit>().state.addMemberSAF;
                        final goNextStep = state.signatureImage != null;
                        if (goNextStep && context.mounted) {
                          await AddMemberDone.push(context, farm: widget.farm);
                        }
                      })),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
