import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_employee_grievance/employee_grievance_cubit.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/employee_grievance/add_employee_grievance/add_employee_grievance_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/register_item.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeGrievanceScreen extends BaseStatefulWidget {
  EmployeeGrievanceScreen({super.key}) : super(screenName: LocaleKeys.employee_grievance.tr());

  @override
  State<StatefulWidget> createState() => _EmployeeGrievanceScreenState();

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => EmployeeGrievanceCubit(),
            child: EmployeeGrievanceScreen(),
          );
        },
      ),
    );
  }
}

class _EmployeeGrievanceScreenState extends BaseStatefulWidgetState<EmployeeGrievanceScreen> {
  late final EmployeeGrievanceCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<EmployeeGrievanceCubit>();
  }

  Future<void> onNavigateToAddGrievance() async {
    final farm = await configService.getActiveFarm();
    if (farm != null && context.mounted) {
      final result = await AddEmployeeGrievanceScreen.push(
        context,
        farm: farm,
      );
      if (result is GrievanceRegister) {
        cubit.onInsertNewItem(result);
      }
    }
  }

  Future<void> onNavigateToEditGrievance(
      int index, GrievanceRegister grievanceRegister) async {
    final farm = await configService.getActiveFarm();
    if (farm != null && context.mounted) {
      final result = await AddEmployeeGrievanceScreen.push(
        context,
        farm: farm,
        employeeGrievance: grievanceRegister,
      );
      if (result is GrievanceRegister) {
        cubit.onUpdateItem(index, result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.employee_grievance.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedAddButton.svgBlack,
        onTapTrailing: onNavigateToAddGrievance,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<EmployeeGrievanceCubit, EmployeeGrievanceState>(
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

  Widget _buildBody(EmployeeGrievanceState state) {
    final items = state.filterItems;
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
            separatorBuilder: (context, index) => const SizedBox(height: 22),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  onNavigateToEditGrievance(index, item);
                },
                child: RegisterItem(
                  title: '${LocaleKeys.grievanceNo.tr()}: ${item.grievanceRegisterNo?.toString()}',
                  mapData: generateInformationMapData(item),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Map<String, String?> generateInformationMapData(GrievanceRegister registerItem) {
    return {
      LocaleKeys.worker.tr(): cubit.getWorkerNameByWorkerId(registerItem.workerId),
      LocaleKeys.grievanceIssue.tr(): registerItem.grievanceIssueName,
      LocaleKeys.dateReceived.tr(): registerItem.dateReceived?.yMd(),
      LocaleKeys.allocatedTo.tr(): registerItem.allocatedToName,
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
  }
}

