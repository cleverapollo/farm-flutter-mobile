import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/bottom_sheet_selection/bottom_sheet_multiple_selection.dart';
import 'package:cmo/ui/components/bottom_sheet_selection/bottom_sheet_selection_with_search.dart';
import 'package:cmo/ui/components/custom_camera_component/custom_camera_screen.dart';
import 'package:cmo/ui/components/custom_camera_component/register_photo_section.dart';
import 'package:cmo/ui/components/bottom_sheet_selection/bottom_sheet_selection.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/cmo_switch.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/ui/components/bottom_sheet_selection/multiple_selection_widget.dart';

class CloseActionLog extends BaseStatefulWidget{
  const CloseActionLog() : super(screenName: 'CloseActionLog');

  static Future<void> push(
    BuildContext context, {
    required ActionLog actionLog,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => CloseActionLogCubit(actionLog),
            child: const CloseActionLog(),
          );
        },
      ),
    );
  }

  @override
  _CloseActionLogState createState() => _CloseActionLogState();
}

class _CloseActionLogState extends BaseStatefulWidgetState<CloseActionLog> {

  late CloseActionLogCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<CloseActionLogCubit>();
  }

  Future<void> navigateToCamera() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (context.read<CloseActionLogCubit>().reactMaximumUploadedPhoto()) {
      return;
    }

    await CustomCameraScreen.push(
      context,
      onDone: context.read<CloseActionLogCubit>().onUpdatePhoto,
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return BlocBuilder<CloseActionLogCubit, CloseActionLogState>(
      buildWhen: (previous, current) => previous.isDataReady != current.isDataReady,
      builder: (context, state) {
        final appbarTitle = (state.activeUserRole?.isFarmerMember ?? false) ? LocaleKeys.action_log.tr() : LocaleKeys.closing_requirements.tr();
        final appbarSubtitle = (state.activeUserRole?.isFarmerMember ?? false) ? state.activeFarm?.farmName : state.activeRMU?.regionalManagerUnitName;
        return Scaffold(
          appBar: CmoAppBar(
            title: appbarTitle,
            subtitle: appbarSubtitle,
            trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
            onTapTrailing: onShowWarningDispose,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    BlocSelector<CloseActionLogCubit, CloseActionLogState, String?>(
                      selector: (state) => state.actionLog.actionName,
                      builder: (context, actionName) {
                        return Text(
                          actionName ?? '',
                          style: context.textStyles.bodyNormal.blueDark2,
                        );
                      },
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Text(
                        '${LocaleKeys.action_required.tr()}:',
                        style: context.textStyles.bodyBold.blueDark2,
                      ),
                    ),
                    BlocSelector<CloseActionLogCubit, CloseActionLogState,
                        String?>(
                      selector: (state) => state.actionLog.ncAction,
                      builder: (context, actionDescription) {
                        return Text(
                          actionDescription ?? '',
                          style: context.textStyles.bodyNormal.blueDark2,
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    buildClosingDate(),
                    const SizedBox(height: 12),
                    BlocBuilder<CloseActionLogCubit, CloseActionLogState>(
                      builder: (context, state) {
                        return GeneralCommentWidget(
                          initialValue: state.actionLog.closingComment,
                          height: 150,
                          maxLines: 5,
                          hintText: '',
                          title: (state.activeUserRole?.isFarmerMember ?? false) ? LocaleKeys.action_taken.tr() : LocaleKeys.closing_comment.tr(),
                          shouldShowTitle: true,
                          titleTextStyle: context.textStyles.bodyBold.blueDark2,
                          textStyle: context.textStyles.bodyNormal.blueDark2,
                          onChanged: cubit.onChangeClosingComment,
                        );
                      },
                    ),
                    buildPhotoSection(),
                    SizedBox(height: MediaQuery.of(context).padding.bottom + 80),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:  CmoFilledButton(
                    title: LocaleKeys.close.tr(),
                    onTap: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      await cubit.onClose();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildClosingDate() {
    return BlocBuilder<CloseActionLogCubit, CloseActionLogState>(
      builder: (context, state) {
        final child = AttributeItem(
          child: BlocSelector<CloseActionLogCubit, CloseActionLogState, DateTime?>(
            selector: (state) => state.actionLog.closingDate,
            builder: (context, closingDate) {
              return DatePickerWidget(
                lastDate: DateTime.now(),
                firstDate: DateTime.now().add(const Duration(days: -Constants.DEFAULT_DAY_DURATION_OFFSET)),
                initialDate: closingDate,
                onConfirm: cubit.onClosingDateChanged,
                title: LocaleKeys.closing_date.tr(),
              );
            },
          ),
        );

        if ((state.activeUserRole?.isFarmerMember) ?? false) {
        return Column(
          children: [
            Container(
              color: context.colors.blueDark2,
              padding: const EdgeInsets.all(6),
              child: Row(
                children: [
                  Text(
                    LocaleKeys.overdue.tr(),
                    style: context.textStyles.bodyBold.white,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Assets.icons.icInformationWhite.svg(),
                    ),
                  ),
                  Text(
                    convertDateTimeToLunarString(state.actionLog.closingDate) ??
                        '',
                    style: context.textStyles.bodyBold.white,
                  ),
                ],
              ),
            ),
            Stack(
                children: [
                  child,
                  InactiveWidget(
                    inactiveColor: context.colors.white.withOpacity(0.4),
                  ),
                ],
              ),
            ],
          );
        }

        return child;
      },
    );
  }

  Widget buildPhotoSection() {
    return BlocBuilder<CloseActionLogCubit, CloseActionLogState>(
      builder: (context, state) {
        return RegisterPhotoSection(
          margin: EdgeInsets.zero,
          navigateToCamera: navigateToCamera,
          photos: state.photos
              .map(
                (e) => RegisterPhotoModel(
              photo: e.photo,
              photoId: e.actionLogPhotoId,
            ),
          )
              .toList(),
          onRemove: cubit.onRemovePhoto,
        );
      },
    );
  }
}
