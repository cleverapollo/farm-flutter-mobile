import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddStakeHolderComplaintScreen extends StatefulWidget {
  const AddStakeHolderComplaintScreen({super.key, this.complaint});

  final ComplaintsAndDisputesRegister? complaint;

  @override
  State<StatefulWidget> createState() => _AddStakeHolderComplaintScreenState();

  static Future<ComplaintsAndDisputesRegister?> push(BuildContext context,
      {ComplaintsAndDisputesRegister? complaint}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddStakeHolderComplaintScreen(complaint: complaint),
      ),
    );
  }
}

class _AddStakeHolderComplaintScreenState
    extends State<AddStakeHolderComplaintScreen> {
  final complaints = ValueNotifier(<StakeHolder>[]);
  final isLoading = ValueNotifier(true);

  StakeHolder? selectStakeHolder;

  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late ComplaintsAndDisputesRegister complaint;

  bool carRaised = false;
  bool carClosed = false;

  @override
  void initState() {
    super.initState();
    if (widget.complaint == null) {
      complaint = ComplaintsAndDisputesRegister(
          complaintsAndDisputesRegisterNo: DateTime.now().toIso8601String(),
          isActive: true,
          isMasterdataSynced: false);
    } else {
      complaint =
          ComplaintsAndDisputesRegister.fromJson(widget.complaint!.toJson());
    }
    carRaised = complaint.carRaisedDate != null;
    carClosed = complaint.carClosedDate != null;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final farm = await configService.getActiveFarm();

      final result = await cmoDatabaseMasterService
          .getFarmStakeHolderByFarmId(farm?.farmId ?? '');

      for (final item in result) {
        final stakeholders = await cmoDatabaseMasterService
            .getStakeHoldersByStakeHolderId(item.stakeHolderId ?? '');

        complaints.value.addAll(stakeholders);
        isLoading.value = false;
      }
    });
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
        if (selectStakeHolder == null) {
          return showSnackError(msg: 'Required fields are missing.');
        }

        await hideInputMethod();
        final farm = await configService.getActiveFarm();
        complaint = complaint.copyWith(
          isActive: true,
          isMasterdataSynced: false,
          complaintsAndDisputesRegisterId: null,
          complaintsAndDisputesRegisterNo:
              DateTime.now().millisecondsSinceEpoch.toString(),
          farmId: farm?.farmId,
          dateReceived: value['DateReceived'] as DateTime?,
          dateClosed: value['DateClosed'] as DateTime?,
          stakeholderName: selectStakeHolder?.stakeholderName,
          stakeholderId: selectStakeHolder?.stakeHolderId,
        );

        if (carRaised && complaint.carRaisedDate == null) {
          complaint = complaint.copyWith(
            carRaisedDate: DateTime.now().toIso8601String(),
          );
        }

        if (carClosed && complaint.carClosedDate == null) {
          complaint = complaint.copyWith(
            carClosedDate: DateTime.now().toIso8601String(),
          );
        }

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          resultId = await databaseService
              .cacheComplaintsAndDisputesRegister(complaint);
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${widget.complaint == null ? LocaleKeys.addStakeHolderComplaint.tr() : 'Edit Complaint'} $resultId',
            );

            Navigator.of(context).pop(complaint);
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
          title: widget.complaint == null
              ? LocaleKeys.addStakeHolderComplaint.tr()
              : 'Edit Complaint',
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: ValueListenableBuilder(
          valueListenable: isLoading,
          builder: (context, value, __) {
            if (value) return const Center(child: CircularProgressIndicator());

            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildInputArea(),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            );
          },
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
              _selectComplaintName(),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.issueRaised.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    complaint = complaint.copyWith(issueDescription: value);
                  },
                ),
              ),
              _buildSelectDateReceived(),
              _buildSelectDateClosed(),
              AttributeItem(
                child: InputAttributeItem(
                  hintText: LocaleKeys.closureDetails.tr(),
                  hintTextStyle: context.textStyles.bodyBold.black,
                  onChanged: (value) {
                    complaint = complaint.copyWith(closureDetails: value);
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
                    complaint = complaint.copyWith(comment: value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectComplaintName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            LocaleKeys.complaintName.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: complaints,
          builder: (_, value, __) {
            return CmoDropdown<StakeHolder>(
                name: 'ComplaintId',
                hintText: LocaleKeys.complaintName.tr(),
                validator: requiredValidator,
                inputDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  isDense: true,
                  hintText:
                      '${LocaleKeys.select.tr()} ${LocaleKeys.complaintName.tr().toLowerCase()}',
                  hintStyle: context.textStyles.bodyNormal.grey,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: context.colors.grey)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: context.colors.blue)),
                ),
                onChanged: (data) {
                  selectStakeHolder = data;
                  setState(() {});
                },
                initialValue: selectStakeHolder,
                itemsData: value
                    .map((e) =>
                        CmoDropdownItem(id: e, name: e.stakeholderName ?? ''))
                    .toList());
          },
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
          final receivedValue =
              _formKey.currentState?.value['DateReceived'] as DateTime?;
          if (receivedValue != null &&
              value.millisecondsSinceEpoch <
                  receivedValue.millisecondsSinceEpoch) {
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
          hintText: LocaleKeys.dateClosed.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.dateClosed.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }
}
