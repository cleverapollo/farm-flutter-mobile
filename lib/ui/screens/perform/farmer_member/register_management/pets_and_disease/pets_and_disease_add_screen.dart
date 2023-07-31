import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/pest_and_disease_type/pest_and_disease_type.dart';
import 'package:cmo/model/pests_and_diseases_register_treatment_method/pests_and_diseases_register_treatment_method.dart';
import 'package:cmo/model/treament_method/treament_method.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_cubit.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
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
                  CmoDropdown<PestsAndDiseaseType>(
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
                            id: e, name: e.pestsAndDiseaseTypeName ?? ''))
                        .toList(),
                    onChanged: (data) {
                      cubit.onChangeData(selectPetsAndDiseaseType: data);
                    },
                    initialValue: state.selectPetsAndDiseaseType,
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
                        '${state.pestsAndDiseasesRegisterTreatmentMethods.length} ${LocaleKeys.treatment_methods.tr()}',
                        style: context.textStyles.bodyBold
                            .copyWith(color: context.colors.black),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () async {
                            final result = await _SelectPropertyDamaged.push(
                                context, state.treatmentMethods);

                            if (result != null) {
                              cubit.onChangeData(
                                  selectPestsAndDiseasesRegisterTreatmentMethods:
                                      result as List<
                                          PestsAndDiseasesRegisterTreatmentMethod>);
                            }
                          },
                          child: Assets.icons.icAdd.svgBlack),
                      const SizedBox(width: 8.0),
                    ],
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
                        onTap: () => cubit.onSave(context)),
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

class _SelectPropertyDamaged extends StatefulWidget {
  const _SelectPropertyDamaged({
    required this.treatmentMethod,
  });

  final List<TreatmentMethod> treatmentMethod;

  @override
  State<StatefulWidget> createState() => _SelectPropertyDamagedState();

  static Future<dynamic> push(
    BuildContext context,
    List<TreatmentMethod> treatmentMethod,
  ) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _SelectPropertyDamaged(
          treatmentMethod: treatmentMethod,
        ),
      ),
    );
  }
}

class _SelectPropertyDamagedState extends State<_SelectPropertyDamaged> {
  final List<TreatmentMethod> selectedItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: 'Select Property Damaged',
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: widget.treatmentMethod.length,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              itemBuilder: (context, index) =>
                  _buildItem(widget.treatmentMethod[index]),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CmoFilledButton(
        title: LocaleKeys.save.tr(),
        onTap: () {
          Navigator.of(context).pop(selectedItems
              .map((e) => PestsAndDiseasesRegisterTreatmentMethod(
                    pestsAndDiseasesRegisterTreatmentMethodId: null,
                    pestsAndDiseasesRegisterTreatmentMethodNo:
                        DateTime.now().millisecondsSinceEpoch.toString(),
                    treatmentMethodId: e.treatmentMethodId,
                    isActive: true,
                    isMasterdataSynced: false,
                  ))
              .toList());
        },
      ),
    );
  }

  Widget _buildItem(TreatmentMethod item) {
    final activeItem = selectedItems.firstWhere(
        (element) => element.treatmentMethodId == item.treatmentMethodId,
        orElse: () => const TreatmentMethod());

    return InkWell(
      onTap: () {
        setState(() {
          if (selectedItems.contains(item)) {
            selectedItems.remove(item);
          } else {
            selectedItems.add(item);
          }
        });
      },
      child: AttributeItem(
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.treatmentMethodName ?? '',
                style: context.textStyles.bodyNormal.black,
              ),
            ),
            if (activeItem != const TreatmentMethod())
              _buildSelectedIcon()
            else
              Assets.icons.icCheckCircle.svg(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedIcon() {
    return Stack(
      children: [
        Assets.icons.icCheckCircle.svg(),
        Positioned.fill(
          child: Align(
            child: Assets.icons.icCheck.svg(),
          ),
        ),
      ],
    );
  }
}
