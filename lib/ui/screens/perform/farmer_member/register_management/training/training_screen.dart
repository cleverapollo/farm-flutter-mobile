import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/training/training_add_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const TrainingScreen()));
  }

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  var sampleData = <TrainingModel>[
    TrainingModel(
        trainingRegisterNo: '1',
        trainerName: '1',
        trainingTypeName: '1',
        workerName: '1',
        date: DateTime.now(),
        expiryDate: DateTime.now(),
        signatureDate: DateTime.now(),
        comment: 'Comment'),
    TrainingModel(
        trainingRegisterNo: '1',
        trainerName: '1',
        trainingTypeName: '1',
        workerName: '1',
        date: DateTime.now(),
        expiryDate: DateTime.now(),
        signatureDate: DateTime.now(),
        comment: 'Comment'),
    TrainingModel(
        trainingRegisterNo: '1',
        trainerName: '1',
        trainingTypeName: '1',
        workerName: '1',
        date: DateTime.now(),
        expiryDate: DateTime.now(),
        signatureDate: DateTime.now(),
        comment: 'Comment'),
    TrainingModel(
        trainingRegisterNo: '1',
        trainerName: '1',
        trainingTypeName: '1',
        workerName: '1',
        date: DateTime.now(),
        expiryDate: DateTime.now(),
        signatureDate: DateTime.now(),
        comment: 'Comment'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: 'Training',
        showLeading: true,
        showAdding: true,
        onTapAdding: () {
          TrainingAddScreen.push(context);
        },
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              separatorBuilder: (_, index) => const SizedBox(height: 14),
              itemCount: sampleData.length,
              itemBuilder: (context, index) =>
                  _TrainingItemWidget(data: sampleData[index]),
            )
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

class _TrainingItemWidget extends StatelessWidget {
  const _TrainingItemWidget({super.key, required this.data});

  static const double _itemHorizontalPadding = 4;

  final TrainingModel data;

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
              'Training No: ${data.trainingRegisterNo}',
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
          _buildILineItem(context, 'Training Type : ', data.trainingTypeName),
          _buildILineItem(context, 'Date : ', data.date.yMd()),
          _buildILineItem(context, 'Expiry Date : ', data.expiryDate.yMd()),
          _buildILineItem(context, 'Trainer Name : ', data.trainerName),
          _buildILineItem(context, 'Trainee Name : ', data.workerName),
          _buildILineItem(context, 'Signed : ', data.signatureDate.yMd()),
          _buildILineItem(context, 'General Comments : ', data.comment),
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

class TrainingModel {
  TrainingModel({
    this.trainingRegisterNo,
    this.trainingTypeName,
    this.date,
    this.expiryDate,
    this.trainerName,
    this.workerName,
    this.signatureDate,
    this.comment,
  });
  final String? trainingRegisterNo;
  final String? trainingTypeName;
  final DateTime? date;
  final DateTime? expiryDate;
  final String? trainerName;
  final String? workerName;
  final DateTime? signatureDate;
  final String? comment;
}
