import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:flutter/material.dart';

class EntitySearchScreen extends StatelessWidget {
  const EntitySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.entity.tr(),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
