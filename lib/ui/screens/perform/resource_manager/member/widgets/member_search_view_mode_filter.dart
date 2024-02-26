import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/components/bottom_sheet_selection.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberSearchViewModeFilter extends StatelessWidget {
  const MemberSearchViewModeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberManagementCubit, MemberManagementState>(
      builder: (context, state) {
        if (state.statusFilter == MemberManagementStatusFilter.incomplete) {
          return const SizedBox.shrink();
        }

        final cubit = context.read<MemberManagementCubit>();
        Widget? searchWidget;
        switch (state.viewMode) {
          case MemberManagementViewMode.mapView:
          case MemberManagementViewMode.mapDetailView:
            searchWidget = buildSelectSite();
            break;
          case MemberManagementViewMode.listView:
            searchWidget = CmoTextField(
              name: LocaleKeys.search.tr(),
              prefixIcon: Assets.icons.icSearch.svg(),
              hintText: LocaleKeys.search.tr(),
              onChanged: cubit.onSearchTextChanged,
            );
            break;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Expanded(
                child: searchWidget,
              ),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: context.read<MemberManagementCubit>().onChangeViewMode,
                child: state.viewMode == MemberManagementViewMode.listView
                    ? Assets.icons.icMapViewInactive.svg()
                    : Assets.icons.icMapViewActive.svg(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildSelectSite() {
    return BlocBuilder<MemberManagementCubit, MemberManagementState>(
      builder: (context, state) {
        return BottomSheetSelection(
          hintText: LocaleKeys.site.tr(),
          margin: EdgeInsets.zero,
          value: state.selectedFarm?.farmName,
          displayHorizontal: false,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (state.filteringFarms.isBlank) return;
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
                      initialValue: state.filteringText,
                      onChanged: context.read<MemberManagementCubit>().onSearchTextChanged,
                    ),
                  ),
                  Expanded(
                    child: BlocSelector<MemberManagementCubit, MemberManagementState, List<Farm>>(
                      selector: (state) => state.filteringFarms,
                      builder: (context, filterFarms) {
                        return ListView.builder(
                          itemCount: filterFarms.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                context
                                    .read<MemberManagementCubit>()
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
}
