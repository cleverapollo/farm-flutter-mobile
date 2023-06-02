import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
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

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AuditCubit>().initialize();
    });
  }

  Future<void> refresh() async {
    if (context.mounted) {
      await context.read<AuditListCubit>().refresh();
    }
  }

  Future<void> onSubmit() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      var value = _formKey.currentState?.value;
      final state = context.read<AuditCubit>().state;

      if (value == null) return;
      value = {...value};

      setState(() {
        loading = true;
      });
      try {
        await hideInputMethod();
        value['AuditId'] = DateTime.now().millisecondsSinceEpoch;
        value['AuditTemplateName'] = state.selectedAuditTemplateName;
        value['SiteName'] = state.selectedSiteName;
        value['CompartmentName'] = state.selectedCompartmentName;
        value['CreateDT'] = DateTime.now().toString();
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

      await refresh();
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

  InputDecoration _buildInputDecoration(String hintText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      isDense: true,
      hintText: '${LocaleKeys.select.tr()} ${hintText.toLowerCase()}',
      hintStyle: context.textStyles.bodyNormal.grey,
      border: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colors.grey)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colors.blue)),
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
        BlocSelector<AuditCubit, AuditState, List<Compartment>>(
          selector: (state) {
            return state.compartments;
          },
          builder: (builder, compartments) {
            return CmoDropdown<int?>(
              name: 'CompartmentId',
              validator: requiredValidator,
              inputDecoration:
                  _buildInputDecoration(LocaleKeys.compartment.tr()),
              itemsData: compartments
                  .map(
                    (e) => CmoDropdownItem(
                      id: e.compartmentId,
                      name: e.compartmentName ?? '',
                    ),
                  )
                  .toList()
                ..insert(
                  0,
                  CmoDropdownItem(
                    id: -1,
                    name: LocaleKeys.compartment.tr(),
                  ),
                ),
              onChanged: (int? id) {
                if (id == -1) {
                  _formKey.currentState!.fields['compartmentId']?.reset();
                }

                context.read<AuditCubit>().updateSelectedCompartmentName(id!);
              },
            );
          },
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
        BlocSelector<AuditCubit, AuditState, List<Site>>(
          selector: (state) {
            return state.sites;
          },
          builder: (builder, sites) {
            return CmoDropdown(
              name: 'SiteId',
              validator: requiredValidator,
              inputDecoration: _buildInputDecoration(LocaleKeys.site.tr()),
              itemsData: sites
                  .map(
                    (e) => CmoDropdownItem(
                      id: e.siteId,
                      name: e.siteName ?? '',
                    ),
                  )
                  .toList()
                ..insert(
                  0,
                  CmoDropdownItem(
                    id: -1,
                    name: LocaleKeys.site.tr(),
                  ),
                ),
              onChanged: (int? id) {
                if (id == -1) {
                  _formKey.currentState!.fields['siteId']?.reset();
                }

                context.read<AuditCubit>().updateSelectedSiteName(id!);
              },
            );
          },
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
        BlocSelector<AuditCubit, AuditState, List<AuditTemplate>>(
          selector: (state) {
            return state.auditTemplates;
          },
          builder: (builder, auditTemplates) {
            return CmoDropdown(
              name: 'AuditTemplateId',
              validator: requiredValidator,
              inputDecoration:
                  _buildInputDecoration(LocaleKeys.auditTemplate.tr()),
              itemsData: auditTemplates
                  .map(
                    (e) => CmoDropdownItem(
                      id: e.auditTemplateId,
                      name: e.auditTemplateName ?? '',
                    ),
                  )
                  .toList()
                ..insert(
                  0,
                  CmoDropdownItem(
                    id: -1,
                    name: LocaleKeys.auditTemplate.tr(),
                  ),
                ),
              onChanged: (int? id) {
                if (id == -1) {
                  _formKey.currentState!.fields['auditTemplateId']?.reset();
                }

                context.read<AuditCubit>().updateSelectedAuditTemplateName(id!);
              },
            );
          },
        ),
      ],
    );
  }
}
