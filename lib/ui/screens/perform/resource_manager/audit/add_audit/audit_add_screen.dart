import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:cmo/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AuditAddScreen extends StatefulWidget {
  const AuditAddScreen({super.key});

  @override
  State<AuditAddScreen> createState() => _AuditAddScreen();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AuditAddScreen(),
      ),
    );
  }
}

class _AuditAddScreen extends State<AuditAddScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool loading = false;

  Future<void> refresh() async {
    if (context.mounted) {
      await Future.wait([
        context.read<AuditListCubit>().loadIncomplete(),
        context.read<AuditListCubit>().loadCompleted(),
        context.read<AuditListCubit>().loadSynced(),
      ]);
    }
  }

  Future<void> onSubmit() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;
      if (value == null) return;
      value = {...value};

      setState(() {
        loading = true;
      });
      try {
        await hideInputMethod();
        value['AuditId'] = DateTime.now().millisecondsSinceEpoch;
        value['IsActive'] = true;
        value['IsLocal'] = true;

        final audit = Audit.fromJson(value);

        if (context.mounted) {
          final success = await context.read<AuditCubit>().submit(audit);
          if (success && context.mounted) {
            context.read<AuditCubit>().cleanCache();
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
          title: LocaleKeys.newAudit.tr(),
          leading: Assets.icons.icArrowLeft.svgBlack,
          onTapLeading: Navigator.of(context).pop,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              _buildDividerWidget(),
              _buildInputArea(),
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

  Widget _buildDividerWidget() {
    return Divider(
      height: 2,
      thickness: 1,
      color: context.colors.grey,
    );
  }

  Widget _buildInputArea() {
    return FormBuilder(
      key: _formKey,
      onChanged: () {},
      autovalidateMode: autoValidateMode,
      child: AutofillGroup(
        child: Column(
          children: [
            _selectAuditTemplateDropdown(),
            _selectSiteDropdown(),
            _selectCompartmentDropdown(),
          ].withSpaceBetween(height: 10),
        ),
      ),
    );
  }

  Widget _selectCompartmentDropdown() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.compartment.tr(),
          style: context.textStyles.bodyBold.black,
        ),
        CmoDropdown(
          name: 'compartment',
          validator: requiredValidator,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            isDense: true,
            hintText: '${LocaleKeys.select.tr()} ${LocaleKeys.compartment.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.grey)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.blue)),
          ),
          itemsData: [
            CmoDropdownItem(id: 1, name: 'None'),
          ],
        ),
      ],
    );
  }

  Widget _selectSiteDropdown() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.site.tr(),
          style: context.textStyles.bodyBold.black,
        ),
        CmoDropdown(
          name: 'site',
          validator: requiredValidator,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            isDense: true,
            hintText: '${LocaleKeys.select.tr()} ${LocaleKeys.site.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.grey)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.blue)),
          ),
          itemsData: [
            CmoDropdownItem(id: 1, name: 'None'),
          ],
        ),
      ],
    );
  }

  Widget _selectAuditTemplateDropdown() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.auditTemplate.tr(),
          style: context.textStyles.bodyBold.black,
        ),
        CmoDropdown(
          name: 'auditTemplate',
          validator: requiredValidator,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            isDense: true,
            hintText: '${LocaleKeys.select.tr()} ${LocaleKeys.auditTemplate.tr().toLowerCase()}',
            hintStyle: context.textStyles.bodyNormal.grey,
            border: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.grey)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.colors.blue)),
          ),
          itemsData: [
            CmoDropdownItem(id: 1, name: 'None'),
          ],
        ),
      ],
    );
  }
}
