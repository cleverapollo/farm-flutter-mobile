import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';

List<CmoDropdownItem> _mockData = [
  CmoDropdownItem(id: 1, name: 'Abatteur'),
  CmoDropdownItem(id: 2, name: 'Agent Entretien Garage'),
  CmoDropdownItem(id: 3, name: 'Baboon Watcher'),
  CmoDropdownItem(id: 4, name: 'Charlie'),
  CmoDropdownItem(id: 5, name: 'Delta'),
  CmoDropdownItem(id: 6, name: 'Echo'),
  CmoDropdownItem(id: 7, name: 'Foxstrat'),
  CmoDropdownItem(id: 8, name: 'Golf'),
  CmoDropdownItem(id: 9, name: 'Hotel'),
  CmoDropdownItem(id: 10, name: 'India'),
  CmoDropdownItem(id: 11, name: 'Juliet'),
];

class FarmerStakeHolderSelectJobDescription extends StatefulWidget {
  final List<int>? selectedJobDesc;
  final void Function(List<int>) onSave;

  FarmerStakeHolderSelectJobDescription({
    this.selectedJobDesc,
    required this.onSave,
  });

  @override
  State<StatefulWidget> createState() => _FarmerStakeHolderSelectJobDescriptionState();

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

class _FarmerStakeHolderSelectJobDescriptionState extends State<FarmerStakeHolderSelectJobDescription> {
  Timer? _debounceInputTimer;
  late List<CmoDropdownItem> filteredItems;

  List<int> selectedItems = <int>[];

  @override
  void initState() {
    super.initState();
    filteredItems = _mockData;
    selectedItems.addAll(widget.selectedJobDesc ?? <int>[]);
  }

  void searching(String? input) {
    if (input == null || input.isEmpty) {
      filteredItems = _mockData;
    } else {
      filteredItems = _mockData.where((element) => element.name.toLowerCase().contains(input.toLowerCase())).toList();
    }

    setState(() {});
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
                _debounceInputTimer = Timer(const Duration(milliseconds: 200), () => searching(input));
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: filteredItems.length,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              itemBuilder: (context, index) => _buildItem(filteredItems[index]),
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

  Widget _buildItem(CmoDropdownItem item) {
    return InkWell(
      onTap: () {
        setState(() {
          print(item.id);
          if (selectedItems.contains(item.id)) {
            selectedItems.remove(item.id);
          } else {
            selectedItems.add(item.id as int);
          }
        });
      },
      child: AttributeItem(
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: context.textStyles.bodyNormal.black,
                ),
              ),
              if (selectedItems.contains(item.id)) _buildSelectedIcon() else Assets.icons.icCheckCircle.svg(),
            ],
          ),
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
