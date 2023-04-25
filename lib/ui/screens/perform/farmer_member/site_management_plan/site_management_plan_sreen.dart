import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class SiteManagementPlanScreen extends StatelessWidget {
  const SiteManagementPlanScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => const SiteManagementPlanScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CmoAppBarV2(
        title: 'Site Management Plan',
        subtitle: 'Imbeza',
        showLeading: true,
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            CmoTappable(
              onTap: () {},
              child: const CmoCard(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                content: [
                  CmoCardHeader(title: 'Compartment Management'),
                  CmoCardItem(title: 'Camp\s', value: '1'),
                  CmoCardItem(title: 'Summary: 7 tons of biomass'),
                ],
              ),
            ),
            CmoTappable(
              onTap: () {},
              child: const CmoCard(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                content: [
                  CmoCardHeader(title: 'Annual Production'),
                  CmoCardItem(title: 'Production', value: '2'),
                  CmoCardItem(title: 'forecast'),
                ],
              ),
            ),
            CmoTappable(
              onTap: () {},
              child: const CmoCard(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                content: [
                  CmoCardHeader(title: 'Annua Budget'),
                  CmoCardHeader(title: 'Budget', value: '1'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
