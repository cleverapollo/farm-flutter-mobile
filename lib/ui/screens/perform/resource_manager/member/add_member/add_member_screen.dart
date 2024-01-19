import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/state/member_management/member_management_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/add_member_sign_contract_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/widget/member_property_ownership_section.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/widget/member_site_detail_section.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/widget/member_objectives_section.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/widget/member_risk_assessments_section.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/widget/member_detail_section.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/add_member/widget/member_slimf_section.dart';

class AddMemberScreen extends BaseStatefulWidget {
  AddMemberScreen({super.key, this.farm})
      : super(
          screenName: farm == null
              ? LocaleKeys.addMember.tr()
              : LocaleKeys.member_detail.tr(),
        );

  final Farm? farm;

  static Future<bool?> push(BuildContext context, {Farm? farm}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => MemberDetailCubit(farm),
          child: AddMemberScreen(farm: farm),
        ),
      ),
    );
  }

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends BaseStatefulWidgetState<AddMemberScreen> {
  late final MemberDetailCubit cubit;
  late final DashboardCubit dashboardCubit;

  final onScrollDownButtonValue = ValueNotifier(true);

  late final ScrollController _scrollController;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        onScrollDownButtonValue.value = !(_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent);
      });
    dashboardCubit = context.read<DashboardCubit>();
    cubit = context.read<MemberDetailCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: widget.farm == null ? LocaleKeys.addMember.tr() : LocaleKeys.member_detail.tr(),
        trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
        onTapTrailing: () {
          Navigator.pop(context, true);
        },
      ),
      body: BlocSelector<MemberDetailCubit, MemberDetailState, bool>(
        selector: (state) => state.isLoading,
        builder: (context, bool isLoading) {
          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.colors.blueDark2,
              ),
            );
          }
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const MemberSLIMFSection(),
                const MemberPropertyOwnershipSection(),
                const MemberDetailSection(),
                const MemberSiteDetailSection(),
                const MemberRiskAssessmentsSection(),
                const MemberObjectivesSection(),
                AddMemberSignContractWidget(
                  shouldScrollBottom: _handleScrollBottom,
                  farm: widget.farm,
                ),
              ].withSpaceBetween(height: 12),
            ),
          );
        },
      ),
      floatingActionButton:
          BlocSelector<MemberDetailCubit, MemberDetailState, AddMemberSAF>(
        selector: (state) {
          return state.addMemberSAF;
        },
        builder: (context, addMemberSAF) {
          return Visibility(
            visible: addMemberSAF.isExpanded,
            child: ValueListenableBuilder(
              valueListenable: onScrollDownButtonValue,
              builder: (context, data, __) {
                return _bindScrollDownButton(data);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _bindScrollDownButton(bool shouldShowDown) {
    if (shouldShowDown) {
      return CupertinoButton(
        onPressed: () {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        },
        child: Icon(
          CupertinoIcons.arrow_down_circle_fill,
          size: 40,
          color: context.colors.blueDark1,
        ),
      );
    } else {
      return CupertinoButton(
        onPressed: () {
          _scrollController.jumpTo(0);
        },
        child: Icon(
          CupertinoIcons.arrow_up_circle_fill,
          size: 40,
          color: context.colors.blueDark1,
        ),
      );
    }
  }

  Future<void> _handleScrollBottom(bool isExpanded, bool isCompleted) async {
    cubit.onExpandedSAF(!isExpanded);
    if (isExpanded) return;

    await Future.delayed(const Duration(milliseconds: 500), () {});

    if (isCompleted) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}


