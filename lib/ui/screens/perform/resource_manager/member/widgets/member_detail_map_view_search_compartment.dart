import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class MemberDetailMapViewSearchCompartment extends StatefulWidget {
  const MemberDetailMapViewSearchCompartment({
    super.key,
    required this.compartments,
    required this.onSelectCompartment,
  });

  final List<Compartment> compartments;
  final void Function(Compartment) onSelectCompartment;

  @override
  State<StatefulWidget> createState() => MemberDetailMapViewSearchCompartmentState();
}

class MemberDetailMapViewSearchCompartmentState extends State<MemberDetailMapViewSearchCompartment> {
  List<Compartment> filterCompartments = <Compartment>[];
  @override
  void initState() {
    super.initState();
    filterCompartments.clear();
    filterCompartments.addAll(widget.compartments);
  }

  void onSearchCompartment(String? searchText) {
    var filteringItems = widget.compartments;
    if (searchText.isNotBlank) {
      filteringItems = filteringItems
          .where(
            (element) => (element.unitNumber ?? '').toLowerCase().contains(
                  searchText!.toLowerCase(),
                ),
          )
          .toList();
    }

    setState(() {
      filterCompartments = filteringItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: CmoTextField(
            name: LocaleKeys.search.tr(),
            hintText: LocaleKeys.search.tr(),
            prefixIcon: Assets.icons.icSearch.svg(),
            onChanged: onSearchCompartment,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filterCompartments.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => widget.onSelectCompartment(filterCompartments[index]),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                title: Text(
                  filterCompartments[index].unitNumber ?? '',
                  style: context.textStyles.bodyBold.blueDark2,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
