import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/widgets/farmer_mode_stake_holder_item.dart';
import 'package:cmo/ui/screens/perform/resource_manager/stake_holder/widgets/rm_mode_stake_holder_item.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StakeHolderManagementScreen extends StatefulWidget {
  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const StakeHolderManagementScreen(),
      ),
    );
  }

  const StakeHolderManagementScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StakeHolderManagementScreenState();
}

class _StakeHolderManagementScreenState
    extends State<StakeHolderManagementScreen> {
  Timer? _debounceInputTimer;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<StakeHolderListCubit>().loadListStakeHolderForRMRole();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: _buildCustomAppBar(),
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
                    () => context.read<StakeHolderListCubit>().searching(input),
                  );
                },
              ),
            ),
            Expanded(
              child: BlocSelector<StakeHolderListCubit, StakeHolderListState,
                  StakeHolderListState>(
                selector: (state) {
                  return state;
                },
                builder: (context, state) {
                  if (state.loadingList) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.colors.white,
                      ),
                    );
                  }

                  if (state.error != null && kDebugMode) {
                    return Center(
                      child: Text(
                        '${state.error}',
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () {
                      return context
                          .read<StakeHolderListCubit>()
                          .loadListStakeHolderForRMRole();
                    },
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 22,
                      ),
                      itemCount: state.filterListStakeHolders.length,
                      padding: const EdgeInsets.symmetric(horizontal: 21),
                      itemBuilder: (context, index) {
                        return _buildItemCard(
                          model: state.filterListStakeHolders[index],
                          haveGreyBackground: index.isEven,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildCustomAppBar() {
    if (context.read<UserInfoCubit>().state.checkRegionalManagerRoleType) {
      return CmoAppBarV2(
        title: LocaleKeys.stakeholderManagement.tr(),
        subtitle: '${LocaleKeys.siteName.tr()}: Imbeza',
        showLeading: true,
      );
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.5),
                border: Border.all(color: context.colors.blueDark2),
              ),
              child: Text(
                LocaleKeys.stake_holder_lc.tr(),
                style: context.textStyles.bodyNormal.blueDark2,
              ),
            ),
            Expanded(
              child: Text(
                LocaleKeys.stakeholderManagement.tr(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: context.textStyles.bodyBold.blue,
              ),
            ),
            const SizedBox(
              width: 45,
            ),
          ],
        ),
      );
    }
  }

  Widget _buildItemCard({
    required StakeHolder model,
    required bool haveGreyBackground,
  }) {
    if (context.read<UserInfoCubit>().state.checkRegionalManagerRoleType) {
      return RmModeStakeHolderItem(
        model: model,
        onTap: () {},
      );
    } else {
      return FarmerModeStakeHolderItem(
        model: model,
        haveGreyBackground: haveGreyBackground,
        onTap: () {},
      );
    }
  }
}
