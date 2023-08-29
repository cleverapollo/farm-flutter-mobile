import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_membership_contract_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_collapse_title_widget.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';

class AddMemberSignContractWidget extends StatefulWidget {
  const AddMemberSignContractWidget(
      {super.key, this.farm, required this.shouldScrollBottom});

  final Farm? farm;

  final void Function(bool) shouldScrollBottom;

  @override
  State<AddMemberSignContractWidget> createState() =>
      _AddMemberSignContractWidgetState();
}

class _AddMemberSignContractWidgetState
    extends State<AddMemberSignContractWidget> {
  final signatureKey = GlobalKey<SfSignaturePadState>();

  final legacySignature = ValueNotifier<Image?>(null);

  @override
  void initState() {
    super.initState();
    if (widget.farm?.signatureImage != null) {
      legacySignature.value = Image.memory(
          base64Decode(widget.farm!.signatureImage!),
          fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (true == widget.farm?.hasSignature) {
      return CmoCollapseTitle(
          title: 'Signed Contract',
          onExpansionChanged: widget.shouldScrollBottom,
          showTick: true,
          child: const Center(child: Text('Contract has been signed')));
    }

    if (false == widget.farm?.hasSignature) {
      return CmoCollapseTitle(
          title: 'Signed Contract',
          onExpansionChanged: widget.shouldScrollBottom,
          child: ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: CmoFilledButton(
                      title: 'Finalise Now',
                      onTap: () async {
                        final state = context.read<AddMemberCubit>().state;
                        final goNextStep =
                            state.addMemberSAF.signatureImage != null;

                        if (state.addMemberMDetails.isComplete) {
                          if (goNextStep && context.mounted) {
                            await AddMemberMembershipContractScreen.push(
                                context,
                                farm: widget.farm);
                          }
                        } else {
                          context.read<AddMemberCubit>().checkErrorAllSteps();
                          showSnackError(msg: 'Should complete all steps.');
                        }
                      })),
            ),
          ));
    }

    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberSAF>(
      selector: (state) => state.addMemberSAF,
      builder: (context, addMemberSAF) {
        return CmoCollapseTitle(
          title: 'Signed Contract',
          onExpansionChanged: widget.shouldScrollBottom,
          showTick: addMemberSAF.isComplete,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: size.width,
                      color: context.colors.white,
                      child: Text(
                          LocaleKeys
                              .agree_to_the_conditions_laid_out_in_this_legally_binding_document
                              .tr(args: [
                            '${widget.farm?.firstName ?? ''} ${widget.farm?.lastName ?? ''}'
                          ]),
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
                        child: ValueListenableBuilder(
                          valueListenable: legacySignature,
                          builder: (context, signature, __) {
                            return signature ??
                                SfSignaturePad(
                                  key: signatureKey,
                                  maximumStrokeWidth: 1,
                                  minimumStrokeWidth: 1,
                                  onDrawEnd: () async {
                                    final points =
                                        signatureKey.currentState?.toString();
                                    final image = await signatureKey
                                        .currentState
                                        ?.toImage();
                                    final byteData = await image?.toByteData(
                                        format: ImageByteFormat.png);
                                    final file =
                                        await FileUtil.writeToFile(byteData!);
                                    final base64 =
                                        await FileUtil.toBase64(file);

                                    await context
                                        .read<AddMemberCubit>()
                                        .onDataChangeMemberSignContract(
                                          base64,
                                          points,
                                          DateTime.now().toIso8601String(),
                                        );

                                    legacySignature.value = Image.memory(
                                        base64Decode(base64),
                                        fit: BoxFit.cover);
                                  },
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
                              context.read<AddMemberCubit>().onClearSignature();
                            })),
                    Center(
                        child: CmoFilledButton(
                            title:
                                LocaleKeys.accept_signature_and_finalise.tr(),
                            onTap: () async {
                              final state =
                                  context.read<AddMemberCubit>().state;

                              if (state.addMemberMDetails.isComplete) {
                                if (context.mounted) {
                                  await AddMemberMembershipContractScreen.push(
                                      context,
                                      farm: widget.farm);
                                }
                              } else {
                                context
                                    .read<AddMemberCubit>()
                                    .checkErrorAllSteps();
                                showSnackError(
                                    msg: 'Should complete all steps.');
                              }
                            })),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
