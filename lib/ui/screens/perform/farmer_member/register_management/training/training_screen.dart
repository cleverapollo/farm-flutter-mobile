import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/training_cubit/training_cubit.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/training/training_detail_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/register_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';

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
  BaseStatefulWidgetState<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends BaseStatefulWidgetState<TrainingScreen> {
  late final TrainingCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<TrainingCubit>();
  }

  Future<void> onNavigateToAddTraining() async {
    final farm = await configService.getActiveFarm();
    if (farm != null && context.mounted) {
      final result = await TrainingDetailScreen.push(
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
      final result = await TrainingDetailScreen.push(
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
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.training.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedAddButton.svgBlack,
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
    final items = state.filterItems;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(21, 0, 21, 16),
          child: StatusFilterWidget(
            onSelectFilter: cubit.onFilterStatus,
          ),
        ),
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
                child: RegisterItem(
                  title: '${LocaleKeys.training_no.tr()}: ${item.trainingRegisterNo}',
                  mapData: generateInformationMapData(item),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Map<String, String?> generateInformationMapData(TrainingRegister registerItem) {
    return {
      LocaleKeys.training_type.tr(): cubit.getTrainingTypeNameByTrainingTypeId(registerItem.trainingTypeId),
      LocaleKeys.date.tr(): convertDateTimeToLunar(registerItem.date).yMd(),
      LocaleKeys.expiry_date.tr(): convertDateTimeToLunar(registerItem.expiryDate).yMd(),
      LocaleKeys.trainer_name.tr(): registerItem.trainerName,
      LocaleKeys.trainee_name.tr(): cubit.getTotalTrainee(registerItem.trainingRegisterNo),
      LocaleKeys.signed.tr(): registerItem.signatureDate.yMd(),
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
  }
}

