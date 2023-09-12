import 'dart:convert';
import 'dart:ui';

import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_done_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_membership_contract_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_collapse_title_widget.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

enum AddMemberContractEnum {
  newSign,
  signed,
  unsigned,
}

class AddMemberSignContractWidget extends StatefulWidget {
  const AddMemberSignContractWidget(
      {super.key, this.farm, required this.shouldScrollBottom});

  final Farm? farm;

  final void Function(bool isExpanded, bool isCompleted) shouldScrollBottom;

  @override
  State<AddMemberSignContractWidget> createState() =>
      _AddMemberSignContractWidgetState();
}

class _AddMemberSignContractWidgetState
    extends State<AddMemberSignContractWidget> {
  final signatureKey = GlobalKey<SfSignaturePadState>();

  final legacySignature = ValueNotifier<Image?>(null);
  final signValue = ValueNotifier(AddMemberContractEnum.newSign);

  @override
  void initState() {
    super.initState();
    if (widget.farm?.signatureImage != null) {
      legacySignature.value = Image.memory(
          base64Decode(widget.farm!.signatureImage!),
          fit: BoxFit.cover);
    }

    if (0 == widget.farm?.isLocal) {
      if (true == widget.farm?.hasSignature) {
        signValue.value = AddMemberContractEnum.signed;
      } else {
        signValue.value = AddMemberContractEnum.unsigned;
      }
    } else {
      signValue.value = AddMemberContractEnum.newSign;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ValueListenableBuilder(
        valueListenable: signValue,
        builder: (context, signValue, __) {
          switch (signValue) {
            case AddMemberContractEnum.newSign:
              return _addMemberNewSignWidget(size);
            case AddMemberContractEnum.signed:
              return _addMemberSignedWidget();
            case AddMemberContractEnum.unsigned:
              return _addMemberUnSignedWidget();
          }
        });
  }

  Widget _addMemberUnSignedWidget() {
    return CmoCollapseTitle(
        title: 'Signed Contract',
        onExpansionChanged: (p0) {
          widget.shouldScrollBottom.call(false, true);
        },
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: CmoFilledButton(
                    title: 'Finalise Now',
                    onTap: () async {
                      final state = context.read<AddMemberCubit>().state;

                      if (state.addMemberMDetails.isComplete &&
                          context.mounted) {
                        await AddMemberMembershipContractScreen.push(context,
                            farm: state.farm);
                      } else {
                        context.read<AddMemberCubit>().checkErrorAllSteps();
                        showSnackError(msg: 'Should complete all steps.');
                      }
                    })),
          ),
        ));
  }

  Widget _addMemberSignedWidget() {
    return CmoCollapseTitle(
        title: 'Signed Contract',
        onExpansionChanged: (p0) {
          widget.shouldScrollBottom.call(false, true);
        },
        showTick: true,
        child: ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Text('Contract has been signed',
                      style: context.textStyles.bodyNormal
                          .copyWith(color: context.colors.black))),
            )));
  }

  Widget _addMemberNewSignWidget(Size size) {
    return BlocBuilder<AddMemberCubit, AddMemberState>(
      buildWhen: (previous, current) =>
          previous.farm != current.farm ||
          previous.addMemberSAF != current.addMemberSAF,
      builder: (context, state) {
        return CmoCollapseTitle(
          title: 'Signed Contract',
          onExpansionChanged: (p0) {
            widget.shouldScrollBottom.call(p0, state.addMemberSAF.isComplete);
          },
          showTick: state.addMemberSAF.isComplete,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Html(
                  data: html
                      .replaceAll("{{farm.FirstName}}",
                          state.farm?.firstName ?? widget.farm?.firstName ?? '')
                      .replaceAll("{{farm.LastName}}",
                          state.farm?.lastName ?? widget.farm?.lastName ?? '')
                      .replaceAll("{{hectares}}",
                          (widget.farm?.farmSize ?? 0).toStringAsFixed(2))
                      .replaceAll("{{farm.SiteName}}",
                          state.farm?.farmName ?? widget.farm?.farmName ?? ''),
                ),
                const Divider(thickness: 5),
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
                            '${state.farm?.firstName ?? widget.farm?.firstName ?? ''} ${state.farm?.lastName ?? widget.farm?.lastName ?? ''}'
                                .trimLeft()
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

                              if (state.isAllCompleted) {
                                if (context.mounted) {
                                  await AddMemberDone.push(context,
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
