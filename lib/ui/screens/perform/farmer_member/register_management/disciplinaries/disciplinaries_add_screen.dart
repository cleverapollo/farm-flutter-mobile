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
import 'package:cmo/ui/components/date_picker_widget.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/components/bottom_sheet_selection/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../widgets/information_text_widget.dart';

class DisciplinariesAddScreen extends BaseStatefulWidget {
  DisciplinariesAddScreen({
    super.key,
    this.data,
  }) : super(
    screenName: data == null
        ? LocaleKeys.add_disciplinary.tr()
        : LocaleKeys.disciplinary_detail.tr(),
  );


  final SanctionRegister? data;
  static Future<dynamic> push(BuildContext context, {SanctionRegister? data}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider<DisciplinariesCubit>(
          create: (_) => DisciplinariesCubit()..initAddData(data: data),
          child: DisciplinariesAddScreen(data: data),
        ),
      ),
    );
  }

  @override
  State<DisciplinariesAddScreen> createState() =>
      _DisciplinariesAddScreenState();
}

class _DisciplinariesAddScreenState extends BaseStatefulWidgetState<DisciplinariesAddScreen> {
  late final GlobalKey<SfSignaturePadState> signatureKey;
  final legacySignature = ValueNotifier<Image?>(null);

  @override
  void initState() {
    super.initState();
    signatureKey = GlobalKey<SfSignaturePadState>();

    if (widget.data?.signatureImage != null) {
      legacySignature.value = Image.memory(
          base64Decode(widget.data!.signatureImage.base64SyncServerToString!),
          fit: BoxFit.cover);
    }
  }

  @override
  bool get canPopWithoutWarningDialog => !context.read<DisciplinariesCubit>().state.isEdit;

  @override
  Widget buildContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CmoAppBar(
          title: widget.data == null
              ? LocaleKeys.add_disciplinary.tr()
              : LocaleKeys.disciplinary_detail.tr(),
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: onShowWarningDispose,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: onShowWarningDispose,
        ),
        body: BlocSelector<DisciplinariesCubit, DisciplinariesState, bool>(
          selector: (state) => state.isLoading,
          builder: (context, isLoading) {
            if (isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SingleChildScrollView(
                child: BlocBuilder<DisciplinariesCubit, DisciplinariesState>(
                  builder: (context, state) {
                    final cubit = context.read<DisciplinariesCubit>();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        CmoHeaderTile(
                          title: LocaleKeys.details.tr(),
                          backgroundColor: context.colors.blueDark2,
                        ),
                        BlocSelector<DisciplinariesCubit, DisciplinariesState,
                            FarmerWorker?>(
                          selector: (state) => state.selectWorker,
                          builder: (context, selectWorker) {
                            return BottomSheetSelection(
                              isShowError: state.isSelectWorkerError,
                              hintText: LocaleKeys.workers.tr(),
                              hintTextStyle: context.textStyles.bodyBold.blueDark3,
                              displayHorizontal: false,
                              value: selectWorker?.fullName ??
                                  state.data?.displayWorkerName ??
                                  '',
                              margin: const EdgeInsets.symmetric(horizontal: 24),
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
                                          cubit.onSelectWorker(state.workers[index]);
                                          Navigator.pop(context);
                                        },
                                        title: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          child: Text(
                                            state.workers[index].fullName,
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
                        buildSelectDateIssued(),
                        BlocSelector<DisciplinariesCubit, DisciplinariesState,
                            IssueType?>(
                          selector: (state) => state.selectIssue,
                          builder: (context, selectIssue) {
                            return BottomSheetSelection(
                              isShowError: state.isDisciplinariesIssueError,
                              hintText: LocaleKeys.disciplinaries_issue.tr(),
                              hintTextStyle: context.textStyles.bodyBold.blueDark2,
                              displayHorizontal: false,
                              value: selectIssue?.issueTypeName ??
                                  state.data?.issueTypeName,
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
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
                                          cubit.onSelectIssue(state.issueTypes[index]);
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
                        InformationText(),
                        CmoHeaderTile(
                          title: LocaleKeys.additional_details_optional.tr(),
                          backgroundColor: context.colors.blueDark2,
                        ),
                        BlocSelector<DisciplinariesCubit, DisciplinariesState,
                            String?>(
                          selector: (state) => state.data?.campOrCompartment,
                          builder: (context, campOrCompartment) {
                            return AttributeItem(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
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
                        BlocSelector<DisciplinariesCubit, DisciplinariesState, String?>(
                          selector: (state) => state.data?.descriptionOfSanction,
                          builder: (context, descriptionOfSanction) {
                            return AttributeItem(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              child: InputAttributeItem(
                                initialValue: descriptionOfSanction,
                                textStyle: context.textStyles.bodyNormal.blueDark2,
                                labelText: LocaleKeys.disciplinaries_steps_taken.tr(),
                                labelTextStyle: context.textStyles.bodyNormal.black,
                                onChanged: (value) {
                                  cubit.onChangeData(descriptionOfSanction: value);
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: BlocSelector<DisciplinariesCubit, DisciplinariesState,
                              String?>(
                            selector: (state) => state.data?.comment,
                            builder: (context, comment) {
                              return GeneralCommentWidget(
                                hintText: '',
                                initialValue: comment,
                                shouldShowTitle: true,
                                height: 100,
                                textStyle: context.textStyles.bodyNormal.black,
                                onChanged: (value) {
                                  cubit.onChangeData(comment: value);
                                },
                              );
                            },
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
                                            signaturePoint: signatureKey.currentState?.toString(),
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
                                  title: LocaleKeys.accept_signature_and_save.tr(),
                                disable: state.data?.workerId == null &&
                                    state.data?.dateReceived == null &&
                                    state.data?.issueTypeId == null &&
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
    );
  }

  Widget buildSelectDateIssued() {
    return BlocBuilder<DisciplinariesCubit, DisciplinariesState>(
      builder: (context, state) {
        return AttributeItem(
          isShowError: state.isDateIssuedError,
          errorText: LocaleKeys.required.tr(),
          isUnderErrorBorder: true,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: DatePickerWidget(
            lastDate: DateTime.now(),
            initialDate: state.data?.dateReceived,
            title: LocaleKeys.dateIssued.tr(),
            firstDate: DateTime.now().subtract(const Duration(days: Constants.DEFAULT_DAY_DURATION_OFFSET)),
            onConfirm: context.read<DisciplinariesCubit>().onSelectDateIssued,
          ),
        );
      },
    );
  }
}
