import 'dart:async';

import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/audit/audit_question/audit_list_questions_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../asi/widgets/bottom_sheet_selection.dart';

class AuditAddScreen extends BaseStatefulWidget {
  AuditAddScreen({
    super.key,
    required this.auditComeFrom,
  }) : super(screenName: LocaleKeys.newAudit.tr());

  final AuditComeFromEnum auditComeFrom;

  @override
  State<AuditAddScreen> createState() => _AuditAddScreen();

  static Future<void> push(
    BuildContext context,
    AuditComeFromEnum auditComeFrom,
  ) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AuditAddScreen(
          auditComeFrom: auditComeFrom,
        ),
      ),
    );
  }
}

class _AuditAddScreen extends BaseStatefulWidgetState<AuditAddScreen> {
  bool loading = false;

  Timer? debounceInputTimer;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AuditCubit>().initialize();
    });
  }

  Future<void> onSubmit() async {
    setState(() {
      loading = true;
    });
    try {
      await hideInputMethod();
      if (context.mounted) {
        final audit = await context.read<AuditCubit>().submit();
        if (audit != null && context.mounted) {
          await context.read<AuditListCubit>().refresh();
          await context.read<DashboardCubit>().refresh();
          Navigator.of(context).pop();
          await AuditListQuestionsScreen.push(
            context,
            audit,
            widget.auditComeFrom,
          );
        }
      }
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocSelector<AuditCubit, AuditState, String>(
        selector: (state) => state.getSubTitleAudit,
        builder: (context, subTitle) {
          return Scaffold(
            appBar: CmoAppBar(
              title: LocaleKeys.newAudit.tr(),
              leading: Assets.icons.icBackButton.svgBlack,
              onTapLeading: Navigator.of(context).pop,
              subtitle: subTitle,
            ),
            body: Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        _buildDividerWidget(),
                        buildSelectAuditTemplate(),
                        buildSelectSite(),
                        // buildSelectCompartment(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).padding.bottom,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocSelector<AuditCubit, AuditState, bool>(
                        selector: (state) => state.canSave,
                        builder: (context, canSave) {
                          return CmoFilledButton(
                            disable: !canSave,
                            title: LocaleKeys.start_audit.tr(),
                            onTap: onSubmit,
                            loading: loading,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
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

  Widget buildSelectAuditTemplate() {
    return BlocBuilder<AuditCubit, AuditState>(
      builder: (context, state) {
        return BottomSheetSelection(
          hintText: LocaleKeys.auditTemplate.tr(),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: state.selectedAuditTemplate?.auditTemplateName,
          displayHorizontal: false,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.auditTemplates.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.auditTemplates.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context.read<AuditCubit>().updateSelectedAuditTemplate(
                          state.auditTemplates[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.auditTemplates[index].auditTemplateName ?? '',
                        style: context.textStyles.bodyBold.blueDark2,
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

  Widget buildSelectSite() {
    return BlocBuilder<AuditCubit, AuditState>(
      builder: (context, state) {
        return BottomSheetSelection(
          hintText: LocaleKeys.site.tr(),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: state.selectedFarm?.farmName,
          displayHorizontal: false,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.filterFarms.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CmoTextField(
                      name: LocaleKeys.search_site.tr(),
                      hintText: LocaleKeys.search_site.tr(),
                      prefixIcon: Assets.icons.icSearch.svg(),
                      onChanged: (input) {
                        debounceInputTimer?.cancel();
                        debounceInputTimer = Timer(
                          const Duration(milliseconds: 200),
                          () => context.read<AuditCubit>().searchSites(input),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocSelector<AuditCubit, AuditState, List<Farm>>(
                      selector: (state) => state.filterFarms,
                      builder: (context, filterFarms) {
                        return ListView.builder(
                          itemCount: filterFarms.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () async {
                                await context
                                    .read<AuditCubit>()
                                    .updateSelectedFarm(filterFarms[index]);
                                Navigator.pop(context);
                              },
                              contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                              title: Text(
                                filterFarms[index].farmName ?? '',
                                style: context.textStyles.bodyBold.blueDark2,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildSelectCompartment() {
    return BlocBuilder<AuditCubit, AuditState>(
      builder: (context, state) {
        if (state.selectedFarm == null) return const SizedBox.shrink();
        return BottomSheetSelection(
          hintText: LocaleKeys.compartment.tr(),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          value: state.selectedCompartment?.unitNumber,
          displayHorizontal: false,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.compartments.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.compartments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      context
                          .read<AuditCubit>()
                          .updateSelectedCompartment(state.compartments[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.compartments[index].unitNumber ?? '',
                        style: context.textStyles.bodyBold.blueDark2,
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

  @override
  void dispose() {
    debounceInputTimer?.cancel();
    super.dispose();
  }
}
