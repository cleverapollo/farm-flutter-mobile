import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/stake_holder_complaint/stake_holder_complaint_cubit.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/illegal_activity/illegal_activity_detail.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/stake_holder_complaint/add_stake_holder_complaint/add_stake_holder_complaint_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/register_item.dart';

class IllegalActivityManagement extends BaseStatefulWidget {

  IllegalActivityManagement({super.key})
      : super(screenName: LocaleKeys.illegal_activities.tr());

  @override
  State<StatefulWidget> createState() => _IllegalActivityManagementState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => IllegalActivityManagementCubit(),
            child: IllegalActivityManagement(),
          );
        },
      ),
    );
  }
}

class _IllegalActivityManagementState extends BaseStatefulWidgetState<IllegalActivityManagement> {
  late IllegalActivityManagementCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<IllegalActivityManagementCubit>();
  }

  Future<void> onNavigateToDetail({
    IllegalActivityRegister? register,
  }) async {
    await IllegalActivityDetail.push(
      context,
      illegalActivityRegister: register,
    );
    await cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.illegal_activities.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedAddButton.svgBlack,
        onTapTrailing: onNavigateToDetail,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
          BlocBuilder<IllegalActivityManagementCubit, IllegalActivityManagementState>(
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 0, 21, 16),
                    child: StatusFilterWidget(
                      onSelectFilter: cubit.onFilterStatus,
                      statusFilter: state.statusFilter,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 22,
                      ),
                      itemCount: state.filterItems.length,
                      itemBuilder: (context, index) {
                        final item = state.filterItems[index];
                        return GestureDetector(
                          onTap: () => onNavigateToDetail(register: item),
                          child: RegisterItem(
                            title: '${LocaleKeys.illegal_activity_no.tr()}: ${item.illegalActivityNo?.toString()}',
                            mapData: generateInformationMapData(item),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Map<String, String?> generateInformationMapData(IllegalActivityRegister registerItem) {
    return {
      LocaleKeys.complaintName.tr(): registerItem.complaintName,
      LocaleKeys.issueRaised.tr(): registerItem.issueRaised,
      LocaleKeys.dateReceived.tr(): convertDateTimeToLunar(registerItem.dateReceived).ddMMYyyy(),
      LocaleKeys.dateClosed.tr(): convertDateTimeToLunar(registerItem.dateClosed).ddMMYyyy(),
      LocaleKeys.closureDetails.tr(): registerItem.closureDetails,
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
  }
}
