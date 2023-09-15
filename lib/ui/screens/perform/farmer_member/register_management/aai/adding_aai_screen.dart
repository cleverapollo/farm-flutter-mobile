import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_aai_cubit/add_aai_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/cmo_farm_app_bar.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/widgets/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddingAAIScreen extends StatefulWidget {
  const AddingAAIScreen({super.key});

  static Future<AccidentAndIncident?> push(BuildContext context,
      {AccidentAndIncident? aai}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AddAAICubit(
              accidentAndIncident: aai ??
                  AccidentAndIncident(
                    accidentAndIncidentRegisterNo:
                        DateTime.now().millisecondsSinceEpoch.toString(),
                    isActive: true,
                    isMasterDataSynced: false,
                  ),
              isAddNew: aai == null,
            ),
            child: const AddingAAIScreen(),
          );
        },
      ),
    );
  }

  @override
  State<AddingAAIScreen> createState() => _AddingAAIScreenState();
}

class _AddingAAIScreenState extends State<AddingAAIScreen> {
  final _commentController = TextEditingController();
  final _lostTimeInDaysController = TextEditingController();

  late final AddAAICubit cubit;

  final selectAccidentAndIncidentPropertyDamageds =
      ValueNotifier<List<AccidentAndIncidentPropertyDamaged>>([]);

  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  bool carRaised = false;
  bool carClosed = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AddAAICubit>();
    final aai = cubit.state.accidentAndIncident;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await cmoDatabaseMasterService
          .getAllAccidentAndIncidentRegisterPropertyDamagedByAccidentAndIncidentRegisterNo(
              aai.accidentAndIncidentRegisterNo ?? '');

