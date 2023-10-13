import 'dart:convert';
import 'dart:ui';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/issue_type/issue_type.dart';
import 'package:cmo/model/labour_management/farmer_worker.dart';
import 'package:cmo/model/sanction_register/sanction_register.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_cubit.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/cmo_farm_app_bar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class DisciplinariesAddScreen extends StatefulWidget {
  const DisciplinariesAddScreen({super.key, required this.data});

  final SanctionRegister? data;
  static Future<dynamic> push(BuildContext context, {SanctionRegister? data}) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DisciplinariesAddScreen(data: data)),
    );
  }

  @override
  State<DisciplinariesAddScreen> createState() =>
      _DisciplinariesAddScreenState();
}

class _DisciplinariesAddScreenState extends State<DisciplinariesAddScreen> {
  late final GlobalKey<SfSignaturePadState> signatureKey;
  final legacySignature = ValueNotifier<Image?>(null);

  @override
  void initState() {
    super.initState();
    signatureKey = GlobalKey<SfSignaturePadState>();

    if (widget.data?.signatureImage != null) {
      legacySignature.value = Image.memory(
          base64Decode(widget.data!.signatureImage!),
          fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<DisciplinariesCubit>(
      create: (_) => DisciplinariesCubit()..initAddData(data: widget.data),
      child: Scaffold(
        appBar: CmoFarmAppBar.showTrailingAndFarmName(
          title: LocaleKeys.add_disciplinary.tr(),
        ),
        body: BlocSelector<DisciplinariesCubit, DisciplinariesState, bool>(
          selector: (state) => state.isLoading,
          builder: (context, isLoading) {
            if (isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: SingleChildScrollView(
                child: BlocBuilder<DisciplinariesCubit, DisciplinariesState>(
                  builder: (context, state) {
                    final cubit = context.read<DisciplinariesCubit>();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocSelector<DisciplinariesCubit, DisciplinariesState,
                            FarmerWorker?>(
                          selector: (state) => state.selectWorker,
                          builder: (context, selectWorker) {
                            return BottomSheetSelection(
                              hintText: LocaleKeys.workers.tr(),
                              hintTextStyle: context.textStyles.bodyNormal.blueDark2,
                              displayHorizontal: false,
                              value: selectWorker?.firstName ??
                                  state.data?.displayWorkerName ??
                                  '',
                              margin: EdgeInsets.zero,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 14),
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                if (state.workers.isBlank) return;
                                await showCustomBottomSheet<void>(
                                  context,
                                  content: ListView.builder(
                                    itemCount: state.workers.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {
                                          cubit.onChangeData(
                                              selectWorker:
                                                  state.workers[index]);
                                          Navigator.pop(context);
                                        },
                                        title: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          child: Text(
                                            state.workers[index].firstName ??
                                                '',
                                            style: context.textStyles.bodyBold
                                                .copyWith(
                                              color: context.colors.blueDark2,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        buildSelectDateIssued(),
                        const SizedBox(height: 12),
                        BlocSelector<DisciplinariesCubit, DisciplinariesState,
                            String?>(
                          selector: (state) => state.data?.campOrCompartment,
                          builder: (context, campOrCompartment) {
                            return AttributeItem(
                              child: InputAttributeItem(
                                initialValue: campOrCompartment,
                                textStyle: context.textStyles.bodyNormal.blueDark2,
                                labelText: LocaleKeys.camp_compartment.tr(),
                                labelTextStyle: context.textStyles.bodyNormal.black,
                                onChanged: (value) {
                                  cubit.onChangeData(campOrCompartment: value);
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        BlocSelector<DisciplinariesCubit, DisciplinariesState,
                            IssueType?>(
                          selector: (state) => state.selectIssue,
                          builder: (context, selectIssue) {
                            return BottomSheetSelection(
                              hintText: LocaleKeys.disciplinaries_issue.tr(),
                              hintTextStyle: context.textStyles.bodyNormal.blueDark2,
                              displayHorizontal: false,
                              value: selectIssue?.issueTypeName ??
                                  state.data?.issueTypeName,
                              margin: EdgeInsets.zero,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 14),
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                if (state.issueTypes.isBlank) return;
                                await showCustomBottomSheet<void>(
                                  context,
                                  content: ListView.builder(
                                    itemCount: state.issueTypes.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {
                                          cubit.onChangeData(
                                              selectIssue:
                                                  state.issueTypes[index]);
                                          Navigator.pop(context);
                                        },
                                        title: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          child: Text(
                                            state.issueTypes[index]
                                                    .issueTypeName ??
                                                '',
                                            style: context.textStyles.bodyBold
                                                .copyWith(
                                              color: context.colors.blueDark2,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: context.colors.black,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    LocaleKeys.generalComments.tr(),
                                    style: context.textStyles.bodyNormal.blueDark2,
                                  ),
                                ),
                              ),
                              BlocSelector<DisciplinariesCubit, DisciplinariesState,
                                  String?>(
                                selector: (state) => state.data?.comment,
                                builder: (context, comment) {
                                  return GeneralCommentWidget(
                                    hintText: '',
                                    initialValue: comment,
                                    textStyle: context.textStyles.bodyNormal.black,
                                    onChanged: (value) {
                                      cubit.onChangeData(comment: value);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          child: Text(
                            LocaleKeys.worker_signature.tr(),
                            style: context.textStyles.bodyBold
                                .copyWith(color: context.colors.black),
                          ),
                        ),
                        const SizedBox(height: 12),
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
                              builder: (context, image, __) {
                                return image ??
                                    SfSignaturePad(
                                      key: signatureKey,
                                      maximumStrokeWidth: 1,
                                      minimumStrokeWidth: 1,
                                      onDrawEnd: () async {
                                        final image = await signatureKey
                                            .currentState
                                            ?.toImage();
                                        final byteData =
                                            await image?.toByteData(
                                                format: ImageByteFormat.png);
                                        final file = await FileUtil.writeToFile(
                                            byteData!);
                                        final imageBase64 =
                                            await FileUtil.toBase64(file);

                                        cubit.onChangeData(
                                            signatureImage: imageBase64,
                                            signatureDate:
                                                DateTime.now().toString());
                                      },
                                    );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          child: CmoFilledButton(
                              title: LocaleKeys.clear_signature.tr(),
                              onTap: () {
                                legacySignature.value = null;
                                signatureKey.currentState?.clear();
                                cubit.onClearSignaturePad();
                              }),
                        ),
                        const SizedBox(height: 12),
                        BlocBuilder<DisciplinariesCubit, DisciplinariesState>(
                          builder: (context, state) {
                            return Align(
                              child: CmoFilledButton(
                                  title: LocaleKeys.save.tr(),
                                  disable: state.data?.workerId == null ||
                                      state.data!.workerId!.isBlank ||
                                      state.data?.signatureImage == null,
                                  onTap: () async {
                                    final canNext = await cubit.onSave();

                                    if (canNext && context.mounted) {
                                      Navigator.pop(context, true);
                                    }
                                  },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildSelectDateIssued() {
    return BlocBuilder<DisciplinariesCubit, DisciplinariesState>(
      builder: (context, state) {
        return AttributeItem(
          child: CmoDatePicker(
            name: 'DateIssued',
            onChanged: (date) => context.read<DisciplinariesCubit>().onChangeData(dateIssue: date),
            initialValue: state.data?.dateReceived,
            lastDate: DateTime.now(),
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 12,
              ),
              suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
              suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
              isDense: true,
              labelText: LocaleKeys.dateIssued.tr(),
              labelStyle: context.textStyles.bodyNormal.blueDark2,
            ),
          ),
        );
      },
    );
  }
}
