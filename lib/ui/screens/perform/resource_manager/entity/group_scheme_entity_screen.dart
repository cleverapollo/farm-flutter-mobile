import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/entity_list.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

class GroupSchemeEntityScreen extends StatefulWidget {
  const GroupSchemeEntityScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const GroupSchemeEntityScreen(),
      ),
    );
  }

  @override
  State<GroupSchemeEntityScreen> createState() =>
      _GroupSchemeEntityScreenState();
}

class _GroupSchemeEntityScreenState extends State<GroupSchemeEntityScreen> {
  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.entity.tr(),
        ),
        body: EntityList(
          // TODO: Should fetch them from db instead of hard-coded
          entityItems: [
            EntityItem("Group scheme 1", displayString: () => "Group scheme 1"),
            EntityItem("Group scheme 2", displayString: () => "Group scheme 2"),
            EntityItem("Group scheme 3", displayString: () => "Group scheme 3"),
          ],
          onTap: (item) => Navigator.of(context).pop(item),
        ),
      ),
    );
  }
}
