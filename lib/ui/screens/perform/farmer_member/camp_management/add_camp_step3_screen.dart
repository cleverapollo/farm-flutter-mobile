import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class AddCampStep3Screen extends StatefulWidget {
  Camp camp;

  AddCampStep3Screen(this.camp, {Key? key}) : super(key: key);

  static void push(BuildContext context, Camp camp) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AddCampStep3Screen(camp)),
    );
  }

  @override
  State<AddCampStep3Screen> createState() => _AddCampStep3ScreenState();
}

class _AddCampStep3ScreenState extends State<AddCampStep3Screen> {
  late Camp camp;

  @override
  void initState() {
    super.initState();
    camp = widget.camp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.add_camp.tr(),
        showLeading: true,
        showTrailing: true,
        trailing: Assets.icons.icClose.svgBlack,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          CmoHeaderTile(title: LocaleKeys.actuals.tr()),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      LocaleKeys.estimated_year_harvest.tr(),
                    ),
                  ),
                  _YearDropdown(
                      onChanged: (value) => camp.plannedYearOfHarvest = value),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      LocaleKeys.actual_year_of_harvest.tr(),
                    ),
                  ),
                  _YearDropdown(
                      onChanged: (value) => camp.actualYearOfHarvest = value),
                ],
              ),
            ),
          ),
          Center(
            child: CmoFilledButton(
              title: LocaleKeys.save.tr(),
              onTap: () => _save(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _save() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}

class _YearDropdown extends StatelessWidget {
  final ValueChanged<int?>? onChanged;

  const _YearDropdown({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmoDropdown<int>(
      name: 'Year',
      onChanged: onChanged,
      inputDecoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        isDense: true,
        hintText:
            '${LocaleKeys.select.tr()} ${LocaleKeys.year.tr().toLowerCase()}',
        hintStyle: context.textStyles.bodyNormal.grey,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.grey)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colors.blue)),

      ),
      itemsData: [
        CmoDropdownItem(id: DateTime.now().year - 1, name: '${DateTime.now().year - 1}'),
        CmoDropdownItem(id: DateTime.now().year, name: '${DateTime.now().year}'),
        CmoDropdownItem(id: DateTime.now().year + 1, name: '${DateTime.now().year + 1}'),
        CmoDropdownItem(id: DateTime.now().year + 2, name: '${DateTime.now().year + 2}'),
        CmoDropdownItem(id: DateTime.now().year + 3, name: '${DateTime.now().year + 3}'),
        CmoDropdownItem(id: DateTime.now().year + 4, name: '${DateTime.now().year + 4}'),
        CmoDropdownItem(id: DateTime.now().year + 5, name: '${DateTime.now().year + 5}'),
      ],
    );
  }
}