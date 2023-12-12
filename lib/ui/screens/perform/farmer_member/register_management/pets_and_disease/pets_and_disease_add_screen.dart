import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/pest_and_disease_type/pest_and_disease_type.dart';
import 'package:cmo/model/pests_and_diseases_register_treatment_method/pests_and_diseases_register_treatment_method.dart';
import 'package:cmo/model/pets_and_diseases/pets_and_diseases.dart';
import 'package:cmo/model/treament_method/treament_method.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_cubit.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/pets_and_disease/select_property_damaged.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/information_text_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/general_comment_widget.dart';

class PetsAndDiseaseAddScreen extends BaseStatefulWidget {
  PetsAndDiseaseAddScreen({
    super.key,
    this.data,
  }) : super(
          screenName: data == null
              ? LocaleKeys.add_pets_and_disease.tr()
              : LocaleKeys.pets_and_disease_detail.tr(),
        );

  final PetsAndDiseaseRegister? data;

  static Future<dynamic> push(BuildContext context,
      {PetsAndDiseaseRegister? data}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider<PetsAndDiseasesCubit>(
                create: (_) => PetsAndDiseasesCubit()..initAddData(data: data),
                child: PetsAndDiseaseAddScreen(data: data))));
  }

  @override
  State<PetsAndDiseaseAddScreen> createState() =>
      _PetsAndDiseaseAddScreenState();
}

class _PetsAndDiseaseAddScreenState extends BaseStatefulWidgetState<PetsAndDiseaseAddScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: widget.data == null
              ? LocaleKeys.add_pets_and_disease.tr()
              : LocaleKeys.pets_and_disease_detail.tr(),
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: BlocBuilder<PetsAndDiseasesCubit, PetsAndDiseasesState>(
          builder: (context, state) {
            final cubit = context.read<PetsAndDiseasesCubit>();

            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18.0),
                        CmoHeaderTile(
                          title: LocaleKeys.details.tr(),
                          backgroundColor: context.colors.blueDark2,
                        ),
                        buildSelectPetName(context, state),
                        InformationText(),
                        CmoHeaderTile(
                          title: LocaleKeys.additional_details_optional.tr(),
                          backgroundColor: context.colors.blueDark2,
                        ),
                        AttributeItem(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: InputAttributeItem(
                            initialValue:
                                (state.data.numberOfOutbreaks ?? '').toString(),
                            textStyle: context.textStyles.bodyNormal.blueDark2,
                            labelText: LocaleKeys.numbers_of_outbreaks.tr(),
                            labelTextStyle: context.textStyles.bodyNormal.black,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              cubit.onChangeData(numberOfOutbreaks: int.parse(value));
                            },
                          ),
                        ),
                        AttributeItem(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: InputAttributeItem(
                            initialValue: (state.data.areaLost ?? '').toString(),
                            textStyle: context.textStyles.bodyNormal.blueDark2,
                            labelText: LocaleKeys.area_lost.tr(),
                            labelTextStyle: context.textStyles.bodyNormal.black,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            onChanged: (value) {
                              cubit.onChangeData(areaLost: double.parse(value));
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        AttributeItem(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                          child: InkWell(
                            onTap: () async {
                              if (state.treatmentMethods.isBlank) {
                                return;
                              }

                              final result = await SelectPropertyDamaged.push(
                                  context: context,
                                  treatmentMethods: state.treatmentMethods,
                                  selectTreatmentMethod: state
                                      .selectPestsAndDiseasesRegisterTreatmentMethods);

                              if (result != null) {
                                cubit.onChangeData(
                                    selectPestsAndDiseasesRegisterTreatmentMethods:
                                    result as List<
                                        PestsAndDiseasesRegisterTreatmentMethod>);
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      '${state.selectPestsAndDiseasesRegisterTreatmentMethods.length} ${LocaleKeys.treatment_methods.tr()}',
                                      style: context.textStyles.bodyNormal.blueDark3,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Assets.icons.icUpdatedAddButton.svgBlack,
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        AttributeItem(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                          child: SelectorAttributeItem(
                            hintText: '',
                            text: LocaleKeys.under_control.tr(),
                            textStyle: context.textStyles.bodyNormal.blueDark3,
                            contentPadding: const EdgeInsets.all(4),
                            trailing: SizedBox(
                              width: 24,
                              child: Switch(
                                value: state.data.underControl ?? false,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onChanged: (bool value) {
                                  cubit.onChangeData(underControl: value);
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: GeneralCommentWidget(
                            hintText: '',
                            initialValue: state.data.comment,
                            shouldShowTitle: true,
                            height: 100,
                            textStyle: context.textStyles.bodyNormal.black,
                            onChanged: (value) {
                              cubit.onChangeData(comment: value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: CmoFilledButton(
                    title: LocaleKeys.save.tr(),
                    onTap: () async {
                      final canNext = await context.read<PetsAndDiseasesCubit>().onSave();
                      if (canNext && context.mounted) {
                        Navigator.pop(context, true);
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildSelectPetName(BuildContext context, PetsAndDiseasesState state) {
    return BottomSheetSelection(
      isShowError: state.isSelectPetTypeError,
      hintText: LocaleKeys.name_pet_disease.tr(),
      hintTextStyle: context.textStyles.bodyBold.blueDark3,
      displayHorizontal: false,
      value: state.selectPetsAndDiseaseType?.pestsAndDiseaseTypeName,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      onTap: () async {
        FocusScope.of(context).unfocus();
        if (state.petsAndDiseaseTypes.isBlank) return;
        await showCustomBottomSheet<void>(
          context,
          content: ListView.builder(
            itemCount: state.petsAndDiseaseTypes.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context.read<PetsAndDiseasesCubit>().onSelectPetsAndDiseaseType(state.petsAndDiseaseTypes[index]);
                  Navigator.pop(context);
                },
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    state.petsAndDiseaseTypes[index].pestsAndDiseaseTypeName ??
                        '',
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
  }
}
