import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/stake_holder_complaint/add_stake_holder_complaint_cubit.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddStakeHolderComplaintScreen extends BaseStatefulWidget {
  AddStakeHolderComplaintScreen({
    super.key,
    this.complaint,
  }) : super(
          screenName: complaint == null
              ? LocaleKeys.addStakeHolderComplaint.tr()
              : LocaleKeys.stakeholder_complaint_detail.tr(),
        );

  final ComplaintsAndDisputesRegister? complaint;

  @override
  State<StatefulWidget> createState() => _AddStakeHolderComplaintScreenState();

  static Future<ComplaintsAndDisputesRegister?> push(
    BuildContext context, {
    required Farm farm,
    ComplaintsAndDisputesRegister? complaint,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AddStakeHolderComplaintCubit(
              farm: farm,
              complaint: complaint ??
                  ComplaintsAndDisputesRegister(
                    complaintsAndDisputesRegisterNo:
                        DateTime.now().millisecondsSinceEpoch.toString(),
                    dateReceived: DateTime.now(),
                    createDT: DateTime.now(),
                    updateDT: DateTime.now(),
                    isActive: true,
                    isMasterdataSynced: false,
                  ),
              isAddNew: complaint == null,
            ),
            child: AddStakeHolderComplaintScreen(complaint: complaint),
          );
        },
      ),
    );
  }
}

class _AddStakeHolderComplaintScreenState
    extends BaseStatefulWidgetState<AddStakeHolderComplaintScreen> {
  late final AddStakeHolderComplaintCubit cubit;
  final _formKey = GlobalKey<FormBuilderState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddStakeHolderComplaintCubit>();
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
        var complaint = cubit.state.complaint;
        complaint = complaint.copyWith(
          isActive: true,
          isMasterdataSynced: false,
        );

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          resultId = await databaseService.cacheComplaintsAndDisputesRegister(
            complaint.copyWith(
              createDT: complaint.createDT ?? DateTime.now(),
              updateDT: DateTime.now(),
            ),
          );
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
              : LocaleKeys.stakeholder_complaint_detail.tr(),
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: SafeArea(
          child: BlocSelector<AddStakeHolderComplaintCubit,
              AddStakeHolderComplaintState, bool>(
            selector: (state) => state.isDataReady,
            builder: (context, isDataReady) {
              if (!isDataReady) {
                return const Center(child: CircularProgressIndicator());
              }
              final state = cubit.state;
              final complaint = state.complaint;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FormBuilder(
                  key: _formKey,
                  onChanged: () {},
                  autovalidateMode: autoValidateMode,
                  child: AutofillGroup(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          _selectComplaintName(
                            state.complaints,
                            complaint.stakeholderId,
                          ),
                          AttributeItem(
                            child: InputAttributeItem(
                              validator: (_) => null,
                              initialValue: complaint.issueDescription,
                              textStyle:
                                  context.textStyles.bodyNormal.blueDark2,
                              labelText: LocaleKeys.issueRaised.tr(),
                              labelTextStyle:
                                  context.textStyles.bodyBold.blueDark2,
                              onChanged: (value) {
                                cubit.onIssueDescriptionChanged(value);
                              },
                            ),
                          ),
                          _buildSelectDateReceived(complaint.dateReceived),
                          _buildSelectDateClosed(complaint.dateClosed),
                          AttributeItem(
                            child: InputAttributeItem(
                              validator: (_) => null,
                              textStyle:
                                  context.textStyles.bodyNormal.blueDark2,
                              labelText: LocaleKeys.closureDetails.tr(),
                              labelTextStyle:
                                  context.textStyles.bodyBold.blueDark2,
                              initialValue: complaint.closureDetails,
                              onChanged: cubit.onClosureDetailChanged,
                            ),
                          ),
                          AttributeItem(
                            child: SizedBox(
                              height: 250,
                              child: GeneralCommentWidget(
                                initialValue: complaint.comment,
                                hintText: LocaleKeys.generalComments.tr(),
                                onChanged: cubit.onCommentChanged,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
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

  Widget _selectComplaintName(
    List<StakeHolder> stakeHolders,
    String? stakeHolderId,
  ) {
    final initStakeHolder =
        stakeHolders.firstWhereOrNull((e) => e.stakeHolderId == stakeHolderId);
    return AttributeItem(
      child: CmoDropdown<StakeHolder>(
        name: LocaleKeys.complaintName.tr(),
        hintText: LocaleKeys.complaintName.tr(),
        validator: requiredValidator,
        style: context.textStyles.bodyBold.blueDark2,
        inputDecoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          isDense: true,
          hintText: LocaleKeys.complaintName.tr(),
          hintStyle: context.textStyles.bodyBold.blueDark2,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onChanged: (data) {
          cubit.onStateHolderChanged(data);
        },
        initialValue: initStakeHolder,
        itemsData: stakeHolders
            .map((e) => CmoDropdownItem(id: e, name: e.stakeholderName ?? ''))
            .toList(),
      ),
    );
  }

  Widget _buildSelectDateReceived(DateTime? receiveDate) {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateReceived',
        hintText: LocaleKeys.dateReceived.tr(),
        validator: requiredValidator,
        initialValue: receiveDate,
        onChanged: cubit.onDateReceivedChanged,
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
          hintStyle: context.textStyles.bodyBold.blueDark2,
          labelText: LocaleKeys.dateReceived.tr(),
          labelStyle: context.textStyles.bodyBold.blueDark2,
        ),
      ),
    );
  }

  Widget _buildSelectDateClosed(DateTime? dateClosed) {
    return AttributeItem(
      child: CmoDatePicker(
        name: LocaleKeys.dateClosed.tr(),
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
        initialValue: dateClosed,
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
          hintStyle: context.textStyles.bodyBold.blueDark2,
          labelText: LocaleKeys.dateClosed.tr(),
          labelStyle: context.textStyles.bodyBold.blueDark2,
        ),
      ),
    );
  }
}
