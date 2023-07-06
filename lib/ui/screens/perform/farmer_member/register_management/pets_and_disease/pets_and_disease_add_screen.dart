import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/pest_and_disease_type/pest_and_disease_type.dart';
import 'package:cmo/model/pests_and_diseases_register_treatment_method/pests_and_diseases_register_treatment_method.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_cubit.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/pets_and_disease/dialog/pets_and_disease_adding_dialog.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/pets_and_disease/dialog/pets_and_disease_required_dialog.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetsAndDiseaseAddScreen extends StatefulWidget {
  const PetsAndDiseaseAddScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider<PetsAndDiseasesCubit>(
                create: (_) => PetsAndDiseasesCubit()..initAddData(),
                child: const PetsAndDiseaseAddScreen())));
  }

  @override
  State<PetsAndDiseaseAddScreen> createState() =>
      _PetsAndDiseaseAddScreenState();
}

class _PetsAndDiseaseAddScreenState extends State<PetsAndDiseaseAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.add_pets_and_disease.tr(),
        showLeading: true,
      ),
      body: BlocBuilder<PetsAndDiseasesCubit, PetsAndDiseasesState>(
        builder: (context, state) {
          final cubit = context.read<PetsAndDiseasesCubit>();
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12.0),
                  Text(
                    '* ${LocaleKeys.name_pet_disease.tr()}',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                  ),
                  CmoDropdown(
                    name: '',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      isDense: true,
                      hintText: '',
                      hintStyle: context.textStyles.bodyNormal.grey,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: context.colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: context.colors.blue),
                      ),
                    ),
                    itemsData: state.petsAndDiseaseTypes
                        .map((e) => CmoDropdownItem(
                            id: e.id, name: e.pestsAndDiseaseTypeName ?? ''))
                        .toList(),
                    onChanged: (int? value) {
                      cubit.onChangeData(
                          selectPetsAndDiseaseType: PestsAndDiseaseType(
                        pestsAndDiseaseTypeName: state.petsAndDiseaseTypes
                            .map((e) => CmoDropdownItem(
                                id: e.id,
                                name: e.pestsAndDiseaseTypeName ?? ''))
                            .toList()
                            .where((element) => element.id == value)
                            .first
                            .name,
                      ));
                    },
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    LocaleKeys.numbers_of_outbreaks.tr(),
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    onChanged: (value) {
                      cubit.onChangeData(numberOfOutbreaks: int.parse(value));
                    },
                    decoration: const InputDecoration(
                        //labelText: "Phone number",
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: InputBorder.none),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    LocaleKeys.area_lost.tr(),
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    onChanged: (value) {
                      cubit.onChangeData(areaLost: int.parse(value));
                    },
                    decoration: const InputDecoration(
                        //labelText: "Phone number",
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: InputBorder.none),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Text(
                        state.pestsAndDiseasesRegisterTreatmentMethods.isEmpty
                            ? '0 ${LocaleKeys.treatment_methods.tr()}'
                            : '${LocaleKeys.treatment_method.tr()}: ${state.pestsAndDiseasesRegisterTreatmentMethods.length}',
                        style: context.textStyles.bodyBold
                            .copyWith(color: context.colors.black),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () async {
                            if (state.selectPetsAndDiseaseType == null) {
                              await showPetsAndDiseaseRequiredDialog(context);
                            } else {
                              final result = await showPetsAndDiseaseAddingDialog(
                                  context,
                                  state
                                      .pestsAndDiseasesRegisterTreatmentMethods);

                              if (result != null) {
                                cubit.onChangeData(
                                    selectPestsAndDiseasesRegisterTreatmentMethods:
                                        result);
                              }
                            }
                          },
                          child: Assets.icons.icAdd.svgBlack),
                      const SizedBox(width: 8.0),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: InputBorder.none),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    LocaleKeys.generalComments.tr(),
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    onChanged: (value) {
                      cubit.onChangeData(comment: value);
                    },
                    decoration: const InputDecoration(
                        //labelText: "Phone number",
                        contentPadding: EdgeInsets.all(
                            8), //  <- you can it to 0.0 for no space
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: InputBorder.none),
                  ),
                  const SizedBox(height: 12.0),
                  AttributeItem(
                    child: SelectorAttributeItem(
                      hintText: '',
                      text: LocaleKeys.under_control.tr(),
                      contentPadding: const EdgeInsets.all(4),
                      trailing: SizedBox(
                        width: 24,
                        child: Switch(
                          value: state.underControl ?? false,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (bool value) {
                            cubit.onChangeData(underControl: value);
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  AttributeItem(
                    child: SelectorAttributeItem(
                      hintText: '',
                      text: LocaleKeys.carRaised.tr(),
                      contentPadding: const EdgeInsets.all(4),
                      trailing: SizedBox(
                        width: 24,
                        child: Switch(
                          value: state.carRaised ?? false,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (bool value) {
                            cubit.onChangeData(carRaised: value);
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  AttributeItem(
                    child: SelectorAttributeItem(
                      hintText: '',
                      text: LocaleKeys.carClosed.tr(),
                      contentPadding: const EdgeInsets.all(4),
                      trailing: SizedBox(
                        width: 24,
                        child: Switch(
                          value: state.carClosed ?? false,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (bool value) {
                            cubit.onChangeData(carClosed: value);
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    child: CmoFilledButton(
                        title: LocaleKeys.save.tr(),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
