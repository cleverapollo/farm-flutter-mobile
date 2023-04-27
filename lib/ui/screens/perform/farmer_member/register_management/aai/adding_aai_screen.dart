import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/accident_and_incident.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/screens/perform/farmer_member/camp_management/add_camp_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/constants.dart';
import 'package:flutter/material.dart';

class AddingAAIScreen extends StatefulWidget {
  AddingAAIScreen({Key? key}) : super(key: key);

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => AddingAAIScreen()));
  }

  @override
  State<AddingAAIScreen> createState() => _AddingAAIScreenState();
}

class _AddingAAIScreenState extends State<AddingAAIScreen> {
  AccidentAndIncident aai = AccidentAndIncident();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.add_aai.tr(),
        showLeading: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                children: [
                  CmoDropdown(
                    name: 'worker',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      isDense: true,
                      hintText: LocaleKeys.worker.tr(),
                      hintStyle: context.textStyles.bodyNormal.grey,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue)),
                    ),
                    itemsData: [
                      CmoDropdownItem(id: 1, name: 'Test 1'),
                      CmoDropdownItem(id: 2, name: 'Test 2'),
                      CmoDropdownItem(id: 3, name: 'Test 3'),
                    ],
                    onChanged: (value) {
                      aai = aai.copyWith(workerId: value);
                    },
                  ),
                  CmoDropdown(
                    name: 'jobDescription',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      isDense: true,
                      hintText: LocaleKeys.jobDescription.tr(),
                      hintStyle: context.textStyles.bodyNormal.grey,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue)),
                    ),
                    itemsData: [
                      CmoDropdownItem(id: 1, name: 'Test 1'),
                      CmoDropdownItem(id: 2, name: 'Test 2'),
                      CmoDropdownItem(id: 3, name: 'Test 3'),
                    ],
                    onChanged: (value) {
                      aai = aai.copyWith(workerId: value);
                    },
                  ),
                  CmoDropdown(
                    name: 'natureOfInjury',
                    style: context.textStyles.bodyBold
                        .copyWith(color: context.colors.black),
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      isDense: true,
                      hintText: LocaleKeys.nature_of_injury.tr(),
                      hintStyle: context.textStyles.bodyNormal.grey,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.colors.blue)),
                    ),
                    itemsData: [
                      CmoDropdownItem(id: 1, name: 'Test 1'),
                      CmoDropdownItem(id: 2, name: 'Test 2'),
                      CmoDropdownItem(id: 3, name: 'Test 3'),
                    ],
                    onChanged: (value) {
                      aai = aai.copyWith(natureOfInjuryId: value);
                    },
                  ),
                  GestureDetector(
                    onTap: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().add(Duration(days: -1000000)),
                        lastDate: DateTime.now().add(Duration(days: 1000000)),
                      );
                      aai = aai.copyWith(dateOfIncident: date);
                      setState(() {});
                    },
                    child: AttributeItem(
                      child: SelectorAttributeItem(
                          hintText: LocaleKeys.date_of_incident.tr(),
                          text: aai.dateOfIncident?.ddMMYyyy(),
                          contentPadding: const EdgeInsets.all(4),
                          trailing: Assets.icons.icCalendar.svgBlack),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().add(Duration(days: -1000000)),
                        lastDate: DateTime.now().add(Duration(days: 1000000)),
                      );
                      aai = aai.copyWith(dateRecieved: date);
                      setState(() {});
                    },
                    child: AttributeItem(
                      child: SelectorAttributeItem(
                          hintText: LocaleKeys.date_reported.tr(),
                          text: aai.dateRecieved?.ddMMYyyy(),
                          contentPadding: const EdgeInsets.all(4),
                          trailing: Assets.icons.icCalendar.svgBlack),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().add(Duration(days: -1000000)),
                        lastDate: DateTime.now().add(Duration(days: 1000000)),
                      );
                      aai = aai.copyWith(dateResumeWork: date);
                      setState(() {});
                    },
                    child: AttributeItem(
                      child: SelectorAttributeItem(
                          hintText: LocaleKeys.resumed_work_on.tr(),
                          text: aai.dateResumeWork?.ddMMYyyy(),
                          contentPadding: const EdgeInsets.all(4),
                          trailing: Assets.icons.icCalendar.svgBlack),
                    ),
                  ),
                  AttributeItem(
                    child: SelectorAttributeItem(
                      hintText: LocaleKeys.worker_disabled.tr(),
                      text: LocaleKeys.worker_disabled.tr(),
                      contentPadding: const EdgeInsets.all(4),
                      trailing: SizedBox(
                        width: 24,
                        child: Switch(
                          value: aai.workerDisabled == true,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (bool value) {
                            aai = aai.copyWith(workerDisabled: value);
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: TextField(
                      minLines: 10,
                      maxLines: 100,
                      onChanged: (value) {
                        aai = aai.copyWith(comment: value);
                      },
                      decoration: InputDecoration(
                        hintText: LocaleKeys.comments.tr(),
                      ),
                    ),
                  ),
                  Center(
                    child: CmoFilledButton(
                      title: LocaleKeys.save.tr(),
                      onTap: () => submit(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void submit() {
    Navigator.of(context).pop();
  }
}

class _AsiMapScreen extends StatefulWidget {
  static Future push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => _AsiMapScreen()));
  }

  @override
  State<_AsiMapScreen> createState() => _AsiMapScreenState();
}

class _AsiMapScreenState extends State<_AsiMapScreen> {
  final ImagePickerService _imagePickerService = ImagePickerService();
  final _asiMapResult = _AsiMapResult()
    ..latitude = Constants.mapCenter.latitude
    ..longitude = Constants.mapCenter.longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.asi.tr(),
        showLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: CmoMap(
              onMapMoved: (latitude, longitude) {
                _asiMapResult.latitude = latitude;
                _asiMapResult.longitude = longitude;
              },
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                child: CmoFilledButton(
                  title: LocaleKeys.selectPhoto.tr(),
                  onTap: () async {
                    _asiMapResult.imageUri =
                        (await _imagePickerService.pickImageFromGallery())
                            ?.path;
                  },
                ),
              ),
              Align(
                child: CmoFilledButton(
                  title: LocaleKeys.takePhoto.tr(),
                  onTap: () async {
                    _asiMapResult.imageUri =
                        (await _imagePickerService.pickImageFromCamera())?.path;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: CmoFilledButton(
              title: LocaleKeys.save.tr(),
              onTap: () => save(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void save() {
    Navigator.of(context).pop(_asiMapResult);
  }
}

class _AsiMapResult {
  double? latitude;
  double? longitude;
  String? imageUri;
}
