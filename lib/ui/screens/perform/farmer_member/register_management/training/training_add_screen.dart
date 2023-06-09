import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/l10n/locale_keys.g.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class TrainingAddScreen extends StatefulWidget {
  const TrainingAddScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const TrainingAddScreen()));
  }

  @override
  State<TrainingAddScreen> createState() => _TrainingAddScreenState();
}

class _TrainingAddScreenState extends State<TrainingAddScreen> {
  final signatureKey = GlobalKey<SfSignaturePadState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.add_training.tr(),
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
                '* ${LocaleKeys.training_type.tr()}',
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
                itemsData: [
                  CmoDropdownItem(id: 1, name: 'Test 1'),
                  CmoDropdownItem(id: 2, name: 'Test 2'),
                  CmoDropdownItem(id: 3, name: 'Test 3'),
                ],
                onChanged: (int? value) {},
              ),
              const SizedBox(height: 12.0),
              Text(
                '* ${LocaleKeys.date.tr()}',
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.black),
              ),
              GestureDetector(
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().add(const Duration(days: -1000000)),
                    lastDate: DateTime.now().add(const Duration(days: 1000000)),
                  );
                },
                child: const AttributeItem(
                  child: SelectorAttributeItem(
                    hintText: '',
                    text: '',
                    contentPadding: EdgeInsets.all(4),
                    trailing: SizedBox(),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                LocaleKeys.expiry_date.tr(),
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.black),
              ),
              GestureDetector(
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().add(const Duration(days: -1000000)),
                    lastDate: DateTime.now().add(const Duration(days: 1000000)),
                  );
                },
                child: const AttributeItem(
                  child: SelectorAttributeItem(
                    hintText: '',
                    text: '',
                    contentPadding: EdgeInsets.all(4),
                    trailing: SizedBox(),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                '* ${LocaleKeys.trainer_name.tr()}',
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
                '* ${LocaleKeys.trainee_name.tr()}',
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
                itemsData: [
                  CmoDropdownItem(id: 1, name: 'Test 1'),
                  CmoDropdownItem(id: 2, name: 'Test 2'),
                  CmoDropdownItem(id: 3, name: 'Test 3'),
                ],
                onChanged: (int? value) {},
              ),
              const SizedBox(height: 12.0),
              Text(
                '* ${LocaleKeys.generalComments.tr()}',
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
              const SizedBox(height: 12),
              Align(
                child: Text(
                  LocaleKeys.signature.tr(),
                  style: context.textStyles.bodyBold
                      .copyWith(color: context.colors.black),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: size.height * 0.5,
                  width: size.width,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12)),
                  child: SfSignaturePad(
                    key: signatureKey,
                    maximumStrokeWidth: 1,
                    minimumStrokeWidth: 1,
                    onDrawStart: () {
                      return false;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                child: CmoFilledButton(
                    title: LocaleKeys.clear_signature.tr(),
                    onTap: () {
                      signatureKey.currentState?.clear();
                    }),
              ),
              const SizedBox(height: 12),
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
      ),
    );
  }
}
