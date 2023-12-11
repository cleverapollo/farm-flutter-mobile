import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.searching,
  });

  final void Function(String? input) searching;
  @override
  State<StatefulWidget> createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {

  Timer? _debounceInputTimer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
      child: CmoTextField(
        name: LocaleKeys.search.tr(),
        hintText: LocaleKeys.search.tr(),
        suffixIcon: Assets.icons.icSearch.svg(),
        onChanged: (input) {
          _debounceInputTimer?.cancel();
          _debounceInputTimer = Timer(
              const Duration(milliseconds: 200),
                  () => widget.searching(input),
          );
        },
      ),
    );
  }
}
