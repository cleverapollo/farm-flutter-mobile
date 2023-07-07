import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/state/stake_holder_list_cubit/stake_holder_list_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/create_new_stake_holder/widgets/input_text_field_with_title.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/helpers.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class StakeHolderDetailScreen extends StatefulWidget {
  const StakeHolderDetailScreen({
    super.key,
    this.stakeHolder,
    this.isEditing = false,
  });

  final StakeHolder? stakeHolder;
  final bool isEditing;

  static void push(
    BuildContext context, {
    StakeHolder? stakeHolder,
    bool isEditing = false,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => StakeHolderDetailScreen(
          stakeHolder: stakeHolder,
          isEditing: isEditing,
        ),
      ),
    );
  }

  @override
  State<StakeHolderDetailScreen> createState() =>
      _StakeHolderDetailScreenState();
}

class _StakeHolderDetailScreenState extends State<StakeHolderDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context
          .read<StakeHolderListCubit>()
          .initStakeholderDetailData(widget.stakeHolder?.id);
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
        value['StakeHolderId'] = widget.isEditing
            ? widget.stakeHolder?.stakeHolderId
            : DateTime.now().millisecondsSinceEpoch;
        value['IsActive'] = 1;
        final stakeHolder = StakeHolder.fromJson(value);

        int? resultId;

        if (mounted) {
          final databaseService = cmoDatabaseMasterService;

          await (await databaseService.db).writeTxn(() async {
            resultId = await databaseService.cacheStakeHolder(stakeHolder);
          });
        }

        if (resultId != null) {
          if (context.mounted) {
            showSnackSuccess(
              msg:
                  '${widget.isEditing ? 'Edit Stakeholder' : LocaleKeys.createNewStakeholder.tr()} $resultId',
            );

            await context.read<StakeHolderListCubit>().refresh();
            await context.read<DashboardCubit>().refresh();
            Navigator.of(context).pop();
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CmoAppBar(
          title: widget.isEditing
              ? 'Edit Stakeholder'
              : LocaleKeys.addStakeholders.tr(),
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 90,
              ),
              Text(
                LocaleKeys.details.tr(),
                textAlign: TextAlign.start,
                style: context.textStyles.bodyBold.black,
              ),
              _buildDividerWidget(),
              const SizedBox(
                height: 12,
              ),
              buildInputArea(),
              _buildAdditionalInfo(),
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

  Widget buildInputArea() {
    return FormBuilder(
      key: _formKey,
      onChanged: () {},
      autovalidateMode: autoValidateMode,
      child: AutofillGroup(
        child: Column(
          children: [
            _selectTypeDropdown(),
            InputTextFieldWithTitle(
              name: 'StakeholderName',
              title: LocaleKeys.entityName.tr(),
              validator: requiredValidator,
              initialValue:
                  widget.isEditing ? widget.stakeHolder?.stakeholderName : null,
            ),
            InputTextFieldWithTitle(
              name: 'ContactName',
              title: LocaleKeys.contactName.tr(),
              validator: requiredValidator,
              initialValue:
                  widget.isEditing ? widget.stakeHolder?.contactName : null,
            ),
            InputTextFieldWithTitle(
              name: 'Email',
              title: LocaleKeys.email.tr(),
              firstSuffixIcon: Assets.icons.icMail.svgBlue,
              initialValue: widget.isEditing ? widget.stakeHolder?.email : null,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.email(),
              ]),
            ),
            InputTextFieldWithTitle(
              name: 'Address1',
              title: LocaleKeys.address.tr(),
              initialValue:
                  widget.isEditing ? widget.stakeHolder?.address1 : null,
            ),
            InputTextFieldWithTitle(
              name: 'Cell',
              title: LocaleKeys.phoneNumber.tr(),
              initialValue: widget.isEditing ? widget.stakeHolder?.cell : null,
              firstSuffixIcon: Assets.icons.icCallBlue.svg(),
              secondSuffixIcon: Assets.icons.icSmsBlue.svg(),
              keyboardType: TextInputType.number,
            ),
          ].withSpaceBetween(height: 10),
        ),
      ),
    );
  }

  Widget _buildDividerWidget() {
    return Divider(
      height: 2,
      thickness: 1,
      color: context.colors.grey,
    );
  }

  Widget _selectTypeDropdown() {
    return BlocSelector<StakeHolderListCubit, StakeHolderListState,
        List<StakeHolderType>>(
      selector: (state) {
        return state.listStakeholderTypes;
      },
      builder: (context, listStakeholderTypes) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.type.tr(),
              style: context.textStyles.bodyBold.black,
            ),
            CmoDropdown(
              name: 'StakeholderTypeId',
              validator: requiredValidator,
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                isDense: true,
                hintText:
                    '${LocaleKeys.select.tr()} ${LocaleKeys.type.tr().toLowerCase()}',
                hintStyle: context.textStyles.bodyNormal.grey,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.colors.blue),
                ),
              ),
              initialValue: listStakeholderTypes
                  .firstWhereOrNull(
                    (element) =>
                        element.stakeHolderTypeId ==
                        widget.stakeHolder?.stakeHolderTypeId,
                  )
                  ?.stakeHolderTypeId,
              itemsData: listStakeholderTypes
                  .map(
                    (e) => CmoDropdownItem(
                      id: e.stakeHolderTypeId,
                      name: e.stakeHolderTypeName ?? '',
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAdditionalInfo() {
    return BlocSelector<StakeHolderListCubit, StakeHolderListState, Farm?>(
      selector: (state) {
        return state.farm;
      },
      builder: (context, farm) {
        if (farm == null) return const SizedBox.shrink();
        final state = context.read<StakeHolderListCubit>().state;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'Additional Info',
              textAlign: TextAlign.start,
              style: context.textStyles.bodyBold.black,
            ),
            _buildDividerWidget(),
            const SizedBox(height: 12),
            Text(
              '${state.listSocialUpliftments?.length ?? 0} Social Upliftments',
              style: context.textStyles.bodyNormal.black,
            ),
            const SizedBox(height: 4),
            Text(
              '${state.listSpecialSites?.length ?? 0} Special Sites',
              style: context.textStyles.bodyNormal.black,
            ),
            const SizedBox(height: 4),
            Text(
              '${state.listCustomaryUseRights?.length ?? 0} Customary Use Rights',
              style: context.textStyles.bodyNormal.black,
            ),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }
}
