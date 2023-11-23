import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/farmer/annual_farm_production/annual_farm_production_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/add_update_annual_farm_production/add_update_annual_production_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/annual_production/widgets/annual_production_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnualProductionManagementScreen extends BaseStatefulWidget {
  AnnualProductionManagementScreen({
    super.key,
  }) : super(
          screenName: LocaleKeys.annualProduction.tr(),
        );

  @override
  State<StatefulWidget> createState() => _AnnualProductionManagementScreen();

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AnnualProductionManagementScreen(),
      ),
    );
  }
}

class _AnnualProductionManagementScreen extends BaseStatefulWidgetState<AnnualProductionManagementScreen> {
  Timer? _debounceInputTimer;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<AnnualFarmProductionCubit>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AnnualFarmProductionCubit, AnnualFarmProductionState,
        AnnualFarmProductionState>(
      selector: (state) => state,
      builder: (context, state) {
        return Scaffold(
          appBar: CmoAppBar(
            title: LocaleKeys.annualProduction.tr(),
            subtitle: state.activeFarm?.farmName ?? '',
            subtitleTextStyle: context.textStyles.bodyBold.blueDark2,
            leading: Assets.icons.icBackButton.svgBlack,
            onTapLeading: Navigator.of(context).pop,
            trailing: Assets.icons.icUpdatedAddButton.svgBlack,
            onTapTrailing: () => AddUpdateAnnualProductionScreen.push(context),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
                child: CmoTextField(
                  name: LocaleKeys.search.tr(),
                  hintText: LocaleKeys.search.tr(),
                  suffixIcon: Assets.icons.icSearch.svg(),
                  onChanged: (input) {
                    _debounceInputTimer?.cancel();
                    _debounceInputTimer = Timer(
                      const Duration(milliseconds: 200),
                      () => context
                          .read<AnnualFarmProductionCubit>()
                          .searching(input),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.filterAnnualFarmProductions.length,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => AddUpdateAnnualProductionScreen.push(
                        context,
                        selectedAnnualFarmProduction: state.filterAnnualFarmProductions[index],
                        isEditing: true,
                      ),
                      child: AnnualProductionItemWidget(
                        annualProduction: state.filterAnnualFarmProductions[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
