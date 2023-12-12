import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_employee_grievance/add_employee_grievance_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/information_text_widget.dart';

class AddEmployeeGrievanceScreen extends BaseStatefulWidget {

  final bool isAddNew;

  AddEmployeeGrievanceScreen({
    super.key,
    required this.isAddNew,
  }) : super(
    screenName: isAddNew
        ? LocaleKeys.addEmployeeGrievance.tr()
        : LocaleKeys.edit_employee_grievance.tr(),
  );

  @override
  State<StatefulWidget> createState() => _AddEmployeeGrievanceScreenState();

  static Future<GrievanceRegister?> push(
    BuildContext context, {
    required Farm farm,
    GrievanceRegister? employeeGrievance,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AddEmployeeGrievanceCubit(
              farm: farm,
              isAddNew: employeeGrievance == null,
              employeeGrievance: employeeGrievance ??
                  GrievanceRegister(
                    farmId: farm.farmId,
                    grievanceRegisterNo:
                        DateTime.now().millisecondsSinceEpoch.toString(),
                    dateReceived: DateTime.now(),
                    isActive: true,
                    isMasterdataSynced: false,
                    createDT: DateTime.now(),
                    updateDT: DateTime.now(),
                  ),
            ),
            child: AddEmployeeGrievanceScreen(isAddNew: employeeGrievance == null),
          );
        },
      ),
    );
  }
}

