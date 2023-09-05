import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/job_description.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/state/labour_management/labour_management_cubit.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmerStakeHolderSelectJobDescription extends StatefulWidget {
  const FarmerStakeHolderSelectJobDescription({
    super.key,
    this.selectedJobDesc,
    required this.onSave,
    this.workerId,
  });

  final List<WorkerJobDescription>? selectedJobDesc;
  final void Function(List<WorkerJobDescription>) onSave;
  final int? workerId;

  @override
  State<StatefulWidget> createState() =>
      _FarmerStakeHolderSelectJobDescriptionState();

  static Future<dynamic> push({
    required BuildContext context,
    List<WorkerJobDescription>? selectedJobDesc,
    required void Function(List<WorkerJobDescription>) onSave,
    int? workerId,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FarmerStakeHolderSelectJobDescription(
          selectedJobDesc: selectedJobDesc,
          onSave: onSave,
          workerId: workerId,
        ),
      ),
    );
  }
}

class _FarmerStakeHolderSelectJobDescriptionState
    extends State<FarmerStakeHolderSelectJobDescription> {
  Timer? _debounceInputTimer;

  List<JobDescription> selectedItems = <JobDescription>[];

  @override
  void initState() {
    super.initState();
    selectedItems.addAll(
      (widget.selectedJobDesc ?? [])
          .map((e) => JobDescription(
                jobDescriptionId: e.jobDescriptionId,
                jobDescriptionName: e.jobDescriptionName,
              ))
          .toList(),
    );
    Future.microtask(() async {
      await context.read<LabourManagementCubit>().loadListJobDescriptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.jobDescription.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 32, 21, 24),
            child: CmoTextField(
              name: LocaleKeys.search.tr(),
              hintText: LocaleKeys.search.tr(),
              suffixIcon: Assets.icons.icSearch.svg(),
              onChanged: (input) {
                _debounceInputTimer?.cancel();
                _debounceInputTimer = Timer(
                  const Duration(milliseconds: 200),
                  () => context
                      .read<LabourManagementCubit>()
                      .searchJobDescription(input),
                );
              },
            ),
          ),
          Expanded(
            child: BlocSelector<LabourManagementCubit, LabourManagementState,
                List<JobDescription>>(
              selector: (state) => state.filterJobDescriptions,
              builder: (context, filterJobDescriptions) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: filterJobDescriptions.length,
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  itemBuilder: (context, index) =>
                      _buildItem(filterJobDescriptions[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(JobDescription item) {
    final activeItem = selectedItems.firstWhere(
        (element) => element.jobDescriptionId == item.jobDescriptionId,
        orElse: () => const JobDescription());

    return InkWell(
      onTap: () {
        final includedItem = selectedItems.firstWhere(
            (e) => e.jobDescriptionId == item.jobDescriptionId,
            orElse: () => const JobDescription());
        final itemNotIncluded = includedItem == const JobDescription();

        if (itemNotIncluded) {
          selectedItems.add(item);
        } else {
          selectedItems
              .removeWhere((e) => e.jobDescriptionId == item.jobDescriptionId);
        }

        widget.onSave(selectedItems
            .map((e) => WorkerJobDescription(
                  workerId: widget.workerId.toString(),
                  jobDescriptionId: e.jobDescriptionId,
                  jobDescriptionName: e.jobDescriptionName,
                  createDT: DateTime.now(),
                  updateDT: DateTime.now(),
                  isActive: true,
                ))
            .toList());

        if (mounted) setState(() {});
      },
      child: AttributeItem(
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.jobDescriptionName ?? '',
                style: context.textStyles.bodyNormal.black,
              ),
            ),
            if (activeItem != const JobDescription())
              _buildSelectedIcon()
            else
              Assets.icons.icCheckCircle.svg(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedIcon() {
    return Stack(
      children: [
        Assets.icons.icCheckCircle.svg(),
        Positioned.fill(
          child: Align(
            child: Assets.icons.icCheck.svg(),
          ),
        ),
      ],
    );
  }
}
