import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';
import 'package:cmo/state/stake_holder_complaint/stake_holder_complaint_cubit.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/stake_holder_complaint/add_stake_holder_complaint/add_stake_holder_complaint_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/register_item.dart';

class StakeHolderComplaintScreen extends BaseStatefulWidget {

  StakeHolderComplaintScreen({super.key})
      : super(screenName: LocaleKeys.stakeholder_complaints.tr());

  @override
  State<StatefulWidget> createState() => _StakeHolderComplaintScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => StateHolderComplaintCubit(),
            child: StakeHolderComplaintScreen(),
          );
        },
      ),
    );
  }
}

class _StakeHolderComplaintScreenState extends BaseStatefulWidgetState<StakeHolderComplaintScreen> {
  late final StateHolderComplaintCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<StateHolderComplaintCubit>();
  }

  Future<void> onNavigateToAddGrievance() async {
    final farm = await configService.getActiveFarm();
    if (farm != null && context.mounted) {
      final result = await AddStakeHolderComplaintScreen.push(
        context,
        farm: farm,
      );
      if (result is ComplaintsAndDisputesRegister) {
        cubit.onInsertNewItem(result);
      }
    }
  }

  Future<void> onNavigateToEditGrievance(
    int index,
    ComplaintsAndDisputesRegister complaint,
  ) async {
    final farm = await configService.getActiveFarm();
    if (farm != null && context.mounted) {
      final result = await AddStakeHolderComplaintScreen.push(
        context,
        farm: farm,
        complaint: complaint,
      );
      if (result is ComplaintsAndDisputesRegister) {
        cubit.onUpdateItem(index, result);
      }
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.stakeholder_complaints.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedAddButton.svgBlack,
        onTapTrailing: onNavigateToAddGrievance,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              BlocBuilder<StateHolderComplaintCubit, StakeHolderComplaintState>(
            builder: (context, state) {
              if (state.isDataReady) {
                return _buildBody(state);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(StakeHolderComplaintState state) {
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
                onTap: () {
                  onNavigateToEditGrievance(index, item);
                },
                child: RegisterItem(
                  title: '${LocaleKeys.complaintNo.tr()}: ${item.complaintsAndDisputesRegisterNo?.toString()}',
                  mapData: generateInformationMapData(item),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Map<String, String?> generateInformationMapData(ComplaintsAndDisputesRegister registerItem) {
    return {
      LocaleKeys.complaintName.tr(): registerItem.complaintsAndDisputesRegisterName,
      LocaleKeys.issueRaised.tr(): registerItem.issueDescription,
      LocaleKeys.dateReceived.tr(): convertDateTimeToLunarString(registerItem.dateReceived),
      LocaleKeys.dateClosed.tr(): convertDateTimeToLunarString(registerItem.dateClosed),
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
  }
}
