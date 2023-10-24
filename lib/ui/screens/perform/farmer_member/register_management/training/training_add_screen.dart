import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/training_cubit/add_training_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/cmo_farm_app_bar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/general_comment_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/helpers.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TrainingAddScreen extends StatefulWidget {
  const TrainingAddScreen({super.key});

  static Future<TrainingRegister?> push(
    BuildContext context, {
    required Farm farm,
    TrainingRegister? training,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AddTrainingCubit(
              farm: farm,
              training: training ??
                  TrainingRegister(
                      trainingRegisterNo:
                          DateTime.now().millisecondsSinceEpoch.toString(),
                      date: DateTime.now(),
                      isActive: true,
                      isMasterdataSynced: false,
                      createDT: DateTime.now(),
                      updateDT: DateTime.now(),
                      farmId: farm.farmId),
              isAddNew: training == null,
            ),
            child: const TrainingAddScreen(),
          );
        },
      ),
    );
  }

  @override
  State<TrainingAddScreen> createState() => _TrainingAddScreenState();
}

class _TrainingAddScreenState extends State<TrainingAddScreen> {
  late final AddTrainingCubit cubit;

  bool loading = false;
  final _formKey = GlobalKey<FormBuilderState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  Future<void> onSubmit() async {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;
      if (value == null) return;
      value = {...value};

      setState(() {
        loading = true;
      });
      try {
        await hideInputMethod();
        var training = cubit.state.training;
        training = training.copyWith(
          isActive: true,
          isMasterdataSynced: false,
          updateDT: DateTime.now(),
          createDT: training.createDT ?? DateTime.now(),
        );

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheTraining(training);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${cubit.state.isAddNew ? LocaleKeys.add_training.tr() : 'Edit Training'} $resultId',
            );
            Navigator.of(context).pop(training);
          }
        }
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddTrainingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final initState = cubit.state;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoFarmAppBar.showTrailingAndFarmName(
          title: initState.isAddNew
              ? LocaleKeys.add_training.tr()
              : 'Edit Training',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: BlocSelector<AddTrainingCubit, AddTrainingState, bool>(
            selector: (state) => state.isDataReady,
            builder: (context, isDataReady) {
              if (!isDataReady) {
                return const SizedBox.shrink();
              }
              final state = cubit.state;
              final training = state.training;
              return SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  autovalidateMode: autoValidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12.0),
                      _selectWorkerName(state.workers, training.workerId),
                      const SizedBox(height: 12.0),
                      _buildSelectDate(training.date),
                      _buildSelectExpiryDate(training.expiryDate),
                      const SizedBox(height: 12.0),
                      _selectTrainingType(
                          state.trainingTypes, training.trainingTypeId),
                      const SizedBox(height: 12.0),
                      AttributeItem(
                        child: InputAttributeItem(
                          validator: (_) => null,
                          initialValue: training.trainerName,
                          textStyle: context.textStyles.bodyNormal.blueDark2,
                          labelText: LocaleKeys.trainer_name.tr(),
                          labelTextStyle: context.textStyles.bodyBold.blueDark2,
                          onChanged: cubit.onTrainerChanged,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      AttributeItem(
                        child: SizedBox(
                          height: 97,
                          child: GeneralCommentWidget(
                            initialValue: training.comment,
                            hintText: LocaleKeys.generalComments.tr(),
                            onChanged: cubit.onCommentChanged,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CmoFilledButton(
          title: LocaleKeys.save.tr(),
          onTap: onSubmit,
          loading: loading,
        ),
      ),
    );
  }

  Widget _selectTrainingType(
      List<TrainingType> trainingTypes, int? trainingTypeId) {
    final initType = trainingTypes
        .firstWhereOrNull((e) => e.trainingTypeId == trainingTypeId);
    return AttributeItem(
      child: CmoDropdown<TrainingType>(
          name: 'TrainingType',
          hintText: LocaleKeys.training_type.tr(),
          validator: requiredValidator,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            isDense: true,
            hintText: LocaleKeys.training_type.tr(),
            hintStyle: context.textStyles.bodyBold.blueDark2,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (data) {
            cubit.onTrainingTypeChanged(data);
          },
          initialValue: initType,
          itemsData: trainingTypes
              .map(
                  (e) => CmoDropdownItem(id: e, name: e.trainingTypeName ?? ''))
              .toList()),
    );
  }

  Widget _buildSelectDate(DateTime? dateIssued) {
    return AttributeItem(
      child: CmoDatePicker(
        name: LocaleKeys.dateIssued.tr(),
        validator: requiredValidator,
        initialValue: dateIssued,
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          labelText: LocaleKeys.dateIssued.tr(),
          labelStyle: context.textStyles.bodyBold.blueDark2,
        ),
      ),
    );
  }

  Widget _buildSelectExpiryDate(DateTime? dateTime) {
    return AttributeItem(
      child: CmoDatePicker(
        name: LocaleKeys.expiry_date.tr(),
        initialValue: dateTime,
        validator: (DateTime? value) {
          if (value == null) return null;
          final dateValue = _formKey
              .currentState?.value[LocaleKeys.dateIssued.tr()] as DateTime?;
          if (dateValue != null &&
              value.millisecondsSinceEpoch < dateValue.millisecondsSinceEpoch) {
            return 'Expiry date must be after training date';
          }
          return null;
        },
        onChanged: cubit.onExpiryDateChanged,
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintStyle: context.textStyles.bodyBold.blueDark2,
          labelText: LocaleKeys.expiry_date.tr(),
          labelStyle: context.textStyles.bodyBold.blueDark2,
        ),
      ),
    );
  }

  Widget _selectWorkerName(List<FarmerWorker> workers, String? workerId) {
    final initWorker =
        workers.firstWhereOrNull((element) => element.workerId == workerId);
    return AttributeItem(
      child: CmoDropdown<FarmerWorker>(
        name: LocaleKeys.worker_name.tr(),
        validator: requiredValidator,
        inputDecoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          isDense: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: LocaleKeys.worker_name.tr(),
          hintStyle: context.textStyles.bodyBold.blueDark2,
        ),
        onChanged: cubit.onWorkerChanged,
        initialValue: initWorker,
        itemsData: workers
            .map((e) => CmoDropdownItem(id: e, name: e.firstName ?? ''))
            .toList(),
      ),
    );
  }
}
