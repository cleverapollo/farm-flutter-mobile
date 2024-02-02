import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/stake_holder_complaint/add_stake_holder_complaint_cubit.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    complaintsAndDisputesRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
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

class _AddStakeHolderComplaintScreenState extends BaseStatefulWidgetState<AddStakeHolderComplaintScreen> {
  late final AddStakeHolderComplaintCubit cubit;
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
      loading = true;
    });

      try {
        await hideInputMethod();
        final isError = cubit.onValidateRequireField();
        if (isError) {
          return;
        }

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
            isDirect: false,
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
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
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
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: AutofillGroup(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              _selectComplaintName(
                                state.stakeholders,
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    child: CmoFilledButton(
                      title: LocaleKeys.save.tr(),
                      onTap: onSubmit,
                      loading: loading,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _selectComplaintName(
    List<StakeHolder> stakeHolders,
    String? stakeHolderId,
  ) {
    return BlocBuilder<AddStakeHolderComplaintCubit,
        AddStakeHolderComplaintState>(
      builder: (context, state) {
        return BottomSheetSelection(
          hintText: LocaleKeys.complaintName.tr(),
          displayHorizontal: false,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: state.stakeholders
              .firstWhereOrNull(
                (element) =>
                    element.stakeHolderId == state.complaint.stakeholderId,
              )
              ?.stakeholderName,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.stakeholders.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.stakeholders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      cubit.onStateHolderChanged(state.stakeholders[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.stakeholders[index].stakeholderName ?? '',
                        style: context.textStyles.bodyBold.blueDark2,
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
    return BlocBuilder<AddStakeHolderComplaintCubit, AddStakeHolderComplaintState>(
      builder: (context, state) {
        return AttributeItem(
          isUnderErrorBorder: true,
          isShowError: state.isDateClosedError,
          errorText: state.dateClosedErrorText,
          child: DatePickerWidget(
            lastDate: DateTime.now().add(const Duration(days: 100000)),
            firstDate: state.complaint.dateReceived ?? DateTime.now(),
            initialDate: state.complaint.dateClosed ?? DateTime.now(),
            onConfirm: cubit.onDateClosedChanged,
            child: SelectorAttributeItem(
              labelText: LocaleKeys.dateClosed.tr(),
              labelStyle: context.textStyles.bodyBold.blueDark2,
              text: state.complaint.dateClosed == null
                  ? ''
                  : state.complaint.dateClosed.yMd(),
              textStyle: context.textStyles.bodyNormal.blueDark2,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              trailing: Assets.icons.icCalendar.svgBlack,
            ),
          ),
        );
      },
    );
  }
}
