import 'package:cmo/enum/enum.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/compartments/widgets/compartment_item_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/widgets/member_search_view_mode.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompartmentListViewMode extends StatelessWidget {
  const CompartmentListViewMode({
    super.key,
    required this.navigateToDetail,
  });

  final void Function(Compartment) navigateToDetail;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompartmentCubit, CompartmentState>(
      builder: (context, state) {
        final cubit = context.read<CompartmentCubit>();
        return Column(
          children: [
            if (state.currentUserRole == UserRoleEnum.farmerMember)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: MemberSearchViewMode(
                  viewMode: state.viewMode,
                  onChangeViewMode: cubit.onChangeViewMode,
                  searchWidget: CmoTextField(
                    name: LocaleKeys.search.tr(),
                    prefixIcon: Assets.icons.icSearch.svg(),
                    hintText: LocaleKeys.search.tr(),
                    onChanged: cubit.onSearchCompartment,
                  ),
                ),
              ),
            CmoCard(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              trailing: Assets.icons.icDown.svgWhite,
              content: [
                CmoCardHeader(title: LocaleKeys.summary.tr()),
                CmoCardItem(
                  title: LocaleKeys.total.tr(),
                  value: '${state.totalSize.toStringAsFixed(2)} ha',
                  ratioTitleSpace: 3,
                ),
                CmoCardItem(
                  title: LocaleKeys.compartments.tr(),
                  value: state.listCompartment.length.toString(),
                  ratioTitleSpace: 3,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: state.filterCompartment.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: CmoDismissibleItem(
                      key: Key(state.filterCompartment[index].localCompartmentId.toString()),
                      title: LocaleKeys.remove_compartment.tr(),
                      subtitle: LocaleKeys.remove_compartment_alert_content.tr(),
                      onRemove: () => cubit.onRemoveCompartment(state.filterCompartment[index]),
                      child: CompartmentItemWidget(
                        model: state.filterCompartment[index],
                        onTap: () => navigateToDetail(state.filterCompartment[index]),
                        isConservationArea: context
                            .read<CompartmentCubit>()
                            .isConservationArea(state.filterCompartment[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (state.listCompartment.isNotEmpty) ...[
              const SizedBox(height: 16),
              CmoFilledButton(
                title: LocaleKeys.done.tr(),
                onTap: Navigator.of(context).pop,
              ),
              const SizedBox(height: 16),
            ],
          ],
        );
      },
    );
  }
}
