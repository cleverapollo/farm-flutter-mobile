import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
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
  final List<TrainingRegister> items = [];
  bool isLoading = true;

  late List<TrainingRegister> filteredItems;
  late StatusFilterEnum statusFilter;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final farm = await configService.getActiveFarm();
    items.addAll(
        await cmoDatabaseMasterService.getTrainingByFarmId(farm!.farmId));
    isLoading = false;

    filteredItems = items;
    statusFilter = StatusFilterEnum.open;
    applyFilter();
  }

  void applyFilter() {
    switch (statusFilter) {
      case StatusFilterEnum.open:
        filteredItems =
            items.where((element) => element.signatureDate == null).toList();
        break;
      case StatusFilterEnum.closed:
        filteredItems =
            items.where((element) => element.signatureDate != null).toList();
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.training.tr(),
        showLeading: true,
        showAdding: true,
        onTapAdding: () {
          TrainingAddScreen.push(context);
        },
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  StatusFilterWidget(
                    onSelectFilter: (statusFilterEnum) {
                      statusFilter = statusFilterEnum;
                      applyFilter();
                    },
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 18),
                    separatorBuilder: (_, index) => const SizedBox(height: 14),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return GestureDetector(
                          onTap: () async {
                            final result = await TrainingAddScreen.push(context,
                                training: item);
                            if (result == null) return;
                            filteredItems[index] = result;
                            setState(() {});
                          },
                          child: _TrainingItemWidget(data: item));
                    },
                  )
                ],
              ),
            ),
    );
  }
}

class _TrainingItemWidget extends StatelessWidget {
  const _TrainingItemWidget({super.key, required this.data});

  static const double _itemHorizontalPadding = 4;

  final TrainingRegister data;

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
              '${LocaleKeys.training_no.tr()}: ${data.trainingRegisterNo}',
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
          _buildILineItem(context, '${LocaleKeys.training_type.tr()} : ',
              data.trainingTypeName),
          _buildILineItem(
              context, '${LocaleKeys.date.tr()} : ', data.date.yMd()),
          _buildILineItem(context, '${LocaleKeys.expiry_date.tr()} : ',
              data.expiryDate.yMd()),
          _buildILineItem(
              context, '${LocaleKeys.trainer_name.tr()} : ', data.trainerName),
          _buildILineItem(
              context, '${LocaleKeys.trainee_name.tr()} : ', data.workerName),
          _buildILineItem(context, '${LocaleKeys.signed.tr()} : ',
              data.signatureDate.yMd()),
          _buildILineItem(
              context, '${LocaleKeys.generalComments.tr()} : ', data.comment),
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
