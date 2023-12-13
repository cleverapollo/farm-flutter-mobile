import 'package:cmo/di.dart';
import 'package:cmo/enum/user_role_enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/state/stake_holder_list_cubit/stake_holder_detail_cubit.dart';
import 'package:cmo/state/stake_holder_list_cubit/stake_holder_list_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/create_new_stake_holder/widgets/input_text_field_with_title.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class StakeHolderDetailScreen extends BaseStatefulWidget {
  StakeHolderDetailScreen({
    super.key,
    this.stakeHolder,
    this.isEditing = false,
  }) : super(
          screenName: isEditing
              ? LocaleKeys.local_neighbours_detail.tr()
              : LocaleKeys.add_local_neighbours_detail.tr(),
        );

  final StakeHolder? stakeHolder;
  final bool isEditing;

  static void push(
    BuildContext context, {
    StakeHolder? stakeHolder,
    bool isEditing = false,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (_) => StakeholderDetailCubit(stakeHolder: stakeHolder)
                  ..initStakeholderDetailData(stakeHolder),
                child: StakeHolderDetailScreen(
                  stakeHolder: stakeHolder,
                  isEditing: isEditing,
                ),
              ),
      ),
    );
  }

  @override
  State<StakeHolderDetailScreen> createState() =>
      _StakeHolderDetailScreenState();
}

class _StakeHolderDetailScreenState extends BaseStatefulWidgetState<StakeHolderDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool loading = false;

  StakeHolder stakeHolder = const StakeHolder();

  @override
  void initState() {
    super.initState();
  }

  Future<void> onSubmit(BuildContext context) async {
    final cubit = context.read<StakeholderDetailCubit>();
    final state = cubit.state;

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
        value['StakeholderId'] = widget.isEditing
            ? widget.stakeHolder?.stakeHolderId
            : DateTime.now().millisecondsSinceEpoch.toString();
        stakeHolder = StakeHolder.fromJson(value);

        stakeHolder = stakeHolder.copyWith(
          stakeHolderTypeId: state.stakeHolder?.stakeHolderTypeId,
          createDT: widget.isEditing ? (state.stakeHolder?.createDT ?? DateTime.now()) : DateTime.now(),
          updateDT: DateTime.now(),
        );

        await cubit.onSaveStakeholder(
          stakeHolder,
          widget.isEditing,
          onCallback: (resultId) async {
            if (resultId != null) {
              if (context.mounted) {
                showSnackSuccess(
                  msg:
                      '${widget.isEditing ? LocaleKeys.edit_stakeholder.tr() : LocaleKeys.createNewStakeholder.tr()} $resultId',
                );

                await context.read<StakeHolderListCubit>().refresh();
                await context.read<DashboardCubit>().refresh();
                Navigator.of(context).pop();
              }
            }
          },
        );
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
        appBar: _buildCmoAppBar(context),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
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
          onTap: () async => onSubmit(context),
          loading: loading,
        ),
      ),
    );
  }

  PreferredSize _buildCmoAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90),
      child: FutureBuilder(
        future: configService.getActiveUserRole(),
        builder: (context, value) {
          if (value.data == UserRoleEnum.farmerMember) {
            return PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: FutureBuilder(
                future: configService.getActiveFarm(),
                builder: (context, snapshot) {
                  return CmoAppBar(
                    title: widget.isEditing
                        ? LocaleKeys.local_neighbours_detail.tr()
                        : LocaleKeys.add_local_neighbours_detail.tr(),
                    subtitle: snapshot.data?.farmName ?? '',
                    leading: Assets.icons.icBackButton.svgBlack,
                    onTapLeading: Navigator.of(context).pop,
                  );
                },
              ),
            );
          }

          return CmoAppBar(
            title: widget.isEditing
                ? LocaleKeys.edit_stakeholder.tr()
                : LocaleKeys.add_stakeholder.tr(),
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
          );
        },
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
              firstSuffixIcon: CmoTappable(
                onTap: () async {
                  if (widget.isEditing) {
                    await CommonFunctions.sendSms(widget.stakeHolder?.cell);
                  }
                },
                child: Assets.icons.icSmsBlue.svg(),
              ),
              secondSuffixIcon: CmoTappable(
                onTap: () async {
                  if (widget.isEditing) {
                    await CommonFunctions.makePhoneCall(widget.stakeHolder?.cell);
                  }
                },
                child: Assets.icons.icCallBlue.svg(),
              ),
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
    return BlocSelector<StakeholderDetailCubit, StakeholderDetailState,
        StakeholderDetailState>(
      selector: (state) => state,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.type.tr(),
              style: context.textStyles.bodyBold.black,
            ),
            CmoDropdown<String?>(
              name: 'StakeHolderTypeId',
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
              onChanged: (data) => context
                  .read<StakeholderDetailCubit>()
                  .onSelectStakeholder(data),
              initialValue: state.stakeHolder?.stakeHolderTypeId,
              itemsData: state.listStakeholderTypes
                  ?.map((e) => CmoDropdownItem(
                      id: e.stakeHolderTypeId,
                      name: e.stakeHolderTypeName ?? ''))
                  .toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAdditionalInfo() {
    return BlocBuilder<StakeholderDetailCubit, StakeholderDetailState>(
      builder: (context, state) {
        if (state.currentUserRole == UserRoleEnum.regionalManager) {
          return const SizedBox.shrink();
        }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${state.listSocialUpliftments?.length} Social Upliftments',
                  style: context.textStyles.bodyNormal.black,
                ),
                InkWell(
                    onTap: () => showAdditionalInfoDialog(
                        context: context,
                        title: 'Add Social Upliftment',
                        type: AdditionalInfoEnum.socialUpliftment),
                    child: const Icon(Icons.add_circle_outline)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${state.listSpecialSites?.length} Special Sites',
                  style: context.textStyles.bodyNormal.black,
                ),
                InkWell(
                    onTap: () => showAdditionalInfoDialog(
                        context: context,
                        title: 'Add Special Site',
                        type: AdditionalInfoEnum.specialSite),
                    child: const Icon(Icons.add_circle_outline)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${state.listCustomaryUseRights?.length} Customary Use Rights',
                  style: context.textStyles.bodyNormal.black,
                ),
                InkWell(
                    onTap: () => showAdditionalInfoDialog(
                        context: context,
                        title: 'Add Customary Use Right',
                        type: AdditionalInfoEnum.customaryUseRight),
                    child: const Icon(Icons.add_circle_outline)),
              ],
            ),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }
}

Future<void> showAdditionalInfoDialog({
  required BuildContext context,
  required String title,
  required AdditionalInfoEnum type,
}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext _) {
      String? name = '';
      return AlertDialog(
        title: const Text('Additional Info'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                title,
                style: context.textStyles.bodyBold.black,
              ),
              TextField(
                onChanged: (p0) {
                  name = p0;
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(LocaleKeys.ok.tr().toUpperCase()),
            onPressed: () {
              context
                  .read<StakeholderDetailCubit>()
                  .onCreateAdditionalInfo(type, name ?? '');
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
