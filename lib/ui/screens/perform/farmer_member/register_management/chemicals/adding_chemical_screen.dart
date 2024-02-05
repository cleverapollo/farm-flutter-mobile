import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/chemical.dart';
import 'package:cmo/model/chemical_application_method/chemical_application_method.dart';
import 'package:cmo/state/register_management_chemical_cubit/register_management_chemical_cubit.dart';
import 'package:cmo/state/register_management_chemical_cubit/register_management_chemical_state.dart';
import 'package:cmo/ui/components/date_picker_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingChemicalScreen extends BaseStatefulWidget {
  AddingChemicalScreen({
    super.key,
    this.data,
  }) : super(
          screenName: data == null
              ? LocaleKeys.add_chemical.tr()
              : LocaleKeys.chemical_detail.tr(),
        );

  final Chemical? data;

  static Future<dynamic> push(BuildContext context, {Chemical? data}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider<RMChemicalCubit>(
                create: (_) => RMChemicalCubit()..initAddData(data: data),
                child: AddingChemicalScreen(data: data))));
  }

  @override
  State<AddingChemicalScreen> createState() => _AddingChemicalScreenState();
}

class _AddingChemicalScreenState extends BaseStatefulWidgetState<AddingChemicalScreen> {
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _commentController.text = widget.data?.comment ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RMChemicalCubit, RMChemicalState>(
      builder: (context, state) {
        final cubit = context.read<RMChemicalCubit>();

        return Scaffold(
          appBar: CmoAppBar(
            title: widget.data == null
                ? LocaleKeys.add_chemical.tr()
                : LocaleKeys.chemical_detail.tr(),
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
            onTapTrailing: Navigator.of(context).pop,
          ),
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 20),
                        child: Column(
                          children: [
                            BlocBuilder<RMChemicalCubit, RMChemicalState>(
                              builder: (context, state) {
                                return BottomSheetSelection(
                                  hintText: LocaleKeys.chemicalType.tr(),
                                  value: state.chemicalTypeSelect
                                          ?.chemicalTypeName ??
                                      state.chemical.chemicalType,
                                  margin: EdgeInsets.zero,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 14),
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    if (state.chemicalTypes.isBlank) return;
                                    await showCustomBottomSheet<void>(
                                      context,
                                      content: ListView.builder(
                                        itemCount: state.chemicalTypes.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () {
                                              cubit.onChangeData(
                                                  chemicalType: state
                                                      .chemicalTypes[index]);
                                              Navigator.pop(context);
                                            },
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24.0),
                                              child: Text(
                                                state.chemicalTypes[index]
                                                        .chemicalTypeName ??
                                                    '',
                                                style: context
                                                    .textStyles.bodyBold
                                                    .copyWith(
                                                  color:
                                                      context.colors.blueDark2,
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
                            ),
                            BlocSelector<RMChemicalCubit, RMChemicalState,
                                ChemicalApplicationMethod?>(
                              selector: (state) =>
                                  state.chemicalApplicationMethodSelect,
                              builder:
                                  (context, chemicalApplicationMethodSelect) {
                                return BottomSheetSelection(
                                  hintText:
                                      LocaleKeys.chemicalApplicationMethod.tr(),
                                  value: chemicalApplicationMethodSelect
                                          ?.hemicalApplicationMethodName ??
                                      state.chemical.chemicalApplicationMethod,
                                  margin: EdgeInsets.zero,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 14),
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    if (state.chemicalApplicationMethods
                                        .isBlank) return;
                                    await showCustomBottomSheet<void>(
                                      context,
                                      content: ListView.builder(
                                        itemCount: state
                                            .chemicalApplicationMethods.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () {
                                              cubit.onChangeData(
                                                  chemicalApplicationMethod:
                                                      state.chemicalApplicationMethods[
                                                          index]);
                                              Navigator.pop(context);
                                            },
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24.0),
                                              child: Text(
                                                state
                                                        .chemicalApplicationMethods[
                                                            index]
                                                        .hemicalApplicationMethodName ??
                                                    '',
                                                style: context
                                                    .textStyles.bodyBold
                                                    .copyWith(
                                                  color:
                                                      context.colors.blueDark2,
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
                            ),
                            BlocSelector<RMChemicalCubit, RMChemicalState,
                                Camp?>(
                              selector: (state) => state.campSelect,
                              builder: (context, campSelect) {
                                return BottomSheetSelection(
                                  hintText:
                                      '${LocaleKeys.compartmentName.tr()} / ${LocaleKeys.campName.tr()}',
                                  value: campSelect?.campName ??
                                      state.chemical.campName,
                                  margin: EdgeInsets.zero,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 14),
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    if (state.camps.isBlank) return;
                                    await showCustomBottomSheet<void>(
                                      context,
                                      content: ListView.builder(
                                        itemCount: state.camps.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: () {
                                              cubit.onChangeData(
                                                  camp: state.camps[index]);
                                              Navigator.pop(context);
                                            },
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24.0),
                                              child: Text(
                                                state.camps[index].campName ??
                                                    '',
                                                style: context
                                                    .textStyles.bodyBold
                                                    .copyWith(
                                                  color:
                                                      context.colors.blueDark2,
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
                            ),
                            AttributeItem(
                              child: DatePickerWidget(
                                initialDate: state.chemical.date,
                                firstDate: DateTime.now().add(const Duration(days: -1000)),
                                lastDate: DateTime.now().add(const Duration(days: 1000)),
                                onConfirm: (date) => cubit.onChangeData(dateTime: date),
                                title: LocaleKeys.dateIssued.tr(),
                              ),
                            ),
                            AttributeItem(
                              child: InputAttributeItem(
                                  initialValue:
                                      '${state.chemical.openingStock ?? ''}',
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  keyboardType: TextInputType.number,
                                  hintText:
                                      LocaleKeys.openingStockAndPurchases.tr(),
                                  onChanged: (value) => cubit.onChangeData(
                                      openStock: double.tryParse(value))),
                            ),
                            AttributeItem(
                              child: InputAttributeItem(
                                  initialValue:
                                      '${state.chemical.issued ?? ''}',
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  keyboardType: TextInputType.number,
                                  hintText: LocaleKeys.issued.tr(),
                                  onChanged: (value) => cubit.onChangeData(
                                      issue: double.tryParse(value))),
                            ),
                            AttributeItem(
                              child: InputAttributeItem(
                                  initialValue:
                                      '${state.chemical.balance ?? ''}',
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  keyboardType: TextInputType.number,
                                  hintText: LocaleKeys.balance.tr(),
                                  onChanged: (value) => cubit.onChangeData(
                                      balance: double.tryParse(value))),
                            ),
                            AttributeItem(
                              child: InputAttributeItem(
                                  initialValue: state.chemical.mixture ?? '',
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  hintText: LocaleKeys.mixture.tr(),
                                  onChanged: (value) =>
                                      cubit.onChangeData(mixture: value)),
                            ),
                            AttributeItem(
                              child: InputAttributeItem(
                                  initialValue:
                                      '${state.chemical.usagePerHa ?? ''}',
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  keyboardType: TextInputType.number,
                                  hintText: LocaleKeys.usagePerHa.tr(),
                                  onChanged: (value) => cubit.onChangeData(
                                      usagePerHa: double.tryParse(value))),
                            ),
                            const SizedBox(height: 24),
                            Expanded(
                              child: TextField(
                                controller: _commentController,
                                minLines: 10,
                                maxLines: 100,
                                onChanged: (value) =>
                                    cubit.onChangeData(comment: value),
                                decoration: InputDecoration(
                                  hintText: LocaleKeys.comments.tr(),
                                ),
                              ),
                            ),
                            Center(
                              child: CmoFilledButton(
                                title: LocaleKeys.save.tr(),
                                onTap: () async {
                                  final canNext = await cubit.onSave();

                                  if (canNext && context.mounted) {
                                    Navigator.pop(context, true);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
