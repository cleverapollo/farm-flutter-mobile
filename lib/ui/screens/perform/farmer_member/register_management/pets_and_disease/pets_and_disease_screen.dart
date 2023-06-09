import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/pets_and_disease/pets_and_disease_add_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class PetsAndDiseaseScreen extends StatefulWidget {
  const PetsAndDiseaseScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => const PetsAndDiseaseScreen()));
  }

  @override
  State<PetsAndDiseaseScreen> createState() => _PetsAndDiseaseScreenState();
}

class _PetsAndDiseaseScreenState extends State<PetsAndDiseaseScreen> {
  List<PetsAndDiseaseModel> sampleData = [
    PetsAndDiseaseModel(
      pestsAndDiseasesRegisterNo: '1',
      pestsAndDiseaseTypeName: '1',
      pestsAndDiseaseTreatmentMethods: '1',
      numberOfOutbreaks: '1',
      areaLost: '1',
      underControl: false,
      comment: '1',
    ),
    PetsAndDiseaseModel(
      pestsAndDiseasesRegisterNo: '1',
      pestsAndDiseaseTypeName: '1',
      pestsAndDiseaseTreatmentMethods: '1',
      numberOfOutbreaks: '1',
      areaLost: '1',
      underControl: true,
      comment: '1',
    ),
    PetsAndDiseaseModel(
      pestsAndDiseasesRegisterNo: '1',
      pestsAndDiseaseTypeName: '1',
      pestsAndDiseaseTreatmentMethods: '1',
      numberOfOutbreaks: '1',
      areaLost: '1',
      underControl: false,
      comment: '1',
    ),
    PetsAndDiseaseModel(
      pestsAndDiseasesRegisterNo: '1',
      pestsAndDiseaseTypeName: '1',
      pestsAndDiseaseTreatmentMethods: '1',
      numberOfOutbreaks: '1',
      areaLost: '1',
      underControl: true,
      comment: '1',
    ),
    PetsAndDiseaseModel(
      pestsAndDiseasesRegisterNo: '1',
      pestsAndDiseaseTypeName: '1',
      pestsAndDiseaseTreatmentMethods: '1',
      numberOfOutbreaks: '1',
      areaLost: '1',
      underControl: false,
      comment: '1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CmoAppBarV2(
          title: LocaleKeys.pets_and_disease.tr(),
          showLeading: true,
          showAdding: true,
          onTapAdding: () => PetsAndDiseaseAddScreen.push(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _StatusFilterWidget(
                    text: LocaleKeys.open.tr(),
                    isSelected: true,
                  ),
                  const SizedBox(width: 8),
                  _StatusFilterWidget(
                    text: LocaleKeys.close.tr(),
                    isSelected: false,
                  ),
                ],
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  separatorBuilder: (_, index) => const SizedBox(height: 14),
                  itemCount: sampleData.length,
                  itemBuilder: (context, index) =>
                      _PetsAndDiseaseItemWidget(data: sampleData[index])),
            ],
          ),
        ));
  }
}

class _StatusFilterWidget extends StatelessWidget {
  const _StatusFilterWidget({
    required this.text,
    this.isSelected = false,
    super.key,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? context.colors.blue : context.colors.white,
        border: isSelected ? null : Border.all(color: context.colors.black),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
      alignment: Alignment.center,
      child: Text(
        text,
        style: context.textStyles.bodyNormal.copyWith(
          fontSize: 12,
          color: isSelected ? context.colors.white : context.colors.black,
        ),
      ),
    );
  }
}

class _PetsAndDiseaseItemWidget extends StatelessWidget {
  const _PetsAndDiseaseItemWidget({super.key, required this.data});

  static const double _itemHorizontalPadding = 4;

  final PetsAndDiseaseModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.greyD9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _itemHorizontalPadding,
            ),
            child: Text(
              '${LocaleKeys.p_d_no.tr()} : ${data.pestsAndDiseasesRegisterNo}',
              style: context.textStyles.bodyBold
                  .copyWith(color: context.colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _itemHorizontalPadding * 2,
              vertical: 6,
            ),
            child: Container(
              height: 1,
              color: context.colors.black,
            ),
          ),
          _buildILineItem(
              context, '${LocaleKeys.name_pet_disease.tr()} : ', data.pestsAndDiseaseTypeName),
          _buildILineItem(context, '${LocaleKeys.treatment_methods.tr()} : ',
              data.pestsAndDiseaseTreatmentMethods),
          _buildILineItem(
              context, '${LocaleKeys.numbers_of_outbreaks.tr()} : ', data.numberOfOutbreaks),
          _buildILineItem(context, '${LocaleKeys.area_lost.tr()}: ', data.areaLost),
          _buildILineItem(context, '${LocaleKeys.under_control.tr()} : ', data.isUnderControl),
          _buildILineItem(context, '${LocaleKeys.generalComments.tr()} : ', data.comment),
        ],
      ),
    );
  }

  Padding _buildILineItem(BuildContext context, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textStyles.bodyNormal,
          ),
          Text(
            value ?? '',
            style: context.textStyles.bodyNormal,
          )
        ],
      ),
    );
  }
}

class PetsAndDiseaseModel {
  PetsAndDiseaseModel({
    this.pestsAndDiseasesRegisterNo,
    this.pestsAndDiseaseTypeName,
    this.pestsAndDiseaseTreatmentMethods,
    this.numberOfOutbreaks,
    this.areaLost,
    this.underControl = false,
    this.comment,
  });

  final String? pestsAndDiseasesRegisterNo;
  final String? pestsAndDiseaseTypeName;
  final String? pestsAndDiseaseTreatmentMethods;
  final String? numberOfOutbreaks;
  final String? areaLost;
  final bool? underControl;
  final String? comment;

  String get isUnderControl {
    return underControl! ? '${LocaleKeys.yes.tr()}' : '${LocaleKeys.no.tr()}';
  }
}
