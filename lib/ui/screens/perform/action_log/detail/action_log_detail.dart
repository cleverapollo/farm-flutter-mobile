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
import 'package:cmo/ui/screens/perform/action_log/close/close_action_log.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/cmo_switch.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/ui/components/bottom_sheet_selection/multiple_selection_widget.dart';

class ActionLogDetail extends BaseStatefulWidget{
  const ActionLogDetail() : super(screenName: 'ActionLogDetail');

  static Future<void> push(
    BuildContext context, {
    ActionLog? actionLog,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => ActionLogDetailCubit(actionLog),
            child: const ActionLogDetail(),
          );
        },
      ),
    );
  }

  @override
  _ActionLogDetailState createState() => _ActionLogDetailState();
}

class _ActionLogDetailState extends BaseStatefulWidgetState<ActionLogDetail> {

  late ActionLogDetailCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ActionLogDetailCubit>();
  }

  Future<void> navigateToCamera() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (context.read<ActionLogDetailCubit>().reactMaximumUploadedPhoto()) {
      return;
    }

    await CustomCameraScreen.push(
      context,
      onDone: context.read<ActionLogDetailCubit>().onUpdatePhoto,
    );
  }

  Future<void> onSave() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final isFarmerMember = cubit.state.activeUserRole?.isFarmerMember ?? false;
    final actionLog = cubit.state.actionLog;
    if (isFarmerMember) {
      await CloseActionLog.push(context, actionLog: actionLog);
    } else {
      await cubit.onSave();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    return BlocSelector<ActionLogDetailCubit, ActionLogDetailState, ResourceManagerUnit?>(
      selector: (state) => state.activeRMU,
      builder: (context, resourceManagerUnit) => Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.action_log.tr(),
          subtitle: resourceManagerUnit?.regionalManagerUnitName,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: onShowWarningDispose,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 12),
                      isMajorWidget(),
                     BlocBuilder<ActionLogDetailCubit, ActionLogDetailState>(
                        builder: (context, state) {
                          return GeneralCommentWidget(
                            initialValue: state.actionLog.actionName,
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            height: 150,
                            maxLines: 5,
                            hintText: '',
                            title: LocaleKeys.action_name_and_description.tr(),
                            shouldShowTitle: true,
                            titleTextStyle: context.textStyles.bodyBold.blueDark2,
                            textStyle: context.textStyles.bodyNormal.blueDark2,
                            onChanged: cubit.onChangeActionName,
                          );
                        },
                      ),
                      BlocBuilder<ActionLogDetailCubit, ActionLogDetailState>(
                        builder: (context, state) {
                          return BottomSheetSelection(
                            hintText: LocaleKeys.type.tr(),
                            displayHorizontal: false,
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 14,
                            ),
                            value: state.selectedActionType?.actionLogTypeName,
                            onTap: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (state.actionTypes.isBlank) return;
                              await showCustomBottomSheet<void>(
                                context,
                                content: ListView.builder(
                                  itemCount: state.actionTypes.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        cubit.onSelectActionType(state.actionTypes[index]);
                                        Navigator.pop(context);
                                      },
                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                        child: Text(
                                          state.actionTypes[index].actionLogTypeName ?? '',
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
                      ),
                      BlocBuilder<ActionLogDetailCubit, ActionLogDetailState>(
                        builder: (context, state) {
                          return BottomSheetSelection(
                            hintText: LocaleKeys.raised_by.tr(),
                            displayHorizontal: false,
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 14,
                            ),
                            value: state.selectedActionRaisedByUser?.fullName,
                            onTap: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (state.actionRaisedByUser.isBlank) return;
                              await showCustomBottomSheet<void>(
                                context,
                                content: ListView.builder(
                                  itemCount: state.actionRaisedByUser.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        cubit.onSelectRaisedByUser(state.actionRaisedByUser[index]);
                                        Navigator.pop(context);
                                      },
                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                        child: Text(
                                          state.actionRaisedByUser[index].fullName ?? '',
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
                      ),
                      AttributeItem(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: BlocSelector<ActionLogDetailCubit, ActionLogDetailState, DateTime?>(
                          selector: (state) => state.actionLog.dateRaised,
                          builder: (context, dateRaised) {
                            return DatePickerWidget(
                              lastDate: DateTime.now(),
                              firstDate: DateTime.now().add(const Duration(days: -Constants.DEFAULT_DAY_DURATION_OFFSET)),
                              initialDate: dateRaised,
                              onConfirm: context.read<ActionLogDetailCubit>().onDateRaisedChanged,
                              title: LocaleKeys.date_raised.tr(),
                            );
                          },
                        ),
                      ),
                      AttributeItem(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: BlocSelector<ActionLogDetailCubit, ActionLogDetailState, DateTime?>(
                          selector: (state) => state.actionLog.dueDate,
                          builder: (context, dateRaised) {
                            return DatePickerWidget(
                              lastDate: DateTime.now(),
                              firstDate: DateTime.now().add(const Duration(days: -Constants.DEFAULT_DAY_DURATION_OFFSET)),
                              initialDate: dateRaised,
                              onConfirm: context.read<ActionLogDetailCubit>().onDueDateChanged,
                              title: LocaleKeys.due_date.tr(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      CmoHeaderTile(
                        title: LocaleKeys.raised_against.tr(),
                        backgroundColor: context.colors.blueDark2,
                      ),
                      selectMemberWidget(),
                      buildPhotoSection(),
                      buildSelectReason(),
                      const SizedBox(height: 12),
                      BlocBuilder<ActionLogDetailCubit, ActionLogDetailState>(
                        builder: (context, state) {
                          return GeneralCommentWidget(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            initialValue: state.actionLog.actionName,
                            height: 150,
                            maxLines: 5,
                            hintText: '',
                            title: LocaleKeys.add_action.tr(),
                            shouldShowTitle: true,
                            titleTextStyle: context.textStyles.bodyBold.blueDark2,
                            textStyle: context.textStyles.bodyNormal.blueDark2,
                            onChanged: cubit.onChangeActionDescription,
                          );
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).padding.bottom + 50),
                    ],
                  ),
                  BlocSelector<ActionLogDetailCubit, ActionLogDetailState, UserRoleEnum?>(
                    selector: (state) => state.activeUserRole,
                    builder: (context, activeUserRole) {
                      if (activeUserRole?.isFarmerMember ?? false) {
                        return InactiveWidget(
                          margin: const EdgeInsets.only(top: 60),
                          inactiveColor: context.colors.white.withOpacity(0.4),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BlocSelector<ActionLogDetailCubit, ActionLogDetailState, bool>(
                  selector: (state) => state.activeUserRole?.isFarmerMember ?? false,
                  builder: (context, isFarmerMember) {
                    final title = isFarmerMember ? LocaleKeys.actionTaken.tr() : LocaleKeys.save.tr();
                    return CmoFilledButton(
                      title: title,
                      onTap: onSave,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget isMajorWidget() {
    return BlocSelector<ActionLogDetailCubit, ActionLogDetailState, bool?>(
      selector: (state) => state.actionLog.isMajor,
      builder: (context, isMajor) {
        final titleString = (isMajor ?? false) ? LocaleKeys.major_action_detail.tr() : LocaleKeys.minor_action_detail.tr();
        final titleBackgroundColor = (isMajor ?? false) ? context.colors.red : context.colors.orange9736;
        final titleIcon = (isMajor ?? false) ? Assets.icons.icWarningWhite.svg() : Assets.icons.icCloseWhite.svg();
        return Column(
          children: [
            Container(
              color: titleBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      titleString,
                      style: context.textStyles.bodyBold.white,
                    ),
                  ),
                  titleIcon,
                ],
              ),
            ),
            CmoSwitch(
              displaySwitchAsPrefix: true,
              value: isMajor ?? false,
              title: '${LocaleKeys.major_action.tr()}?',
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              spaceBetween: 10,
              textStyle: context.textStyles.bodyNormalItalic.blueDark2,
              onChanged: context.read<ActionLogDetailCubit>().changeMajorAction,
            ),
          ],
        );
      },
    );
  }

  Widget selectMemberWidget() {
    return BlocBuilder<ActionLogDetailCubit, ActionLogDetailState>(
      builder: (context, state) {
        final selectedItems = state.selectedMembers
            .map(
              (e) =>
              BottomSheetMultipleSelectionItem<Farm>(
                item: e,
                id: e.farmId,
                titleValue: e.farmName,
              ),
        )
            .toList();
        return Column(
          children: [
            BottomSheetSelection(
              hintText: LocaleKeys.addMember.tr(),
              hintTextStyle: context.textStyles.bodyBold.blueDark3,
              value: state.selectedMembers.length.toString(),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              rightIconData: Assets.icons.icArrowDown.svgBlack,
              onTap: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                if (state.completedMembers.isBlank) return;
                await showCustomBottomSheet<void>(
                  context,
                  content: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.icMembers.svg(
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              LocaleKeys.members.tr(),
                              style: context.textStyles.bodyBold.blueDark2.copyWith(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: BottomSheetMultipleSelection<Farm>(
                            listItems: state.completedMembers
                                .map(
                                  (e) => BottomSheetMultipleSelectionItem(
                                item: e,
                                id: e.farmId,
                                titleValue: e.farmName,
                              ),
                            )
                                .toList(),
                            selectedItems: selectedItems,
                            onSave: cubit.onSelectMember,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            MultipleSelectionWidget(
              items: selectedItems,
              onRemove: cubit.onRemoveMember,
            ),
          ],
        );
      },
    );
  }

  Widget buildPhotoSection() {
    return BlocBuilder<ActionLogDetailCubit, ActionLogDetailState>(
      builder: (context, state) {
        return RegisterPhotoSection(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          navigateToCamera: navigateToCamera,
          photos: state.photos
              .map(
                (e) => RegisterPhotoModel(
              photo: e.photo,
              photoId: e.actionLogPhotoId,
            ),
          )
              .toList(),
          onRemove: context.read<ActionLogDetailCubit>().onRemovePhoto,
        );
      },
    );
  }

  Widget buildSelectReason() {
    return BlocBuilder<ActionLogDetailCubit, ActionLogDetailState>(
      builder: (context, state) {
        return BottomSheetSelection(
          hintText: LocaleKeys.nc_reason.tr(),
          hintTextStyle: context.textStyles.bodyBold.blueDark3,
          value: state.selectedReason?.rejectReasonName,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          displayHorizontal: false,
          rightIconData: Assets.icons.icArrowDown.svgBlack,
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (state.rejectReasons.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: BottomSheetSelectionWithSearch(
                listItems: state.rejectReasons
                    .map(
                      (e) => BottomSheetMultipleSelectionItem<RejectReason>(
                        item: e,
                        id: e.rejectReasonId.toString(),
                        titleValue: e.rejectReasonName,
                      ),
                    )
                    .toList(),
                onSelect: cubit.onSelectReason,
              ),
            );
          },
        );
      },
    );
  }
}
