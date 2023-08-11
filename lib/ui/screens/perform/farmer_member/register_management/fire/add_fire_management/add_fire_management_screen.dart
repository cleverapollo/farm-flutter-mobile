import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/fire/fire_register.dart';
import 'package:cmo/model/fire_cause/fire_cause.dart';
import 'package:cmo/state/fire_cubit/fire_cubit.dart';
import 'package:cmo/state/fire_cubit/fire_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_location_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddFireManagementScreen extends StatefulWidget {
  const AddFireManagementScreen({super.key, this.fireRegister});

  final FireRegister? fireRegister;

  @override
  State<StatefulWidget> createState() => _AddFireManagementScreenState();

  static Future<dynamic> push(BuildContext context,
      {FireRegister? fireRegister}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddFireManagementScreen(fireRegister: fireRegister),
      ),
    );
  }
}

class _AddFireManagementScreenState extends State<AddFireManagementScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FireCubit>(
      create: (_) =>
          FireCubit()..initAddData(fireRegister: widget.fireRegister),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          appBar: CmoAppBar(
            title: widget.fireRegister == null
                ? LocaleKeys.addFire.tr()
                : 'Edit Fire',
            leading: Assets.icons.icArrowLeft.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icClose.svgBlack,
            onTapTrailing: Navigator.of(context).pop,
          ),
          body: BlocSelector<FireCubit, FireState, bool>(
            selector: (state) => state.isLoading,
            builder: (context, isLoading) {
              if (isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildInputArea(),
                    const SizedBox(height: 80),
                  ],
                ),
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: BlocBuilder<FireCubit, FireState>(
            builder: (context, _) {
              return CmoFilledButton(
                  title: LocaleKeys.save.tr(),
                  onTap: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      context.read<FireCubit>().onSave().then((value) {
                        if (value != null) {
                          showSnackSuccess(
                              msg: 'Save Fire $value Successfully');
                          Navigator.pop(context, true);
                        } else {
                          showSnackError(
                              msg: 'Something was wrong, please try again.');
                        }
                      });
                    }
                  });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return BlocBuilder<FireCubit, FireState>(
      buildWhen: (previous, current) =>
          previous.fireRegister != current.fireRegister,
      builder: (context, state) {
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
                  _selectFireCause(),
                  _buildSelectDateDetected(),
                  _buildSelectDateExtinguished(),
                  AttributeItem(
                    child: InputAttributeItem(
                      initialValue: '${state.fireRegister.areaBurnt ?? ''}',
                      hintText: LocaleKeys.areaBurntHa.tr(),
                      hintTextStyle: context.textStyles.bodyBold.black,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        context.read<FireCubit>().onDataChange(
                              areaBurnt: double.tryParse(value) ?? 0,
                            );
                      },
                    ),
                  ),
                  AttributeItem(
                    child: InputAttributeItem(
                      initialValue:
                          '${state.fireRegister.commercialAreaLoss ?? ''}',
                      hintText: LocaleKeys.commercialAreaLossHa.tr(),
                      hintTextStyle: context.textStyles.bodyBold.black,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        context.read<FireCubit>().onDataChange(
                              commercialAreaLoss: double.tryParse(value) ?? 0,
                            );
                      },
                    ),
                  ),
                  SelectLocationWidget(
                    latitudeTitle: LocaleKeys.latitudeOriginDecimal.tr(),
                    longitudeTitle: LocaleKeys.longitudeOriginDecimal.tr(),
                    appbarTitle: LocaleKeys.location.tr(),
                    lat: '${state.fireRegister.latitude ?? ''}',
                    lng: '${state.fireRegister.longitude ?? ''}',
                    onChooseLocation: (locationModel) {
                      context.read<FireCubit>().onDataChange(
                          lat: locationModel.latitude ?? 0,
                          lng: locationModel.longitude ?? 0);
                    },
                  ),
                  AttributeItem(
                    child: SelectItemWidget(
                      initValue: state.fireRegister.carRaisedDate != null,
                      title: LocaleKeys.carRaised.tr(),
                      onSelect: (isSelected) {
                        context
                            .read<FireCubit>()
                            .onDataChange(carRaised: isSelected);
                      },
                    ),
                  ),
                  AttributeItem(
                    child: SelectItemWidget(
                      initValue: state.fireRegister.carClosedDate != null,
                      title: LocaleKeys.carClosed.tr(),
                      onSelect: (isSelected) {
                        context
                            .read<FireCubit>()
                            .onDataChange(carClosed: isSelected);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: GeneralCommentWidget(
                      initialValue: state.fireRegister.comment,
                      hintText: LocaleKeys.generalComments.tr(),
                      onChanged: (value) {
                        context.read<FireCubit>().onDataChange(comment: value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _selectFireCause() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            LocaleKeys.fireCause.tr(),
            style: context.textStyles.bodyBold.black,
          ),
        ),
        BlocBuilder<FireCubit, FireState>(
          builder: (context, state) {
            return CmoDropdown<FireCause>(
              name: 'FireCauseId',
              hintText: LocaleKeys.fireCause.tr(),
              validator: requiredValidator,
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                isDense: true,
                hintText:
                    '${LocaleKeys.select.tr()} ${LocaleKeys.fireCause.tr().toLowerCase()}',
                hintStyle: context.textStyles.bodyNormal.grey,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.colors.blue),
                ),
              ),
              onChanged: (data) {
                context.read<FireCubit>().onDataChange(fireCauseSelect: data);
              },
              initialValue: state.fireCauseSelect,
              itemsData: state.fireCauses
                  .map((e) =>
                      CmoDropdownItem(id: e, name: e.fireCauseName ?? ''))
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSelectDateDetected() {
    return BlocBuilder<FireCubit, FireState>(
      buildWhen: (previous, current) =>
          previous.fireRegister != current.fireRegister,
      builder: (context, state) {
        return AttributeItem(
          child: CmoDatePicker(
            initialValue: state.fireRegister.date,
            name: 'DateDetected',
            hintText: LocaleKeys.dateDetected.tr(),
            validator: (DateTime? value) {
              if (value == null) return null;
              if (value.millisecondsSinceEpoch >
                  DateTime.now().millisecondsSinceEpoch) {
                return 'Detected date cannot be in the future';
              }
              return null;
            },
            onChanged: (p0) {
              context.read<FireCubit>().onDataChange(date: p0);
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
              hintText: LocaleKeys.dateDetected.tr(),
              hintStyle: context.textStyles.bodyBold.black,
              labelText: LocaleKeys.dateDetected.tr(),
              labelStyle: context.textStyles.bodyBold.black,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectDateExtinguished() {
    return BlocBuilder<FireCubit, FireState>(
      buildWhen: (previous, current) =>
          previous.fireRegister != current.fireRegister,
      builder: (context, state) {
        return AttributeItem(
          child: CmoDatePicker(
            initialValue: state.fireRegister.extinguished,
            name: 'DateExtinguished',
            hintText: LocaleKeys.dateExtinguished.tr(),
            validator: (DateTime? value) {
              if (value == null) return null;
              if (value.millisecondsSinceEpoch >
                  DateTime.now().millisecondsSinceEpoch) {
                return 'Extinguished date cannot be in the future';
              }
              final detectedValue =
                  _formKey.currentState?.value['DateDetected'] as DateTime?;
              if (detectedValue != null &&
                  value.millisecondsSinceEpoch <
                      detectedValue.millisecondsSinceEpoch) {
                return 'Extinguished date must be after detected date';
              }
              return null;
            },
            onChanged: (p0) {
              context.read<FireCubit>().onDataChange(extinguished: p0);
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
              hintText: LocaleKeys.dateExtinguished.tr(),
              hintStyle: context.textStyles.bodyBold.black,
              labelText: LocaleKeys.dateExtinguished.tr(),
              labelStyle: context.textStyles.bodyBold.black,
            ),
          ),
        );
      },
    );
  }
}
