import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/state/stake_holder_list_cubit/stake_holder_list_cubit.dart';
import 'package:cmo/utils/helpers.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/screens/perform/resource_manager/create_new_stake_holder/widgets/input_text_field_with_title.dart';

class StakeHolderDetailScreen extends StatefulWidget {
  const StakeHolderDetailScreen({super.key});

  static void push(BuildContext context, {StakeHolder? stakeHolder}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const StakeHolderDetailScreen(),
      ),
    );
  }

  @override
  State<StakeHolderDetailScreen> createState() => _StakeHolderDetailScreenState();
}

class _StakeHolderDetailScreenState
    extends State<StakeHolderDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<StakeHolderListCubit>().loadListStakeHolderType();
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
        final stakeHolderId = DateTime.now().millisecondsSinceEpoch;
        value['StakeHolderId'] = stakeHolderId;
        value['IsActive'] = true;
        value['IsLocal'] = true;
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
              msg: '${LocaleKeys.createNewStakeholder.tr()} $resultId',
            );

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
          title: LocaleKeys.addStakeholders.tr(),
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
              name: 'entityName',
              title: LocaleKeys.entityName.tr(),
              validator: requiredValidator,
            ),
            InputTextFieldWithTitle(
              name: 'contactName',
              title: LocaleKeys.contactName.tr(),
              validator: requiredValidator,
            ),
            InputTextFieldWithTitle(
              name: 'email',
              title: LocaleKeys.email.tr(),
              firstSuffixIcon: Assets.icons.icMail.svgBlue,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.email(),
              ]),
            ),
            InputTextFieldWithTitle(
              name: 'address',
              title: LocaleKeys.address.tr(),
              validator: requiredValidator,
            ),
            InputTextFieldWithTitle(
              name: 'phoneNumber',
              title: LocaleKeys.phoneNumber.tr(),
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
    return BlocSelector<StakeHolderListCubit, StakeHolderListState, List<StakeHolderType>>(
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
              name: 'type',
              validator: requiredValidator,
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                isDense: true,
                hintText: '${LocaleKeys.select.tr()} ${LocaleKeys.type.tr().toLowerCase()}',
                hintStyle: context.textStyles.bodyNormal.grey,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.colors.blue),
                ),
              ),
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
}
