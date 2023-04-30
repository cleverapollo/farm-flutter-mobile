import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/disciplinaries/disciplinaries_add_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class DisciplinariesScreen extends StatefulWidget {
  const DisciplinariesScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => const DisciplinariesScreen()));
  }

  @override
  State<DisciplinariesScreen> createState() => _DisciplinariesScreenState();
}

class _DisciplinariesScreenState extends State<DisciplinariesScreen> {
  List<DisciplinariesModel> sampleData = [
    DisciplinariesModel(
      disciplinayNo: '1',
      campOrCompartment: '1',
      comment: '1',
      dateRecieved: DateTime.now(),
      descriptionOfSanction: '1',
      issueTypeName: '1',
      signatureDate: '1',
      workerName: '1',
    ),
    DisciplinariesModel(
      disciplinayNo: '1',
      campOrCompartment: '1',
      comment: '1',
      dateRecieved: DateTime.now(),
      descriptionOfSanction: '1',
      issueTypeName: '1',
      signatureDate: '1',
      workerName: '1',
    ),
    DisciplinariesModel(
      disciplinayNo: '1',
      campOrCompartment: '1',
      comment: '1',
      dateRecieved: DateTime.now(),
      descriptionOfSanction: '1',
      issueTypeName: '1',
      signatureDate: '1',
      workerName: '1',
    ),
    DisciplinariesModel(
      disciplinayNo: '1',
      campOrCompartment: '1',
      comment: '1',
      dateRecieved: DateTime.now(),
      descriptionOfSanction: '1',
      issueTypeName: '1',
      signatureDate: '1',
      workerName: '1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: 'Disciplinary',
        showLeading: true,
        showAdding: true,
        onTapAdding: () => DisciplinariesAddScreen.push(context),
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
                    _DisciplinariesItemWidget(sampleData[index])),
          ],
        ),
      ),
    );
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

class _DisciplinariesItemWidget extends StatelessWidget {
  static const double _itemHorizontalPadding = 4;

  final DisciplinariesModel data;

  const _DisciplinariesItemWidget(this.data, {Key? key}) : super(key: key);

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
              'Disciplinary No : ${data.disciplinayNo}',
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
          _buildILineItem(context, 'Worker: ', data.workerName),
          _buildILineItem(
              context, 'Date Issued :', data.dateRecieved.toString()),
          _buildILineItem(
              context, 'Camp/Compartment :', data.campOrCompartment),
          _buildILineItem(
              context, 'Disciplinaries Issue :', data.issueTypeName),
          _buildILineItem(context, 'Disciplinaries Steps Taken : ',
              data.descriptionOfSanction),
          _buildILineItem(context, 'Signed : ', data.signatureDate),
          _buildILineItem(context, 'General Comments :', data.comment),
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
          Expanded(
            child: Text(
              value ?? '',
              style: context.textStyles.bodyNormal,
            ),
          )
        ],
      ),
    );
  }
}

class DisciplinariesModel {
  DisciplinariesModel({
    this.disciplinayNo,
    this.workerName,
    this.dateRecieved,
    this.campOrCompartment,
    this.issueTypeName,
    this.descriptionOfSanction,
    this.signatureDate,
    this.comment,
  });

  final String? disciplinayNo;
  final String? workerName;
  final DateTime? dateRecieved;
  final String? campOrCompartment;
  final String? issueTypeName;
  final String? descriptionOfSanction;
  final String? signatureDate;
  final String? comment;
}
