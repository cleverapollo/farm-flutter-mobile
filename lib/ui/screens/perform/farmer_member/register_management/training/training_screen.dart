import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/training_cubit/training_cubit.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/training/training_add_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingScreen extends BaseStatefulWidget {
  TrainingScreen({super.key}) : super(screenName: LocaleKeys.training.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => TrainingCubit(),
            child: TrainingScreen(),
          );
        },
      ),
    );
  }

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  late final TrainingCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<TrainingCubit>();
  }

  Future<void> onNavigateToAddTraining() async {
    final farm = await configService.getActiveFarm();
    if (farm != null && context.mounted) {
      final result = await TrainingAddScreen.push(
        context,
        farm: farm,
      );
      if (result is TrainingRegister) {
        await cubit.onLoadData();
      }
    }
  }

  Future<void> onNavigateToEditTraining(
      int index, TrainingRegister training) async {
    final farm = await configService.getActiveFarm();
    if (farm != null && context.mounted) {
      final result = await TrainingAddScreen.push(
        context,
        farm: farm,
        training: training,
      );
      if (result is TrainingRegister) {
        await cubit.onLoadData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.training.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: onNavigateToAddTraining,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<TrainingCubit, TrainingState>(
            builder: (context, state) {
              if (state.isDataReady) {
                return _buildBody(state);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(TrainingState state) {
    final items = state.items;
    return Column(
      children: [
        CmoTappable(
          onTap: () => {},
          child: CmoCard(
            childAlignment: MainAxisAlignment.center,
            content: [
              CmoCardHeader(title: LocaleKeys.summary.tr()),
              CmoCardHeader(
                title: LocaleKeys.total.tr(),
                valueEnd: items.length.toString(),
              ),
            ],
            trailing: Assets.icons.icDown.svgWhite,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, index) => const SizedBox(height: 14),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  onNavigateToEditTraining(index, item);
                },
                child: _TrainingItemWidget(data: item),
              );
            },
          ),
        ),
      ],
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
