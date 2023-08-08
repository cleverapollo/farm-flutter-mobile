import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cmo/state/add_aai_cubit/add_aai_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/add_general_comment_widget.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/select_item_widget.dart';

class AddingAAIScreen extends StatefulWidget {

  const AddingAAIScreen({super.key});

  static Future<AccidentAndIncident?> push(BuildContext context,{AccidentAndIncident? aai}) {
    return Navigator.push(
      context, MaterialPageRoute(builder: (_) {
      return BlocProvider(
        create: (_) => AddAAICubit(accidentAndIncident: aai ?? AccidentAndIncident(
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
    ),);
  }

  @override
  State<AddingAAIScreen> createState() => _AddingAAIScreenState();
}

class _AddingAAIScreenState extends State<AddingAAIScreen> {
  final workers = ValueNotifier(<FarmerWorker>[]);
  final jobDescriptions = ValueNotifier(<WorkerJobDescription>[]);
  final natureOfInjurys = ValueNotifier(<NatureOfInjury>[]);
  final propertyDamaged = <PropertyDamaged>[];
  late final AddAAICubit addAAICubit;

  FarmerWorker? selectWorker;
  WorkerJobDescription? selectJobDescription;
  NatureOfInjury? selectNatureOfInjury;

  final selectAccidentAndIncidentPropertyDamageds =
      <AccidentAndIncidentPropertyDamaged>[];

  bool loading = false;

  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  bool carRaised = false;
  bool carClosed = false;

  @override
  void initState() {
    super.initState();
    addAAICubit = context.read<AddAAICubit>();
    final aai = addAAICubit.state.accidentAndIncident;
    carRaised = aai.carRaisedDate != null;
    carClosed = aai.carClosedDate != null;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final farm = await configService.getActiveFarm();
      workers.value = await cmoDatabaseMasterService
              .getFarmerWorkersByFarmId(farm?.farmId ?? '');

      natureOfInjurys.value = await cmoDatabaseMasterService
          .getNatureOfInjuryByGroupSchemeId(farm?.groupSchemeId ?? 0);

      propertyDamaged.addAll(await cmoDatabaseMasterService
          .getPropertyDamagedByGroupSchemeId(farm?.groupSchemeId ?? 0));
    });
  }

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
        final farm = await configService.getActiveFarm();
        var aai = addAAICubit.state.accidentAndIncident;
        aai = aai.copyWith(
          farmId: farm?.farmId,
          natureOfInjuryId: selectNatureOfInjury?.natureOfInjuryId,
          natureOfInjuryName: selectNatureOfInjury?.natureOfInjuryName,
          workerId: int.tryParse(selectWorker?.workerId ?? ''),
          workerName: selectWorker?.firstName,
          accidentAndIncidentRegisterId: null,
          accidentAndIncidentRegisterNo:
              DateTime.now().millisecondsSinceEpoch.toString(),
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

          for (final item in selectAccidentAndIncidentPropertyDamageds) {
            futures.add(cmoDatabaseMasterService
                .cacheAccidentAndIncidentPropertyDamagedFromFarm(item.copyWith(
                    accidentAndIncidentRegisterNo:
                        aai.accidentAndIncidentRegisterNo)));
          }

          await Future.wait(futures);

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheAccidentAndIncident(aai);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            final isAddNew = addAAICubit.state.isAddNew;
            showSnackSuccess(
              msg: '${isAddNew ? LocaleKeys.add_aai.tr() : 'Edit AAI'} $resultId',
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
    final state = addAAICubit.state;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: state.isAddNew ? LocaleKeys.add_aai.tr() : 'Edit AAI',
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icClose.svgBlack,
          onTapTrailing: Navigator.of(context).pop,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildInputArea(),
              const SizedBox(
                height: 80,
              ),
            ],
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

  Widget _buildInputArea() {
    final cubit = context.read<AddAAICubit>();
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
              _selectWorker(),
              const SizedBox(height: 4,),
              _selectJobDescription(),
              const SizedBox(height: 4,),
              _selectNatureOfInjury(),
              InkWell(
                  onTap: () async {
                    final result = await _SelectPropertyDamaged.push(
                        context, propertyDamaged);

                    if (result != null) {
                      selectAccidentAndIncidentPropertyDamageds.addAll(
                          result as List<AccidentAndIncidentPropertyDamaged>);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Select Property Damged'),
                  )),
              _buildDateOfBirth(),
              _buildSelectDateIncident(),
              _buildSelectDateReceived(),
              _buildSelectDateResumeWork(),
              const SizedBox(height: 8,),
              _buildLostTimeInDay(),
              AttributeItem(
                child: SelectItemWidget(
                  title: LocaleKeys.worker_disabled.tr(),
                  onSelect: (value) {
                    cubit.onWorkDisableChanged(workerDisabled: value);
                  },
                ),
              ),
              SizedBox(
                height: 250,
                child: GeneralCommentWidget(
                  hintText: LocaleKeys.generalComments.tr(),
                  onChanged: cubit.onCommentChanged,
                ),
              )
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
          padding:
          const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.lost_time_in_days.tr(),
                style: context.textStyles.bodyNormal,
              ),
              Text(lostTimeInDay,
                style: context.textStyles.bodyNormal,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _selectWorker() {
    return ValueListenableBuilder(
        valueListenable: workers,
        builder: (_, value, __) {
          return AttributeItem(
            child: CmoDropdown<FarmerWorker>(
                name: 'WorkerId',
                hintText: LocaleKeys.worker.tr(),
                validator: requiredValidator,
                inputDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  isDense: true,
                  hintText:
                      '${LocaleKeys.select.tr()} ${LocaleKeys.worker.tr().toLowerCase()}',
                  hintStyle: context.textStyles.bodyNormal.grey,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (value) async {
                  selectWorker = value;
                  jobDescriptions.value = await cmoDatabaseMasterService
                      .getWorkerJobDescriptionByWorkerId(selectWorker?.workerId ?? '');
                  setState(() {});
                },
                initialValue: selectWorker,
                itemsData: value
                    .map((e) => CmoDropdownItem(id: e, name: e.firstName ?? ''))
                    .toList()),
          );
        });
  }

  Widget _selectJobDescription() {
    return ValueListenableBuilder(
      valueListenable: jobDescriptions,
      builder: (context, data, __) {
        return AttributeItem(
          child: CmoDropdown<WorkerJobDescription>(
              name: '',
              hintText: LocaleKeys.jobDescription.tr(),
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                isDense: true,
                hintText:
                    '${LocaleKeys.select.tr()} ${LocaleKeys.jobDescription.tr().toLowerCase()}',
                hintStyle: context.textStyles.bodyNormal.grey,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                selectJobDescription = value;
                setState(() {});
              },
              itemsData: data
                  .map((e) =>
                      CmoDropdownItem(id: e, name: e.jobDescriptionName ?? ''))
                  .toList()),
        );
      },
    );
  }

  Widget _selectNatureOfInjury() {
    return ValueListenableBuilder(
      valueListenable: natureOfInjurys,
      builder: (context, data, __) {
        return AttributeItem(
          child: CmoDropdown<NatureOfInjury>(
              name: 'natureOfInjury',
              hintText: LocaleKeys.nature_of_injury.tr(),
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                isDense: true,
                hintText:
                    '${LocaleKeys.select.tr()} ${LocaleKeys.nature_of_injury.tr().toLowerCase()}',
                hintStyle: context.textStyles.bodyNormal.grey,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                selectNatureOfInjury = value;
                setState(() {});
              },
              itemsData: data
                  .map((e) =>
                      CmoDropdownItem(id: e, name: e.natureOfInjuryName ?? ''))
                  .toList()),
        );
      },
    );
  }

  Widget _buildSelectDateReceived() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateReceived',
        onChanged: addAAICubit.onDateReceiveChanged,
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

  Widget _buildDateOfBirth() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateOfBirth',
        onChanged: addAAICubit.onDateOfBirthChanged,
        hintText: LocaleKeys.date_of_birth.tr(),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
              (DateTime? value) {
            if (value!.millisecondsSinceEpoch >
                DateTime.now().millisecondsSinceEpoch) {
              return 'Date of birth cannot be in the future';
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
          hintText: LocaleKeys.date_of_birth.tr(),
          hintStyle: context.textStyles.bodyBold.black,
          labelText: LocaleKeys.date_of_birth.tr(),
          labelStyle: context.textStyles.bodyBold.black,
        ),
      ),
    );
  }

  Widget _buildSelectDateIncident() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateIncident',
        onChanged: addAAICubit.onDateOfIncidentChanged,
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

  Widget _buildSelectDateResumeWork() {
    return AttributeItem(
      child: CmoDatePicker(
        name: 'DateResumeWork',
        onChanged: addAAICubit.onDateResumeChanged,
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
