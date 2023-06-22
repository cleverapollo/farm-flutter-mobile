import 'dart:ui';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_cubit.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class DisciplinariesAddScreen extends StatefulWidget {
  const DisciplinariesAddScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const DisciplinariesAddScreen()),
    );
  }

  @override
  State<DisciplinariesAddScreen> createState() =>
      _DisciplinariesAddScreenState();
}

class _DisciplinariesAddScreenState extends State<DisciplinariesAddScreen> {
  late final GlobalKey<SfSignaturePadState> signatureKey;

  @override
  void initState() {
    super.initState();
    signatureKey = GlobalKey<SfSignaturePadState>();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<DisciplinariesCubit>(
      create: (_) => DisciplinariesCubit()..initAddData(),
      child: Scaffold(
        appBar: const CmoAppBarV2(
          title: 'Add Disciplinary',
          showLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: SingleChildScrollView(
            child: BlocBuilder<DisciplinariesCubit, DisciplinariesState>(
              builder: (context, state) {
                final cubit = context.read<DisciplinariesCubit>();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '* Workers',
                      style: context.textStyles.bodyBold
                          .copyWith(color: context.colors.black),
                    ),
                    CmoDropdown(
                      name: 'Workers',
                      style: context.textStyles.bodyBold
                          .copyWith(color: context.colors.black),
                      inputDecoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                        isDense: true,
                        hintText: '',
                        hintStyle: context.textStyles.bodyNormal.grey,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue),
                        ),
                      ),
                      itemsData: state.workers
                          .map((e) => CmoDropdownItem(
                              id: e.workerId, name: e.firstName ?? ''))
                          .toList(),
                      onChanged: (value) {
                        cubit.onChangeData(workerId: value);
                      },
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '* Date Issued',
                      style: context.textStyles.bodyBold
                          .copyWith(color: context.colors.black),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now()
                              .add(const Duration(days: -1000000)),
                          lastDate: DateTime.now(),
                        );

                        if (date != null) {
                          cubit.onChangeData(dateIssue: date);
                        }
                      },
                      child: AttributeItem(
                        child: SelectorAttributeItem(
                          hintText: '',
                          text: state.data?.dateReceived != null
                              ? state.data?.dateReceived?.mmmDdYyyy()
                              : '',
                          contentPadding: const EdgeInsets.all(4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Camp/Compartment',
                      style: context.textStyles.bodyBold
                          .copyWith(color: context.colors.black),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      onChanged: (value) {
                        cubit.onChangeData(campOrCompartment: value);
                      },
                      decoration: const InputDecoration(
                          //labelText: "Phone number",
                          contentPadding: EdgeInsets.all(8),
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          border: InputBorder.none),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '* Disciplinaries Issue',
                      style: context.textStyles.bodyBold
                          .copyWith(color: context.colors.black),
                    ),
                    CmoDropdown(
                      name: 'Disciplinaries Issue',
                      style: context.textStyles.bodyBold
                          .copyWith(color: context.colors.black),
                      inputDecoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                        isDense: true,
                        hintText: '',
                        hintStyle: context.textStyles.bodyNormal.grey,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue),
                        ),
                      ),
                      itemsData: state.issueTypes
                          .map((e) => CmoDropdownItem(
                              id: e.issueTypeId, name: e.issueTypeName ?? ''))
                          .toList(),
                      onChanged: (value) {
                        cubit.onChangeData(issueId: value);
                      },
                    ),
                    const SizedBox(height: 12),
                    AttributeItem(
                      child: SelectorAttributeItem(
                        hintText: LocaleKeys.car_raised.tr(),
                        text: LocaleKeys.car_raised.tr(),
                        contentPadding: const EdgeInsets.all(4),
                        trailing: SizedBox(
                          width: 24,
                          child: Switch(
                            value: state.data?.carRaisedDate != null,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (bool value) {
                              cubit.onChangeData(carRaised: value);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    AttributeItem(
                      child: SelectorAttributeItem(
                        hintText: LocaleKeys.car_closed.tr(),
                        text: LocaleKeys.car_closed.tr(),
                        contentPadding: const EdgeInsets.all(4),
                        trailing: SizedBox(
                          width: 24,
                          child: Switch(
                            value: state.data?.carClosedDate != null,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (bool value) {
                              cubit.onChangeData(carClosed: value);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'General Comments',
                      style: context.textStyles.bodyBold
                          .copyWith(color: context.colors.black),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      onChanged: (value) {
                        cubit.onChangeData(comment: value);
                      },
                      decoration: const InputDecoration(
                          //labelText: "Phone number",
                          contentPadding: EdgeInsets.all(
                              8), //  <- you can it to 0.0 for no space
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          border: InputBorder.none),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      child: Text(
                        'Worker Signature',
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
                        child: SfSignaturePad(
                          key: signatureKey,
                          maximumStrokeWidth: 1,
                          minimumStrokeWidth: 1,
                          onDrawEnd: () async {
                            final imageFuture =
                                await signatureKey.currentState?.toImage();
                            if (imageFuture == null) {
                              return;
                            }
                            final byteData = await imageFuture.toByteData(
                                format: ImageByteFormat.png);
                            if (byteData == null) {
                              return;
                            }
                            final signatureFile =
                                await FileUtil.writeToFile(byteData);

                            cubit.onChangeData(
                                signatureImage: signatureFile.path);
                            cubit.onChangeData(
                                signatureDate: DateTime.now().toString());
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      child: CmoFilledButton(
                          title: 'Clear Signature',
                          onTap: () {
                            signatureKey.currentState?.clear();
                            cubit.onClearSignaturePad();
                          }),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      child: CmoFilledButton(
                          title: 'Save', onTap: () => cubit.onSave()),
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
