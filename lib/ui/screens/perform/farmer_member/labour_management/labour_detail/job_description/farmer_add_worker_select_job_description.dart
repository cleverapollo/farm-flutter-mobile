import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/job_description.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmerStakeHolderSelectJobDescription extends StatefulWidget {
  const FarmerStakeHolderSelectJobDescription({
    super.key,
    required this.listJobDescriptions,
    required this.selectedJobDesc,
    required this.onSave,
    this.workerName,
  });

  final List<JobDescription> listJobDescriptions;
  final List<JobDescription> selectedJobDesc;
  final void Function(List<JobDescription>) onSave;
  final String? workerName;

  @override
  State<StatefulWidget> createState() => _FarmerStakeHolderSelectJobDescriptionState();

  static Future<dynamic> push({
    required BuildContext context,
    required List<JobDescription> listJobDescriptions,
    required List<JobDescription> selectedJobDesc,
    required void Function(List<JobDescription>) onSave,
    String? workerName,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FarmerStakeHolderSelectJobDescription(
          listJobDescriptions: listJobDescriptions,
          selectedJobDesc: selectedJobDesc,
          onSave: onSave,
          workerName: workerName,
        ),
      ),
    );
  }
}

class _FarmerStakeHolderSelectJobDescriptionState
    extends State<FarmerStakeHolderSelectJobDescription> {
  Timer? _debounceInputTimer;

  List<JobDescription> selectedItems = <JobDescription>[];
  List<JobDescription> filterJobDescriptions = <JobDescription>[];
  List<JobDescription> listJobDescriptions = <JobDescription>[];

  @override
  void initState() {
    super.initState();
    listJobDescriptions.addAll(widget.listJobDescriptions);
    filterJobDescriptions.addAll(widget.listJobDescriptions);
    selectedItems.addAll(widget.selectedJobDesc);
  }

  void searchJobDescription(String? searchText) {
    try {
      if (searchText == null || searchText.isEmpty) {
        filterJobDescriptions = listJobDescriptions;
      } else {
        final filteredItems = listJobDescriptions
            .where(
              (element) =>
                  element.jobDescriptionName
                      ?.toLowerCase()
                      .contains(searchText.toLowerCase()) ??
                  false,
            )
            .toList();

        filterJobDescriptions = filteredItems;
      }
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.jobDescription.tr(),
        subtitle: widget.workerName,
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
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
                  () => searchJobDescription(input),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 80),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
                itemCount: filterJobDescriptions.length,
                padding: const EdgeInsets.symmetric(horizontal: 21),
                itemBuilder: (context, index) => _buildItem(filterJobDescriptions[index]),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CmoFilledButton(
        title: LocaleKeys.save.tr(),
        onTap: () {
          widget.onSave(selectedItems);
          Navigator.of(context).pop();
        },
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
