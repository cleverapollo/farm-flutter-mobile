import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';

class EntitySearchScreen extends StatelessWidget {
  const EntitySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.entity.tr(),
          leading: Assets.icons.icArrowLeft.svg(),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: CmoTextField(
                prefixIcon: Assets.icons.icSearch.svg(),
                hintText: LocaleKeys.search.tr(),
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  _ResultTile(title: 'CMO'),
                  _ResultTile(title: 'GAW Gabon', selected: true),
                  _ResultTile(title: 'Border Timbers'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultTile extends StatelessWidget {
  const _ResultTile({
    super.key,
    required this.title,
    this.selected = false,
  });

  final String title;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: Row(
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: Text(
                  title,
                  style: context.textStyles.bodyNormal,
                ),
              ),
              if (selected) Assets.icons.icTick.svg(),
              if (selected) const SizedBox(width: 24),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          indent: 24,
          endIndent: 24,
          color: context.colors.blueDark2,
        ),
      ],
    );
  }
}
