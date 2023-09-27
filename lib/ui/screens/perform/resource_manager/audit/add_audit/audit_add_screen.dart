import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../asi/widgets/bottom_sheet_selection.dart';

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
      await context.read<DashboardCubit>().refresh();
    }
  }

  Future<void> onSubmit() async {
    setState(() {
      loading = true;
    });
    try {
      await hideInputMethod();
      if (context.mounted) {
        final success = await context.read<AuditCubit>().submit();
        if (success && context.mounted) {
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
              leading: Assets.icons.icArrowLeft.svgBlack,
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
                        buildSelectCompartment(),
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
                            title: LocaleKeys.save.tr(),
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
                      context.read<AuditCubit>().updateSelectedAuditTemplate(state.auditTemplates[index]);
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
            if (state.farms.isBlank) return;
            await showCustomBottomSheet<void>(
              context,
              content: ListView.builder(
                itemCount: state.farms.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      await context.read<AuditCubit>().updateSelectedFarm(state.farms[index]);
                      Navigator.pop(context);
                    },
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        state.farms[index].farmName ?? '',
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
                      context.read<AuditCubit>().updateSelectedCompartment(state.compartments[index]);
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
}
