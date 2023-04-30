import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/pets_and_disease/dialog/pets_and_disease_adding_dialog.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/pets_and_disease/dialog/pets_and_disease_required_dialog.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class PetsAndDiseaseAddScreen extends StatefulWidget {
  const PetsAndDiseaseAddScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => const PetsAndDiseaseAddScreen()));
  }

  @override
  State<PetsAndDiseaseAddScreen> createState() =>
      _PetsAndDiseaseAddScreenState();
}

class _PetsAndDiseaseAddScreenState extends State<PetsAndDiseaseAddScreen> {
  final dropDownNameData = <CmoDropdownItem<int>>[
    CmoDropdownItem(id: 1, name: 'Test 1'),
    CmoDropdownItem(id: 2, name: 'Test 2'),
    CmoDropdownItem(id: 3, name: 'Test 3'),
  ];

  CmoDropdownItem<int>? namePetDisease;
  CmoDropdownItem<int>? treatmentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CmoAppBarV2(
        title: 'Add Pets And Disease',
        showLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12.0),
              Text(
                '* Name Of Pet/Disease',
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
                itemsData: dropDownNameData,
                onChanged: (int? value) {
                  namePetDisease = dropDownNameData
                      .where((element) => element.id == value)
                      .first;
                },
              ),
              const SizedBox(height: 12.0),
              Text(
                'Numbers of Outbreaks',
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.black),
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {},
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
                'Area Lost(ha)',
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.black),
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {},
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
                    treatmentMethod == null
                        ? '0 Treatment Methods'
                        : 'Treatment Method: ${treatmentMethod?.name}',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () async {
                        if (namePetDisease == null) {
                          await showPetsAndDiseaseRequiredDialog(context);
                        } else {
                          final result =
                              await showPetsAndDiseaseAddingDialog(context);

                          if (result != null) {
                            treatmentMethod = result;
                            if (mounted) setState(() {});
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
                    //labelText: "Phone number",
                    contentPadding:
                        EdgeInsets.all(8), //  <- you can it to 0.0 for no space
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: InputBorder.none),
              ),
              const SizedBox(height: 12.0),
              Text(
                'General Comments',
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.black),
              ),
              const SizedBox(height: 8),
              TextFormField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                    //labelText: "Phone number",
                    contentPadding:
                        EdgeInsets.all(8), //  <- you can it to 0.0 for no space
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
                  text: 'Under Control',
                  contentPadding: const EdgeInsets.all(4),
                  trailing: SizedBox(
                    width: 24,
                    child: Switch(
                      value: false,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (bool value) {},
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              AttributeItem(
                child: SelectorAttributeItem(
                  hintText: '',
                  text: 'CAR Raised',
                  contentPadding: const EdgeInsets.all(4),
                  trailing: SizedBox(
                    width: 24,
                    child: Switch(
                      value: false,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (bool value) {},
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              AttributeItem(
                child: SelectorAttributeItem(
                  hintText: '',
                  text: 'CAR Closed',
                  contentPadding: const EdgeInsets.all(4),
                  trailing: SizedBox(
                    width: 24,
                    child: Switch(
                      value: false,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (bool value) {},
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Align(
                child: CmoFilledButton(
                    title: 'Save',
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
