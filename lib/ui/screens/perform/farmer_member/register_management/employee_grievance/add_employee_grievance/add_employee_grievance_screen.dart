import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddEmployeeGrievanceScreen extends StatefulWidget {
  const AddEmployeeGrievanceScreen(
      {super.key, required this.employeeGrievance});

  final EmployeeGrievance? employeeGrievance;

  @override
  State<StatefulWidget> createState() => _AddEmployeeGrievanceScreenState();

  static Future<EmployeeGrievance?> push(BuildContext context,
      {EmployeeGrievance? employeeGrievance}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            AddEmployeeGrievanceScreen(employeeGrievance: employeeGrievance),
      ),
    );
  }
}

class _AddEmployeeGrievanceScreenState
    extends State<AddEmployeeGrievanceScreen> {
  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late EmployeeGrievance employeeGrievance;

  bool carRaised = false;
  bool carClosed = false;

  @override
  void initState() {
    super.initState();
    if (widget.employeeGrievance == null) {
      employeeGrievance = EmployeeGrievance(
          grievanceRegisterNo: DateTime.now().toIso8601String(),
          isActive: true,
          isMasterDataSynced: false);
    } else {
      employeeGrievance =
          EmployeeGrievance.fromJson(widget.employeeGrievance!.toJson());
    }
    carRaised = employeeGrievance.carRaisedDate != null;
    carClosed = employeeGrievance.carClosedDate != null;
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
        final farmId = await configService.getActiveFarmId();
        employeeGrievance = employeeGrievance.copyWith(
          farmId: farmId,
          dateReceived: value['DateReceived'] as DateTime?,
          dateClosed: value['DateClosed'] as DateTime?,
          allocatedToUserId: value['AllocatedToId']?.toString(),
          workerId: value['WorkerId']?.toString(),
          grievanceIssueId: int.tryParse(value['GrievanceIssueId'].toString()),
        );

        if (carRaised && employeeGrievance.carRaisedDate == null) {
          employeeGrievance = employeeGrievance.copyWith(
            carRaisedDate: DateTime.now().toIso8601String(),
          );
        }

        if (carClosed && employeeGrievance.carClosedDate == null) {
          employeeGrievance = employeeGrievance.copyWith(
            carClosedDate: DateTime.now().toIso8601String(),
          );
        }

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId =
                await databaseService.cacheEmployeeGrievance(employeeGrievance);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${widget.employeeGrievance == null ? LocaleKeys.addEmployeeGrievance.tr() : 'Edit Employee Grievance'} $resultId',
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
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: widget.employeeGrievance == null
              ? LocaleKeys.addEmployeeGrievance.tr()
              : 'Edit Employee Grievance',
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildInputArea(),
              const SizedBox(
                height: 80,
              ),
            ],
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

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: FormBuilder(
        key: _formKey,
        onChanged: () {},
        autovalidateMode: autoValidateMode,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _selectWorkerName(),
              _selectGrievanceIssue(),
              _buildSelectDateReceived(),
              _selectAllocatedTo(),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.actionTaken.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    employeeGrievance =
                        employeeGrievance.copyWith(actionTaken: value);
                  },
                ),
              ),
              _buildSelectDateClosed(),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.closureDetails.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    employeeGrievance =
                        employeeGrievance.copyWith(closureDetails: value);
                  },
                ),
              ),
              AttributeItem(
                child: SelectItemWidget(
                  title: LocaleKeys.carRaised.tr(),
                  onSelect: (isSelected) {
                    carRaised = isSelected;
                  },
                ),
              ),
              AttributeItem(
                child: SelectItemWidget(
                  title: LocaleKeys.carClosed.tr(),
                  onSelect: (isSelected) {
                    carClosed = isSelected;
                  },
                ),
              ),
              SizedBox(
                height: 250,
                child: GeneralCommentWidget(
                  hintText: LocaleKeys.generalComments.tr(),
                  onChanged: (value) {
                    employeeGrievance =
                        employeeGrievance.copyWith(comment: value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectWorkerName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Text(
            LocaleKeys.worker.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        CmoDropdown(
          name: 'WorkerId',
          hintText: LocaleKeys.worker.tr(),
          validator: requiredValidator,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            isDense: true,
            hintText:
                '${LocaleKeys.select.tr()} ${LocaleKeys.worker.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.blue),
            ),
          ),
          onChanged: (int? id) {
            if (id == -1) {
              _formKey.currentState!.fields['WorkerId']?.reset();
            }
          },
          itemsData: [
            CmoDropdownItem(id: -1, name: LocaleKeys.worker.tr()),
            CmoDropdownItem(id: 1, name: 'Worker 1'),
            CmoDropdownItem(id: 2, name: 'Worker 2'),
            CmoDropdownItem(id: 3, name: 'Worker 3'),
            CmoDropdownItem(id: 4, name: 'Worker 4'),
          ],
        ),
      ],
    );
  }

  Widget _selectGrievanceIssue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Text(
            LocaleKeys.grievanceIssue.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        CmoDropdown(
          name: 'GrievanceIssueId',
          hintText: LocaleKeys.grievanceIssue.tr(),
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            isDense: true,
            hintText:
                '${LocaleKeys.select.tr()} ${LocaleKeys.grievanceIssue.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.blue),
            ),
          ),
          onChanged: (int? id) {
            if (id == -1) {
              _formKey.currentState!.fields['GrievanceIssueId']?.reset();
            }
          },
          itemsData: [
            CmoDropdownItem(id: -1, name: LocaleKeys.grievanceIssue.tr()),
            CmoDropdownItem(id: 0, name: 'GrievanceIssue 1'),
            CmoDropdownItem(id: 1, name: 'GrievanceIssue 2'),
          ],
        ),
      ],
    );
  }

  Widget _selectAllocatedTo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Text(
            LocaleKeys.allocatedTo.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        CmoDropdown(
          name: 'AllocatedToId',
          hintText: LocaleKeys.allocatedTo.tr(),
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            isDense: true,
            hintText:
                '${LocaleKeys.select.tr()} ${LocaleKeys.allocatedTo.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colors.blue),
            ),
          ),
          onChanged: (int? id) {
            if (id == -1) {
              _formKey.currentState!.fields['AllocatedToId']?.reset();
            }
          },
          itemsData: [
            CmoDropdownItem(id: -1, name: LocaleKeys.worker.tr()),
            CmoDropdownItem(id: 1, name: 'Worker 1'),
            CmoDropdownItem(id: 2, name: 'Worker 2'),
            CmoDropdownItem(id: 3, name: 'Worker 3'),
            CmoDropdownItem(id: 4, name: 'Worker 4'),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectDateReceived() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateReceived',
        hintText: LocaleKeys.dateReceived.tr(),
        validator: (DateTime? value) {
          if (value == null) return null;
          if (value.millisecondsSinceEpoch >
              DateTime.now().millisecondsSinceEpoch) {
            return 'Received date cannot be in the future';
          }
          final closedValue =
              _formKey.currentState?.value['DateClosed'] as DateTime?;
          if (closedValue != null &&
              value.millisecondsSinceEpoch <
                  closedValue.millisecondsSinceEpoch) {
            return 'Closed date must be after received date';
          }
          return null;
        },
        inputDecoration: InputDecoration(
          border: InputBorder.none,
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

  Widget _buildSelectDateClosed() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateClosed',
        hintText: LocaleKeys.dateClosed.tr(),
        validator: (DateTime? value) {
          if (value == null) return null;
          if (value.millisecondsSinceEpoch >
              DateTime.now().millisecondsSinceEpoch) {
            return 'Closed date cannot be in the future';
          }
          return null;
        },
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
