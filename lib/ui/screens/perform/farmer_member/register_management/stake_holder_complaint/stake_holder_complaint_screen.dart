import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';
import 'package:cmo/state/stake_holder_complaint/stake_holder_complaint_cubit.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/stake_holder_complaint/add_stake_holder_complaint/add_stake_holder_complaint_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/key_value_item_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StakeHolderComplaintScreen extends StatefulWidget {
  const StakeHolderComplaintScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _StakeHolderComplaintScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => StateHolderComplaintCubit(),
            child: const StakeHolderComplaintScreen(),
          );
        },
      ),
    );
  }
}

class _StakeHolderComplaintScreenState
    extends State<StakeHolderComplaintScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.stakeholder_complaints.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => onNavigateToAddGrievance(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<StateHolderComplaintCubit,
              StakeHolderComplaintState>(
            builder: (context, state) {
              if (state.isDataReady) {
                return _buildBody(cubit.state.items);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(List<ComplaintsAndDisputesRegister> items) {
    return Column(
      children: [
        CmoTappable(
          onTap: () => {},
          child: CmoCard(
            childAlignment: MainAxisAlignment.center,
            content: [
              CmoCardHeader(title: LocaleKeys.summary.tr()),
              CmoCardHeader(
                title: LocaleKeys.total.tr(),
                valueEnd: items.length.toString(),
              ),
            ],
            trailing: Assets.icons.icDown.svgWhite,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 22,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  onNavigateToEditGrievance(index, item);
                },
                child: _StakeHolderComplaintItem(
                  complaint: items[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _StakeHolderComplaintItem extends StatelessWidget {
  const _StakeHolderComplaintItem({
    required this.complaint,
  });

  final ComplaintsAndDisputesRegister complaint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.colors.greyD9D9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${LocaleKeys.complaintNo.tr()}: ${complaint.complaintsAndDisputesRegisterNo?.toString()}',
            style: context.textStyles.bodyBold.blue,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 6,
            ),
            child: Divider(
              color: context.colors.blueDark2,
              height: 1,
            ),
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.complaintName.tr(),
            valueLabel: complaint.complaintsAndDisputesRegisterName,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.issueRaised.tr(),
            valueLabel: complaint.issueDescription,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateReceived.tr(),
            valueLabel: complaint.dateReceived?.ddMMYyyy(),
            backgroundColor: context.colors.greyLight1,
          ),
          KeyValueItemWidget(
            keyLabel: LocaleKeys.dateClosed.tr(),
            valueLabel: complaint.dateClosed?.ddMMYyyy(),
            backgroundColor: context.colors.greyLight1,
          ),
        ],
      ),
    );
  }
}
