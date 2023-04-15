import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';

class AssessmentItemSelectedScreen extends StatefulWidget {
  static Future push(
    BuildContext context, {
    required String title,
    required List<AssessmentItem> items,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AssessmentItemSelectedScreen(
          title: title,
          items: items,
        ),
      ),
    );
  }

  final String title;
  final List<AssessmentItem> items;

  const AssessmentItemSelectedScreen({
    required this.title,
    required this.items,
    super.key,
  });

  @override
  State<AssessmentItemSelectedScreen> createState() =>
      _AssessmentItemSelectedScreenState();
}

class _AssessmentItemSelectedScreenState
    extends State<AssessmentItemSelectedScreen> {
  late List<AssessmentItem> filteredItems;
  Timer? _debounceInputTimer;

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: widget.title,
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 12, right: 24),
            child: CmoTextField(
              name: 'search_item',
              prefixIcon: Assets.icons.icSearch.svg(),
              hintText: LocaleKeys.search.tr(),
              onChanged: (input) {
                _debounceInputTimer?.cancel();
                _debounceInputTimer = Timer(
                    const Duration(milliseconds: 200), () => filter(input));
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              separatorBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: context.colors.blueDark2,
                ),
              ),
              itemCount: filteredItems.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == filteredItems.length) return Container();
                return CmoTappable(
                  onTap: () => Navigator.of(context).pop(filteredItems[index]),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: Text(
                      filteredItems[index].text,
                      style: context.textStyles.bodyNormal,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void filter(String? input) {
    if (input == null || input.isEmpty) {
      filteredItems = widget.items;
    } else {
      filteredItems = widget.items
          .where((element) =>
              element.searchText?.contains(input.toUpperCase()) ?? false)
          .toList();
    }
    setState(() {});
  }
}

class AssessmentItem {
  final String text;
  String? searchText;
  final dynamic rawValue;

  AssessmentItem(this.text, this.rawValue) {
    searchText = text.toUpperCase();
  }
}