class _AddEmployeeGrievanceScreenState extends BaseStatefulWidgetState<AddEmployeeGrievanceScreen> {
  late final AddEmployeeGrievanceCubit cubit;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddEmployeeGrievanceCubit>();
  }

  Future<void> onSubmit() async {
    setState(() {
      loading = true;
    });
    try {
      await hideInputMethod();
      var employeeGrievance = cubit.state.employeeGrievance;
      employeeGrievance = employeeGrievance.copyWith(
        isActive: true,
        isMasterdataSynced: false,
        createDT: employeeGrievance.createDT ?? DateTime.now(),
        updateDT: DateTime.now(),
      );

      int? resultId;

      if (mounted) {
        final databaseService = cmoDatabaseMasterService;

        await (await databaseService.db).writeTxn(() async {
          resultId = await databaseService.cacheEmployeeGrievance(employeeGrievance);
        });
      }

      if (resultId != null) {
        if (context.mounted) {
          showSnackSuccess(
            msg:
                '${cubit.state.isAddNew ? LocaleKeys.addEmployeeGrievance.tr() : LocaleKeys.edit_employee_grievance.tr()} $resultId',
          );
          Navigator.of(context).pop(employeeGrievance);
        }
      }
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final initState = cubit.state;
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: initState.isAddNew
              ? LocaleKeys.addEmployeeGrievance.tr()
              : LocaleKeys.edit_employee_grievance.tr(),
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: SafeArea(
          child: AutofillGroup(
            child: BlocSelector<AddEmployeeGrievanceCubit,
                AddEmployeeGrievanceState, bool>(
              selector: (state) => state.isDataReady,
              builder: (context, isDataReady) {
                if (!isDataReady) {
                  return const SizedBox.shrink();
                }
                final employeeGrievance = cubit.state.employeeGrievance;
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),
                      CmoHeaderTile(
                        title: LocaleKeys.nameOfWorker.tr(),
                        backgroundColor: context.colors.blueDark2,
                      ),
                      _selectWorkerName(),
                      InformationText(),
                      CmoHeaderTile(
                        title: LocaleKeys.additional_details_optional.tr(),
                        backgroundColor: context.colors.blueDark2,
                      ),
                      _selectGrievanceIssue(),
                      _buildSelectDateReceived(
                        employeeGrievance.dateReceived,
                      ),
                      _selectAllocatedTo(),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: GeneralCommentWidget(
                          height: 120,
                          maxLines: 2,
                          shouldShowTitle: true,
                          initialValue: employeeGrievance.actionTaken,
                          textStyle: context.textStyles.bodyNormal.blueDark2,
                          title: LocaleKeys.actionTaken.tr(),
                          hintText: '',
                          onChanged: cubit.onActionTakenChanged,
                        ),
                      ),
                      _buildSelectDateClosed(employeeGrievance.dateClosed),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: GeneralCommentWidget(
                          height: 120,
                          maxLines: 2,
                          shouldShowTitle: true,
                          initialValue: employeeGrievance.closureDetails,
                          textStyle: context.textStyles.bodyNormal.blueDark2,
                          title: LocaleKeys.closureDetails.tr(),
                          hintText: '',
                          onChanged: cubit.onClosureDetailChanged,
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: GeneralCommentWidget(
                          height: 120,
                          maxLines: 2,
                          shouldShowTitle: true,
                          initialValue: employeeGrievance.comment,
                          textStyle: context.textStyles.bodyNormal.blueDark2,
                          hintText: '',
                          onChanged: cubit.onCommentChanged,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocSelector<AddEmployeeGrievanceCubit, AddEmployeeGrievanceState, GrievanceRegister?>(
          selector: (state) => state.employeeGrievance,
          builder: (context, employeeGrievance) {
            return CmoFilledButton(
              title: LocaleKeys.save.tr(),
              onTap: onSubmit,
              loading: loading,
              disable: employeeGrievance?.workerId == null,
            );
          },
        ),
      ),
    );
  }

  Widget _selectWorkerName() {
    return BlocBuilder<AddEmployeeGrievanceCubit, AddEmployeeGrievanceState>(
      builder: (context, state) {
        final initWorker = state.workers.firstWhereOrNull(
          (e) => e.workerId == state.employeeGrievance.workerId,
        );

        return BottomSheetSelection(
          hintText: LocaleKeys.worker.tr(),
          hintTextStyle: context.textStyles.bodyBold.blueDark3,
          margin: const EdgeInsets.symmetric(horizontal: 21),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          displayHorizontal: false,
          value: initWorker?.fullName,
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
                      cubit.onFarmWorkerChanged(state.workers[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.workers[index].fullName ?? '',
                        style: context.textStyles.bodyBold.copyWith(
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
    );
  }

  Widget _selectGrievanceIssue() {
    return BlocBuilder<AddEmployeeGrievanceCubit, AddEmployeeGrievanceState>(
      builder: (context, state) {
        final initIssue = state.grievanceIssues.firstWhereOrNull(
          (e) => e.grievanceIssueId == state.employeeGrievance.grievanceIssueId,
        );
        return BottomSheetSelection(
          hintText: LocaleKeys.grievanceIssue.tr(),
          hintTextStyle: context.textStyles.bodyNormal.blueDark3,
          margin: const EdgeInsets.symmetric(horizontal: 21),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          displayHorizontal: false,
          value: initIssue?.grievanceIssueName,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.grievanceIssues.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.grievanceIssues.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      cubit.onGrievanceIssueChanged(
                          state.grievanceIssues[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.grievanceIssues[index].grievanceIssueName ?? '',
                        style: context.textStyles.bodyBold.copyWith(
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
    );
  }

  Widget _selectAllocatedTo() {
    return BlocBuilder<AddEmployeeGrievanceCubit, AddEmployeeGrievanceState>(
      builder: (context, state) {
        final initAllocated = state.workers.firstWhereOrNull(
          (e) => e.workerId == state.employeeGrievance.allocatedToUserId,
        );

        return BottomSheetSelection(
          hintText: LocaleKeys.allocatedTo.tr(),
          hintTextStyle: context.textStyles.bodyNormal.blueDark3,
          margin: const EdgeInsets.symmetric(horizontal: 21),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          displayHorizontal: false,
          value: initAllocated?.fullName,
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
                      cubit.onAllocatedChanged(state.workers[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.workers[index].fullName ?? '',
                        style: context.textStyles.bodyBold.copyWith(
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

        // return AttributeItem(
        //   child: CmoDropdown<FarmerWorker>(
        //     name: LocaleKeys.allocatedTo.tr(),
        //     initialValue: initAllocated,
        //     style: context.textStyles.bodyNormal.blueDark3,
        //     inputDecoration: InputDecoration(
        //       contentPadding: const EdgeInsets.symmetric(
        //         vertical: 8,
        //         horizontal: 12,
        //       ),
        //       isDense: true,
        //       hintText: LocaleKeys.allocatedTo.tr(),
        //       hintStyle: context.textStyles.bodyNormal.blueDark3,
        //       border: InputBorder.none,
        //       focusedBorder: InputBorder.none,
        //     ),
        //     onChanged: (value) {
        //       cubit.onAllocatedChanged(value);
        //     },
        //     itemsData: workers
        //         .map((e) => CmoDropdownItem(id: e, name: e.firstName ?? ''))
        //         .toList(),
        //   ),
        // );
      },
    );
  }

  Widget _buildSelectDateReceived(DateTime? dateReceived) {
    return AttributeItem(
      margin: const EdgeInsets.symmetric(horizontal: 21),
      child: CmoDatePicker(
        name: LocaleKeys.dateReceived.tr(),
        initialValue: dateReceived,
        hintText: LocaleKeys.dateReceived.tr(),
        validator: requiredValidator,
        lastDate: DateTime.now(),
        onChanged: (date) => cubit.onDateReceivedChanged(date),
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.dateReceived.tr(),
          hintStyle: context.textStyles.bodyNormal.black,
          labelText: LocaleKeys.dateReceived.tr(),
          labelStyle: context.textStyles.bodyNormal.black,
        ),
      ),
    );
  }

  Widget _buildSelectDateClosed(DateTime? dateClosed) {
    return AttributeItem(
      margin: const EdgeInsets.symmetric(horizontal: 21),
      child: CmoDatePicker(
        name: 'DateClosed',
        initialValue: dateClosed,
        hintText: LocaleKeys.dateClosed.tr(),
        lastDate: DateTime.now(),
        onChanged: cubit.onDateClosedChanged,
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.dateClosed.tr(),
          hintStyle: context.textStyles.bodyNormal.blueDark3,
          labelText: LocaleKeys.dateClosed.tr(),
          labelStyle: context.textStyles.bodyNormal.blueDark3,
        ),
      ),
    );
  }
}
