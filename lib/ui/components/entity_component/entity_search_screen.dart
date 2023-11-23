import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/model/entity.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/state/user_info_cubit/user_info_cubit.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntitySearchScreen extends StatefulWidget {
  const EntitySearchScreen({
    super.key,
    required this.type,
    this.selected,
  });

  final EntityType type;

  final Entity? selected;

  static dynamic push(
    BuildContext context, {
    required EntityType type,
    Entity? selected,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => EntitySearchScreen(
          type: type,
          selected: selected,
        ),
      ),
    );
  }

  @override
  State<EntitySearchScreen> createState() => _EntitySearchScreenState();
}

class _EntitySearchScreenState extends State<EntitySearchScreen> {
  late final entityCubit = context.read<EntityCubit>();

  bool isReady = false;

  List<Company> companies = [];

  String prevQuery = '';

  @override
  void initState() {
    super.initState();
    companies = entityCubit.state.companies;
    isReady = companies.isNotEmpty;
    if (!isReady) {
      // entityCubit
      //     .getCompanies(
      //   context: context,
      //   userId: context.read<UserInfoCubit>().data?.userId,
      // )
      //     .then((_) {
      //   companies = entityCubit.state.companies;
      //   isReady = true;
      //   setState(() {});
      // });
    }
  }

  void filter(String? input) {
    if (input == null) return;
    final query = input.trim().toLowerCase();
    if (query == prevQuery) return;

    companies = entityCubit.state.companies
        .where((e) => e.companyName?.toLowerCase().contains(query) ?? false)
        .toList();
    setState(() {});
    prevQuery = query;
  }

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.entity.tr(),
          leading: Assets.icons.icBackButton.svg(),
          onTapLeading: () => Navigator.of(context).pop(),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: CmoTextField(
                name: 'search_entity',
                prefixIcon: Assets.icons.icSearch.svg(),
                hintText: LocaleKeys.search.tr(),
                onChanged: filter,
              ),
            ),
            Expanded(child: buildNameList()),
          ],
        ),
      ),
    );
  }

  Widget buildNameList() {
    if (!isReady) {
      return Center(
        child: CircularProgressIndicator(
          color: context.colors.blue,
        ),
      );
    }

    if (companies.isEmpty) {
      return Text(LocaleKeys.none.tr(), style: context.textStyles.bodyNormal);
    }

    void onTapTile(Company name) {
      Navigator.of(context).pop(
        Entity(
          name: name.companyName ?? '',
          type: widget.type,
        ),
      );
    }

    bool isSelected(Company company) {
      final selected = widget.selected;
      if (selected == null) return false;
      return company.companyName == selected.name &&
          widget.type == selected.type;
    }

    return ListView(
      children: companies
          .map(
            (e) => CmoTappable(
              onTap: () => onTapTile(e),
              child: _ResultTile(
                title: e.companyName ?? e.companyId.toString(),
                selected: isSelected(e),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ResultTile extends StatelessWidget {
  const _ResultTile({
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