      selectAccidentAndIncidentPropertyDamageds.value.addAll(result);
    });

    carRaised = aai.carRaisedDate != null;
    carClosed = aai.carClosedDate != null;
    _commentController.text = cubit.state.accidentAndIncident.comment ?? '';
  }

  Future<void> onSubmit(BuildContext context) async {
    final state = context.read<AddAAICubit>().state;
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });

    final notValidate = state.accidentAndIncident.workerId == null ||
        state.accidentAndIncident.jobDescriptionId == null ||
        state.accidentAndIncident.natureOfInjuryId == null;

    if (notValidate) {
      return showSnackError(msg: 'Required fields are missing');
    }

    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;
      if (value == null) return;
      value = {...value};

      setState(() {
        loading = true;
      });
      try {
        await hideInputMethod();
        final farm = await configService.getActiveFarm();
        var aai = cubit.state.accidentAndIncident;
        aai = aai.copyWith(
          farmId: farm?.farmId,
          accidentAndIncidentRegisterId: null,
          isActive: true,
          isMasterDataSynced: false,
        );

        if (carRaised && aai.carRaisedDate == null) {
          aai = aai.copyWith(
            carRaisedDate: DateTime.now().toIso8601String(),
          );
        }

        if (carClosed && aai.carClosedDate == null) {
          aai = aai.copyWith(
            carClosedDate: DateTime.now().toIso8601String(),
          );
        }

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          final futures = <Future<void>>[];

          for (final item in selectAccidentAndIncidentPropertyDamageds.value) {
            futures.add(cmoDatabaseMasterService
                .cacheAccidentAndIncidentPropertyDamagedFromFarm(item.copyWith(
              accidentAndIncidentRegisterNo: aai.accidentAndIncidentRegisterNo,
            )));
          }

          await Future.wait(futures);

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheAccidentAndIncident(
                aai.copyWith(
                    dateOfIncident: state.accidentAndIncident.dateOfIncident ??
                        DateTime.now()));
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            final isAddNew = cubit.state.isAddNew;
            showSnackSuccess(
              msg:
                  '${isAddNew ? LocaleKeys.add_aai.tr() : 'Edit AAI'} $resultId',
            );

            Navigator.of(context).pop(aai);
          }
        }
      } catch (e) {
        setState(() {
          loading = false;
        });
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final initState = cubit.state;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: BlocListener<AddAAICubit, AddAAIState>(
        listenWhen: (previous, current) {
          return previous.lostTimeInDay != current.lostTimeInDay;
        },
        listener: (context, state) {
          _lostTimeInDaysController.text = state.lostTimeInDay ?? '';
        },
        child: Scaffold(
          appBar: CmoFarmAppBar.addingRegisterWithFarmName(
            title: initState.isAddNew ? LocaleKeys.add_aai.tr() : 'Edit AAI',
          ),
          body: BlocSelector<AddAAICubit, AddAAIState, bool>(
            selector: (state) => state.isDataReady,
            builder: (context, isDataReady) {
              if (!isDataReady) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildInputArea(),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: CmoFilledButton(
            title: LocaleKeys.save.tr(),
            onTap: () => onSubmit(context),
            loading: loading,
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    final state = cubit.state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: FormBuilder(
        key: _formKey,
        onChanged: () {},
        autovalidateMode: autoValidateMode,
        child: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _selectWorker(state.accidentAndIncident.workerId.toString()),
              const SizedBox(height: 4),
              _selectJobDescription(),
              const SizedBox(height: 4),
              _selectNatureOfInjury(state.natureOfInjuries,
                  state.accidentAndIncident.natureOfInjuryId),
              const SizedBox(height: 4),
              InkWell(
                onTap: () async {
                  final result = await _SelectPropertyDamaged.push(
                    context,
                    state.propertyDamaged,
                  );

                  if (result != null) {
                    selectAccidentAndIncidentPropertyDamageds.value.addAll(
                        result as List<AccidentAndIncidentPropertyDamaged>);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: ValueListenableBuilder(
                    valueListenable: selectAccidentAndIncidentPropertyDamageds,
                    builder: (context, list, _) {
                      return Text(
                        'Select Property Damaged ${list.length}',
                        style: context.textStyles.bodyBold.black,
                      );
                    },
                  ),
                ),
              ),
              _buildSelectDateIncident(
                  state.accidentAndIncident.dateOfIncident),
              _buildSelectDateReceived(state.accidentAndIncident.dateRecieved),
              _buildSelectDateResumeWork(
                  state.accidentAndIncident.dateResumeWork),
              const SizedBox(height: 8),
              _buildLostTimeInDay(),
              AttributeItem(
                child: SelectItemWidget(
                  initValue: state.accidentAndIncident.workerDisabled ?? false,
                  title: LocaleKeys.worker_disabled.tr(),
                  onSelect: (value) {
                    cubit.onWorkDisableChanged(workerDisabled: value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      LocaleKeys.comments.tr(),
                      style: context.textStyles.bodyBold.black,
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _commentController,
                      minLines: 10,
                      maxLines: 100,
                      onChanged: cubit.onCommentChanged,
                      decoration: InputDecoration(
                        hintText: LocaleKeys.comments.tr(),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLostTimeInDay() {
    return BlocSelector<AddAAICubit, AddAAIState, String>(
      selector: (state) => state.lostTimeInDay,
      builder: (context, lostTimeInDay) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.lost_time_in_days.tr(),
                style: context.textStyles.bodyBold.black,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _lostTimeInDaysController,
                minLines: 1,
                readOnly: true,
                onChanged: cubit.onCommentChanged,
                decoration: InputDecoration(
                  hintText: LocaleKeys.lost_time_in_days.tr(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _selectWorker(String? workerId) {
    return BlocBuilder<AddAAICubit, AddAAIState>(
      buildWhen: (previous, current) =>
          previous.workerSelect != current.workerSelect ||
          previous.workers != current.workers,
      builder: (context, state) {
        final initWorker =
            state.workers.firstWhereOrNull((e) => e.workerId == workerId);
        return BottomSheetSelection(
          hintText: LocaleKeys.worker.tr(),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: initWorker?.firstName ?? state.workerSelect?.firstName,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.workers.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.workers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      await cubit.onWorkerSelected(state.workers[index]);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.workers[index].firstName ?? '',
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.blueDark2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _selectJobDescription() {
    return BlocBuilder<AddAAICubit, AddAAIState>(
      buildWhen: (previous, current) =>
          previous.jobDescriptionSelect != current.jobDescriptionSelect ||
          previous.jobDescriptions != current.jobDescriptions,
      builder: (context, state) {
        final jobId = cubit.state.accidentAndIncident.jobDescriptionId;
        final initJob = state.jobDescriptions
            .firstWhereOrNull((element) => element.jobDescriptionId == jobId);
        return BottomSheetSelection(
          hintText: LocaleKeys.jobDescription.tr(),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: initJob?.jobDescriptionName ??
              state.jobDescriptionSelect?.jobDescriptionName,
          onTap: () async {
            if (state.accidentAndIncident.workerId == null) {
              return showSnackError(
                  msg: 'Add a worker first to make a selection');
            }

            FocusScope.of(context).unfocus();
            if (state.jobDescriptions.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.jobDescriptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      cubit.onJobDescriptionSelected(
                          state.jobDescriptions[index]);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.jobDescriptions[index].jobDescriptionName ?? '',
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.blueDark2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _selectNatureOfInjury(
    List<NatureOfInjury> natureOfInjuries,
    int? initNatureOfInjuryId,
  ) {
    return BlocBuilder<AddAAICubit, AddAAIState>(
      buildWhen: (previous, current) =>
          previous.natureOfInjurySelect != current.natureOfInjurySelect ||
          previous.natureOfInjuries != current.natureOfInjuries,
      builder: (context, state) {
        final initNatureOfInjury = natureOfInjuries.firstWhereOrNull(
            (element) => element.natureOfInjuryId == initNatureOfInjuryId);

        return BottomSheetSelection(
          hintText: LocaleKeys.nature_of_injury.tr(),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: initNatureOfInjury?.natureOfInjuryName ??
              state.natureOfInjurySelect?.natureOfInjuryName,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.natureOfInjuries.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.natureOfInjuries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      cubit.onNatureOfInjurySelected(
                          state.natureOfInjuries[index]);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.natureOfInjuries[index].natureOfInjuryName ?? '',
                        style: context.textStyles.bodyBold.copyWith(
                          color: context.colors.blueDark2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSelectDateReceived(DateTime? dateReceived) {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateReceived',
        onChanged: cubit.onDateReceiveChanged,
        initialValue: dateReceived ?? DateTime.now(),
        hintText: LocaleKeys.date_reported.tr(),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          (DateTime? value) {
            if (value!.millisecondsSinceEpoch >
                DateTime.now().millisecondsSinceEpoch) {
              return 'Received date cannot be in the future';
            }
            final incidentValue =
                _formKey.currentState?.value['DateIncident'] as DateTime?;
            if (incidentValue != null &&
                value.millisecondsSinceEpoch <
                    incidentValue.millisecondsSinceEpoch) {
              return 'Reported date must be on or after incident date';
            }
            return null;
          }
        ]),
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.date_reported.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.date_reported.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget _buildSelectDateIncident(DateTime? dateIncident) {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateIncident',
        initialValue: dateIncident,
        onChanged: cubit.onDateOfIncidentChanged,
        hintText: LocaleKeys.date_of_incident.tr(),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          (DateTime? value) {
            if (value!.millisecondsSinceEpoch >
                DateTime.now().millisecondsSinceEpoch) {
              return 'Date of incident cannot be in the future';
            }
            final receivedValue =
                _formKey.currentState?.value['DateReceived'] as DateTime?;
            if (receivedValue != null &&
                value.millisecondsSinceEpoch >
                    receivedValue.millisecondsSinceEpoch) {
              return 'Reported date must be on or after incident date';
            }
            return null;
          }
        ]),
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.date_of_incident.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.date_of_incident.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget _buildSelectDateResumeWork(DateTime? dateResumeWork) {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateResumeWork',
        initialValue: dateResumeWork,
        onChanged: cubit.onDateResumeChanged,
        hintText: LocaleKeys.resumed_work_on.tr(),
        validator: (DateTime? value) {
          if (value == null) return null;
          final incidentValue =
              _formKey.currentState?.value['DateIncident'] as DateTime?;
          if (incidentValue != null &&
              value.millisecondsSinceEpoch <
                  incidentValue.millisecondsSinceEpoch) {
            return 'Resume work date must be on or after incident date';
          }
          return null;
        },
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size(38, 38)),
          suffixIcon: Center(child: Assets.icons.icCalendar.svgBlack),
          isDense: true,
          hintText: LocaleKeys.resumed_work_on.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.resumed_work_on.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }
}

class _SelectPropertyDamaged extends StatefulWidget {
  const _SelectPropertyDamaged({
    required this.propertyDamageds,
  });

  final List<PropertyDamaged> propertyDamageds;

  @override
  State<StatefulWidget> createState() => _SelectPropertyDamagedState();

  static Future<dynamic> push(
    BuildContext context,
    List<PropertyDamaged> propertyDamageds,
  ) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _SelectPropertyDamaged(
          propertyDamageds: propertyDamageds,
        ),
      ),
    );
  }
}

class _SelectPropertyDamagedState extends State<_SelectPropertyDamaged> {
  final List<PropertyDamaged> selectedItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: 'Select Property Damaged',
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: widget.propertyDamageds.length,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              itemBuilder: (context, index) =>
                  _buildItem(widget.propertyDamageds[index]),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CmoFilledButton(
        title: LocaleKeys.save.tr(),
        onTap: () {
          Navigator.of(context).pop(selectedItems
              .map((e) => AccidentAndIncidentPropertyDamaged(
                    accidentAndIncidentRegisterPropertyDamagedId: null,
                    accidentAndIncidentRegisterPropertyDamagedNo:
                        DateTime.now().millisecondsSinceEpoch.toString(),
                    propertyDamagedId: e.propertyDamagedId,
                    isActive: true,
                    isMasterdataSynced: false,
                  ))
              .toList());
        },
      ),
    );
  }

  Widget _buildItem(PropertyDamaged item) {
    final activeItem = selectedItems.firstWhere(
        (element) => element.propertyDamagedId == item.propertyDamagedId,
        orElse: () => const PropertyDamaged());

    return InkWell(
      onTap: () {
        setState(() {
          if (selectedItems.contains(item)) {
            selectedItems.remove(item);
          } else {
            selectedItems.add(item);
          }
        });
      },
      child: AttributeItem(
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.propertyDamagedName ?? '',
                style: context.textStyles.bodyNormal.black,
              ),
            ),
            if (activeItem != const PropertyDamaged())
              _buildSelectedIcon()
            else
              Assets.icons.icCheckCircle.svg(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedIcon() {
    return Stack(
      children: [
        Assets.icons.icCheckCircle.svg(),
        Positioned.fill(
          child: Align(
            child: Assets.icons.icCheck.svg(),
          ),
        ),
      ],
    );
  }
}
