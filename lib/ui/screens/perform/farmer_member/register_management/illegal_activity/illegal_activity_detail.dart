import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/information_text_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IllegalActivityDetail extends BaseStatefulWidget {
  IllegalActivityDetail({
    required this.isEditing,
  }) : super(
          screenName: isEditing
              ? LocaleKeys.illegal_activity_detail.tr()
              : LocaleKeys.add_illegal_activity.tr(),
        );

  final bool isEditing;

  @override
  _IllegalActivityDetailState createState() => _IllegalActivityDetailState();

  static Future<bool?> push(
      BuildContext context, {
        IllegalActivityRegister? illegalActivityRegister,
      }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => IllegalActivityDetailCubit(illegalActivityRegister),
            child: IllegalActivityDetail(isEditing: illegalActivityRegister != null),
          );
        },
      ),
    );
  }
}

class _IllegalActivityDetailState extends BaseStatefulWidgetState<IllegalActivityDetail> {

  late IllegalActivityDetailCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<IllegalActivityDetailCubit>();
  }

  Future<void> onSubmit() async {
    await cubit.onSave(
      onSuccess: () {
        if (context.mounted) {
          showSnackSuccess(
            msg:
                '${widget.isEditing ? LocaleKeys.add_illegal_activity.tr() : 'Edit ${LocaleKeys.illegal_activity_detail}'} successfully',
          );

          Navigator.of(context).pop(true);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: widget.isEditing
              ? LocaleKeys.illegal_activity_detail.tr()
              : LocaleKeys.add_illegal_activity.tr(),
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    CmoHeaderTile(
                      title: LocaleKeys.details.tr(),
                      backgroundColor: context.colors.blueDark2,
                    ),
                    BlocBuilder<IllegalActivityDetailCubit, IllegalActivityDetailState>(
                      builder: (context, state) {
                        return AttributeItem(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          isShowError: state.isIssueRaisedError,
                          isUnderErrorBorder: true,
                          child: InputAttributeItem(
                            initialValue: state.illegalActivityRegister?.issueRaised,
                            textStyle: context.textStyles.bodyNormal.blueDark2,
                            labelText: LocaleKeys.issueRaised.tr(),
                            labelTextStyle: context.textStyles.bodyBold.blueDark2,
                            onChanged: cubit.onChangeIssueRaised,
                          ),
                        );
                      },
                    ),

                    complaintNameWidget(),
                    InformationText(),
                    CmoHeaderTile(
                      title: LocaleKeys.additional_details_optional.tr(),
                      backgroundColor: context.colors.blueDark2,
                    ),
                    const SizedBox(height: 4),
                    _buildSelectDateReceived(),
                    _buildSelectDateClosed(),
                    BlocSelector<IllegalActivityDetailCubit, IllegalActivityDetailState, String?>(
                      selector: (state) => state.illegalActivityRegister?.closureDetails,
                      builder: (context, closureDetails) {
                        return AttributeItem(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: InputAttributeItem(
                            textStyle: context.textStyles.bodyNormal.blueDark2,
                            labelText: LocaleKeys.closureDetails.tr(),
                            labelTextStyle: context.textStyles.bodyBold.blueDark2,
                            initialValue: closureDetails,
                            onChanged: cubit.onClosureDetailChanged,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    BlocSelector<IllegalActivityDetailCubit, IllegalActivityDetailState, String?>(
                      selector: (state) => state.illegalActivityRegister?.comment,
                      builder: (context, comment) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: GeneralCommentWidget(
                            hintText: '',
                            shouldShowTitle: true,
                            titleTextStyle: context.textStyles.bodyNormal.blueDark2,
                            height: 120,
                            initialValue: comment,
                            textStyle: context.textStyles.bodyNormal.blueDark2,
                            onChanged: cubit.onCommentChanged,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
              child: CmoFilledButton(
                title: LocaleKeys.save.tr(),
                onTap: onSubmit,
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget complaintNameWidget() {
    return BlocSelector<IllegalActivityDetailCubit, IllegalActivityDetailState, String?>(
      selector: (state) => state.illegalActivityRegister?.complaintName,
      builder: (context, complaintName) {
        return AutofillWidget(
          title: LocaleKeys.complaintName.tr(),
          value: complaintName,
          margin: const EdgeInsets.symmetric(horizontal: 24),
        );
      },
    );
  }

  Widget _buildSelectDateReceived() {
    return BlocSelector<IllegalActivityDetailCubit, IllegalActivityDetailState, DateTime?>(
      selector: (state) => state.illegalActivityRegister?.dateReceived,
      builder: (context, dateReceived) {
        return AttributeItem(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: DatePickerWidget(
            lastDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: Constants.DEFAULT_DAY_DURATION_OFFSET)),
            initialDate: dateReceived,
            onConfirm: cubit.onDateReceivedChanged,
            child: SelectorAttributeItem(
              labelText: LocaleKeys.dateReceived.tr(),
              labelStyle: context.textStyles.bodyBold.blueDark2,
              text: dateReceived == null
                  ? ''
                  : convertDateTimeToLunar(dateReceived).yMd(),
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

  Widget _buildSelectDateClosed() {
    return BlocBuilder<IllegalActivityDetailCubit, IllegalActivityDetailState>(
      builder: (context, state) {
        return AttributeItem(
          isUnderErrorBorder: true,
          isShowError: state.isDateClosedError,
          errorText: state.dateClosedErrorText,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: DatePickerWidget(
            lastDate: DateTime.now().add(const Duration(days: Constants.DEFAULT_DAY_DURATION_OFFSET)),
            firstDate: state.illegalActivityRegister?.dateReceived ?? DateTime.now(),
            initialDate: state.illegalActivityRegister?.dateClosed,
            onConfirm: cubit.onDateClosedChanged,
            child: SelectorAttributeItem(
              labelText: LocaleKeys.dateClosed.tr(),
              labelStyle: context.textStyles.bodyBold.blueDark2,
              text: state.illegalActivityRegister?.dateClosed == null
                  ? ''
                  : convertDateTimeToLunar(state.illegalActivityRegister?.dateClosed).yMd(),
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
