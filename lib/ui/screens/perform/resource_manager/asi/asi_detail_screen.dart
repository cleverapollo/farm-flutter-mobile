import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';

class ASIDetailScreen extends StatelessWidget {
  const ASIDetailScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ASIDetailScreen()));
  }

  @override
  Widget build(BuildContext context) {
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
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                child: CmoDropDownLayoutWidget(title: 'Compartment'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                child: CmoDropDownLayoutWidget(title: 'Type'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                child: CmoDropDownLayoutWidget(title: 'Lat | Long'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                child: CmoDropDownLayoutWidget(
                  title: 'Date',
                  trailingWidget: Icon(Icons.date_range_sharp),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                child: CmoTextField(hintText: 'Comments', maxLines: 5),
              ),
              const Spacer(),
              Align(
                child: CmoFilledButton(title: 'Save', onTap: () {}),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
