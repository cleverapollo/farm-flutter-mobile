import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class ASIMapScreen extends StatelessWidget {
  const ASIMapScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ASIMapScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CmoAppBarV2(
        title: 'Add ASI',
        subtitle: 'Site Name',
        showTrailing: true,
      ),
      body: SizedBox.expand(
        child: ColoredBox(
          color: context.colors.white,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: size.height * 0.5,
                width: double.infinity,
                child: const Text('Map'),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
                child: CmoDropDownLayoutWidget(
                  title: 'Lat | Long',
                  subTitle: '-26.12345 | 23.12354',
                  trailingWidget: Icon(
                    Icons.location_on,
                    color: Colors.green,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    child: CmoFilledButton(
                        title: 'Select Photo',
                        onTap: () {
                          ASIMapScreen.push(context);
                        }),
                  ),
                  Align(
                    child: CmoFilledButton(
                        title: 'Take Photo',
                        onTap: () {
                          ASIMapScreen.push(context);
                        }),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Align(
                child: CmoFilledButton(
                    title: 'Next',
                    onTap: () {
                      ASIDetailScreen.push(context);
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
