import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_map_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class ASIScreen extends StatelessWidget {
  const ASIScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ASIScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CmoAppBarV2(
        title: 'ASI',
        subtitle: 'Site Name',
        showTrailing: true,
      ),
      body: SizedBox.expand(
        child: ColoredBox(
          color: context.colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CmoTappable(
                  onTap: () {},
                  child: const CmoCard(
                    content: [
                      CmoCardHeader(title: 'Summary'),
                      CmoCardItem(title: 'Total', value: '0'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CmoTappable(
                  onTap: () {},
                  child: const CmoCard(
                    content: [
                      CmoCardHeader(title: 'ASI Type'),
                      CmoCardItem(title: 'Compartment', value: ''),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Align(
                child: CmoFilledButton(
                    title: 'Done',
                    onTap: () {
                      ASIMapScreen.push(context);
                    }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
