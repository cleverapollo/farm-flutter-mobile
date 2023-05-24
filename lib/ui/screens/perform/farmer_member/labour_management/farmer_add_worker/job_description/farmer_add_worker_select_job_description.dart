import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/job_description.dart';
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
  });

  final List<int>? selectedJobDesc;
  final void Function(List<int>) onSave;

  @override
  State<StatefulWidget> createState() =>
      _FarmerStakeHolderSelectJobDescriptionState();

  static Future<void> push(
    BuildContext context,
    List<int>? selectedJobDesc,
    void Function(List<int>) onSave,
  ) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FarmerStakeHolderSelectJobDescription(
          selectedJobDesc: selectedJobDesc,
          onSave: onSave,
        ),
      ),
    );
  }
}

class _FarmerStakeHolderSelectJobDescriptionState
    extends State<FarmerStakeHolderSelectJobDescription> {
  Timer? _debounceInputTimer;

  List<int> selectedItems = <int>[];

  @override
  void initState() {
    super.initState();
    selectedItems.addAll(widget.selectedJobDesc ?? <int>[]);
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
            child: BlocSelector<LabourManagementCubit, LabourManagementState, List<JobDescription>>(
              selector: (state) => state.filterJobDescriptions,
              builder: (context, filterJobDescriptions) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: filterJobDescriptions.length,
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  itemBuilder: (context, index) => _buildItem(filterJobDescriptions[index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CmoFilledButton(
        title: LocaleKeys.save.tr(),
        onTap: () {
          Navigator.of(context).pop();
          widget.onSave(selectedItems);
        },
      ),
    );
  }

  Widget _buildItem(JobDescription item) {
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedItems.contains(item.id)) {
            selectedItems.remove(item.id);
          } else {
            selectedItems.add(item.id);
          }
        });
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
            if (selectedItems.contains(item.id))
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
