import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_employee_grievance/add_employee_grievance_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/cmo_farm_app_bar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddEmployeeGrievanceScreen extends StatefulWidget {
  const AddEmployeeGrievanceScreen({
    super.key,
  });

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
                  ),
            ),
            child: const AddEmployeeGrievanceScreen(),
          );
        },
      ),
    );
  }
}

class _AddEmployeeGrievanceScreenState
    extends State<AddEmployeeGrievanceScreen> {
  late final AddEmployeeGrievanceCubit cubit;

  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddEmployeeGrievanceCubit>();
  }

  Future<void> onSubmit() async {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;
      if (value == null) return;
      value = {...value};

      setState(() {
        loading = true;
      });
      try {
        await hideInputMethod();
        var employeeGrievance = cubit.state.employeeGrievance;
        employeeGrievance = employeeGrievance.copyWith(
          isActive: true,
          isMasterdataSynced: false,
        );

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheEmployeeGrievance(
              employeeGrievance.copyWith(
                isActive: true,
                isMasterdataSynced: false,
              ),
            );
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${cubit.state.isAddNew ? LocaleKeys.addEmployeeGrievance.tr() : 'Edit Employee Grievance'} $resultId',
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
  }

  @override
  Widget build(BuildContext context) {
    final initState = cubit.state;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoFarmAppBar.showTrailingAndFarmName(
          title: initState.isAddNew
              ? LocaleKeys.addEmployeeGrievance.tr()
              : 'Edit Employee Grievance',
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: FormBuilder(
              key: _formKey,
              onChanged: () {},
              autovalidateMode: autoValidateMode,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _selectWorkerName(),
                          _selectGrievanceIssue(),
                          _buildSelectDateReceived(
                            employeeGrievance.dateReceived,
                          ),
                          _selectAllocatedTo(),
                          AttributeItem(
                            child: InputAttributeItem(
                              validator: (text) => null,
                              textCapitalization: TextCapitalization.sentences,
                              initialValue: employeeGrievance.actionTaken,
                              textStyle:
                                  context.textStyles.bodyNormal.blueDark2,
                              labelText: LocaleKeys.actionTaken.tr(),
                              labelTextStyle:
                                  context.textStyles.bodyBold.blueDark2,
                              onChanged: cubit.onActionTakenChanged,
                            ),
                          ),
                          _buildSelectDateClosed(employeeGrievance.dateClosed),
                          AttributeItem(
                            child: InputAttributeItem(
                              validator: (text) => null,
                              textCapitalization: TextCapitalization.sentences,
                              initialValue: employeeGrievance.closureDetails,
                              textStyle:
                                  context.textStyles.bodyNormal.blueDark2,
                              labelText: LocaleKeys.closureDetails.tr(),
                              labelTextStyle:
                                  context.textStyles.bodyBold.blueDark2,
                              onChanged: cubit.onClosureDetailChanged,
                            ),
                          ),
                          AttributeItem(
                            child: SizedBox(
                              height: 97,
                              child: GeneralCommentWidget(
                                initialValue: employeeGrievance.comment,
                                hintText: LocaleKeys.generalComments.tr(),
                                onChanged: cubit.onCommentChanged,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CmoFilledButton(
          title: LocaleKeys.save.tr(),
          onTap: onSubmit,
          loading: loading,
        ),
      ),
    );
  }

  Widget _selectWorkerName() {
    return BlocSelector<AddEmployeeGrievanceCubit, AddEmployeeGrievanceState,
        List<FarmerWorker>>(
      selector: (state) => state.workers,
      builder: (context, workers) {
        final state = cubit.state;
        final initWorker = workers.firstWhereOrNull(
          (e) => e.workerId == state.employeeGrievance.workerId,
        );
        return AttributeItem(
          child: CmoDropdown<FarmerWorker>(
            name: LocaleKeys.worker.tr(),
            initialValue: initWorker,
            style: context.textStyles.bodyBold.blueDark2,
            validator: requiredValidator,
            inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              isDense: true,
              hintText: LocaleKeys.worker.tr(),
              hintStyle: context.textStyles.bodyBold.blueDark2,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onChanged: (value) {
              cubit.onFarmWorkerChanged(value);
            },
            itemsData: workers
                .map((e) => CmoDropdownItem(id: e, name: e.firstName ?? ''))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _selectGrievanceIssue() {
    return BlocSelector<AddEmployeeGrievanceCubit, AddEmployeeGrievanceState,
        List<GrievanceIssue>>(
      selector: (state) => state.grievanceIssues,
      builder: (context, grievanceIssues) {
        final state = cubit.state;
        final initIssue = grievanceIssues.firstWhereOrNull(
          (e) => e.grievanceIssueId == state.employeeGrievance.grievanceIssueId,
        );
        return AttributeItem(
          child: CmoDropdown<GrievanceIssue>(
            name: LocaleKeys.grievanceIssue.tr(),
            initialValue: initIssue,
            style: context.textStyles.bodyBold.blueDark2,
            inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              isDense: true,
              hintText: LocaleKeys.grievanceIssue.tr(),
              hintStyle: context.textStyles.bodyBold.blueDark2,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onChanged: (value) {
              cubit.onGrievanceIssueChanged(value);
            },
            itemsData: grievanceIssues
                .map(
                  (e) => CmoDropdownItem(
                    id: e,
                    name: e.grievanceIssueName ?? '',
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget _selectAllocatedTo() {
    return BlocSelector<AddEmployeeGrievanceCubit, AddEmployeeGrievanceState,
        List<FarmerWorker>>(
      selector: (state) => state.workers,
      builder: (context, workers) {
        final state = cubit.state;
        final initAllocated = workers.firstWhereOrNull(
          (e) => e.workerId == state.employeeGrievance.allocatedToUserId,
        );
        return AttributeItem(
          child: CmoDropdown<FarmerWorker>(
            name: LocaleKeys.allocatedTo.tr(),
            initialValue: initAllocated,
            style: context.textStyles.bodyBold.blueDark2,
            inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              isDense: true,
              hintText: LocaleKeys.allocatedTo.tr(),
              hintStyle: context.textStyles.bodyBold.blueDark2,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onChanged: (value) {
              cubit.onAllocatedChanged(value);
            },
            itemsData: workers
                .map((e) => CmoDropdownItem(id: e, name: e.firstName ?? ''))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildSelectDateReceived(DateTime? dateReceived) {
    return AttributeItem(
      child: CmoDatePicker(
        name: LocaleKeys.dateReceived.tr(),
        initialValue: dateReceived,
        hintText: LocaleKeys.dateReceived.tr(),
        validator: requiredValidator,
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
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateReceived.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget _buildSelectDateClosed(DateTime? dateClosed) {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateClosed',
        initialValue: dateClosed,
        hintText: LocaleKeys.dateClosed.tr(),
        validator: (DateTime? value) {
          if (value == null) return null;
          if (value.millisecondsSinceEpoch >
              DateTime.now().millisecondsSinceEpoch) {
            return 'Closed date cannot be in the future';
          }
          return null;
        },
        onChanged: (date) => cubit.onDateReceivedChanged(date),
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
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateClosed.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }
}
