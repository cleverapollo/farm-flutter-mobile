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
import 'package:cmo/ui/screens/perform/farmer_member/cmo_farm_app_bar.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetsAndDiseaseAddScreen extends StatefulWidget {
  const PetsAndDiseaseAddScreen({super.key, this.data});

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

class _PetsAndDiseaseAddScreenState extends State<PetsAndDiseaseAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoFarmAppBar.showTrailingAndFarmName(
        title: LocaleKeys.add_pets_and_disease.tr(),
      ),
      body: BlocBuilder<PetsAndDiseasesCubit, PetsAndDiseasesState>(
        builder: (context, state) {
          final cubit = context.read<PetsAndDiseasesCubit>();

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

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
                    initialValue: '${state.data.numberOfOutbreaks ?? ''}',
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
                    initialValue: '${state.data.areaLost ?? ''}',
                    onChanged: (value) {
                      cubit.onChangeData(areaLost: double.tryParse(value));
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: InputBorder.none),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Text(
                        '${state.selectPestsAndDiseasesRegisterTreatmentMethods.length} ${LocaleKeys.treatment_methods.tr()}',
                        style: context.textStyles.bodyBold
                            .copyWith(color: context.colors.black),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () async {
                            final result = await _SelectPropertyDamaged.push(
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
                          child: Assets.icons.icAdd.svgBlack),
                      const SizedBox(width: 8.0),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    LocaleKeys.generalComments.tr(),
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: state.data.comment ?? '',
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
                  const SizedBox(height: 40),
                  Align(
                    child: CmoFilledButton(
                        title: LocaleKeys.save.tr(),
                        onTap: () async {
                          final canNext = await cubit.onSave();

                          if (canNext && context.mounted) {
                            Navigator.pop(context, true);
                          }
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

class _SelectPropertyDamaged extends StatefulWidget {
  const _SelectPropertyDamaged({
    required this.treatmentMethods,
    required this.selectTreatmentMethod,
  });

  final List<TreatmentMethod> treatmentMethods;
  final List<PestsAndDiseasesRegisterTreatmentMethod> selectTreatmentMethod;

  @override
  State<StatefulWidget> createState() => _SelectPropertyDamagedState();

  static Future<dynamic> push({
    required BuildContext context,
    required List<TreatmentMethod> treatmentMethods,
    required List<PestsAndDiseasesRegisterTreatmentMethod>
        selectTreatmentMethod,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _SelectPropertyDamaged(
          treatmentMethods: treatmentMethods,
          selectTreatmentMethod: selectTreatmentMethod,
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
    selectedItems.addAll(widget.selectTreatmentMethod
        .map((e) => TreatmentMethod(treatmentMethodId: e.treatmentMethodId))
        .toList());
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
              itemCount: widget.treatmentMethods.length,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              itemBuilder: (context, index) =>
                  _buildItem(widget.treatmentMethods[index]),
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
          final canAdd = selectedItems.firstWhereOrNull(
                  (e) => e.treatmentMethodId == item.treatmentMethodId) ==
              null;
          if (canAdd) {
            selectedItems.add(item);
          } else {
            selectedItems.removeWhere(
                (e) => e.treatmentMethodId == item.treatmentMethodId);
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
