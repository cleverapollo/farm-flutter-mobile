import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/fire/fire_register.dart';
import 'package:cmo/state/state.dart';

import 'package:cmo/ui/components/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddFireManagementScreen extends BaseStatefulWidget {
  AddFireManagementScreen({
    super.key,
    this.fireRegister,
    required this.locationModel,
  }) : super(
          screenName: fireRegister == null
              ? LocaleKeys.addFire.tr()
              : LocaleKeys.edit_fire.tr(),
        );

  final FireRegister? fireRegister;
  final LocationModel locationModel;

  @override
  State<StatefulWidget> createState() => _AddFireManagementScreenState();

  static Future<dynamic> push(
    BuildContext context, {
    FireRegister? fireRegister,
    required LocationModel locationModel,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider<FireRegisterDetailCubit>(
          create: (_) => FireRegisterDetailCubit()
            ..initialize(
              fireRegister: fireRegister,
              locationModel: locationModel,
            ),
          child: AddFireManagementScreen(
            fireRegister: fireRegister,
            locationModel: locationModel,
          ),
        ),
      ),
    );
  }
}

class _AddFireManagementScreenState extends BaseStatefulWidgetState<AddFireManagementScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: widget.fireRegister == null
              ? LocaleKeys.addFire.tr()
              : LocaleKeys.edit_fire.tr(),
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: BlocSelector<FireRegisterDetailCubit, FireRegisterDetailState, bool>(
          selector: (state) => state.loading,
          builder: (context, isLoading) {
            if (isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 35),
                  CmoHeaderTile(
                    title: LocaleKeys.additional_details_optional.tr(),
                    backgroundColor: context.colors.blueDark2,
                  ),
                  _selectFireCause(),
                  _buildSelectDateDetected(),
                  _buildSelectDateExtinguished(),
                  _buildInputArea(),
                  const SizedBox(height: 80),
                ],
              ),
            );
          },
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocBuilder<FireRegisterDetailCubit, FireRegisterDetailState>(
          builder: (context, state) {
            return CmoFilledButton(
              title: LocaleKeys.save.tr(),
              disable: state.fireRegister?.latitude == null,
              onTap: () async {
                await context.read<FireRegisterDetailCubit>().onSave(
                  onSuccess: () async {
                    showSnackSuccess(msg: 'Save Fire ${state.fireRegister?.fireRegisterNo} Successfully');
                    Navigator.pop(context, true);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return BlocBuilder<FireRegisterDetailCubit, FireRegisterDetailState>(
      buildWhen: (previous, current) =>
          previous.fireRegister != current.fireRegister,
      builder: (context, state) {
        return FormBuilder(
            key: _formKey,
            onChanged: () {},
            autovalidateMode: autoValidateMode,
            child: AutofillGroup(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AttributeItem(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: InputAttributeItem(
                      initialValue: '${state.fireRegister?.areaBurnt ?? ''}',
                      textStyle: context.textStyles.bodyNormal.blueDark2,
                      labelText: LocaleKeys.areaBurntHa.tr(),
                      labelTextStyle: context.textStyles.bodyNormal.black,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        context.read<FireRegisterDetailCubit>().onDataChange(
                          areaBurnt: double.tryParse(value) ?? 0,
                        );
                      },
                    ),
                  ),
                  AttributeItem(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: InputAttributeItem(
                      initialValue: '${state.fireRegister?.commercialAreaLoss ?? ''}',
                      textStyle: context.textStyles.bodyNormal.blueDark2,
                      labelText: LocaleKeys.commercialAreaLossHa.tr(),
                      labelTextStyle: context.textStyles.bodyNormal.blueDark2,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        context.read<FireRegisterDetailCubit>().onDataChange(
                              commercialAreaLoss: double.tryParse(value) ?? 0,
                            );
                      },
                    ),
                  ),
                  _buildLatLng(),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: GeneralCommentWidget(
                      hintText: '',
                      height: 120,
                      shouldShowTitle: true,
                      initialValue: state.fireRegister?.comment,
                      textStyle: context.textStyles.bodyNormal.black,
                      onChanged: (value) {
                        context.read<FireRegisterDetailCubit>().onDataChange(comment: value);
                      },
                    ),
                  ),
                ],
              ),
            ),
        );
      },
    );
  }

  Widget _buildLatLng() {
    return AttributeItem(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: BlocBuilder<FireRegisterDetailCubit, FireRegisterDetailState>(
        buildWhen: (previous, current) =>
            previous.fireRegister?.latitude != current.fireRegister?.latitude ||
            previous.fireRegister?.longitude != current.fireRegister?.longitude,
        builder: (context, position) {
          final cubit = context.read<FireRegisterDetailCubit>();
          final state = cubit.state;
          return CmoDropDownLayoutWidget(
            title: LocaleKeys.lat_long.tr(),
            subTitle: state.fireRegister?.latitude == null
                ? ''
                : '${state.fireRegister?.latitude?.toStringAsFixed(5)} , ${state.fireRegister?.longitude?.toStringAsFixed(5)}',
            subTitleAlignment: Alignment.center,
            subTitleTextStyle: context.textStyles.bodyNormal.blueDark2,
            isHideBorder: true,
            onTap: () async {
              final locationModel = LocationModel()
                ..latitude = state.fireRegister?.latitude
                ..longitude = state.fireRegister?.longitude;
              final result = await SelectLocationScreen.push(
                context,
                title: LocaleKeys.fire.tr(),
                farmName: state.activeFarm?.farmName,
                locationModel: locationModel,
                shouldShowPhotoButton: false,
              );
              if (result == null) return;
              final mapResult = result as LocationModel;

              cubit.onDataChange(
                lat: mapResult.latitude,
                lng: mapResult.longitude,
                selectAsiPhotoBase64s: mapResult.listImage,
              );
            },
          );
        },
      ),
    );
  }

  Widget _selectFireCause() {
    return BlocBuilder<FireRegisterDetailCubit, FireRegisterDetailState>(
      builder: (context, state) {
        final fireCauseId = state.fireRegister?.fireCauseId;
        final findIndex = state.fireCauses.indexWhere((element) => element.fireCauseId == fireCauseId);
        final initValue = findIndex != -1 ? state.fireCauses[findIndex] : null;
        return BottomSheetSelection(
          hintText: LocaleKeys.fireCause.tr(),
          hintTextStyle: context.textStyles.bodyNormal.blueDark2,
          value: initValue?.fireCauseName,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          displayHorizontal: false,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.fireCauses.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.fireCauses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context.read<FireRegisterDetailCubit>().onDataChange(
                          fireCauseSelect: state.fireCauses[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.fireCauses[index].fireCauseName ?? '',
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

  Widget _buildSelectDateDetected() {
    return BlocBuilder<FireRegisterDetailCubit, FireRegisterDetailState>(
      builder: (context, state) {
        return AttributeItem(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CmoDatePicker(
            name: 'DateDetected',
            onChanged: (date) => context.read<FireRegisterDetailCubit>().onDataChange(date: date),
            initialValue: state.fireRegister?.date,
            lastDate: DateTime.now(),
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 12,
              ),
              suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
              suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
              isDense: true,
              labelText: LocaleKeys.dateDetected.tr(),
              labelStyle: context.textStyles.bodyNormal.blueDark2,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectDateExtinguished() {
    return BlocBuilder<FireRegisterDetailCubit, FireRegisterDetailState>(
      builder: (context, state) {
        return AttributeItem(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CmoDatePicker(
            name: 'DateExtinguished',
            onChanged: (date) => context.read<FireRegisterDetailCubit>().onDataChange(extinguished: date),
            initialValue: state.fireRegister?.extinguished,
            lastDate: DateTime.now(),
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 12,
              ),
              suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
              suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
              isDense: true,
              labelText: LocaleKeys.dateExtinguished.tr(),
              labelStyle: context.textStyles.bodyNormal.blueDark2,
            ),
          ),
        );
      },
    );
  }
}
