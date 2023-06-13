import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class ASIDetailScreen extends StatefulWidget {
  const ASIDetailScreen({super.key, this.point});

  final LatLng? point;

  static Future<void> push(BuildContext context, {required LatLng? point}) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => ASIDetailScreen(point: point)));
  }

  @override
  State<ASIDetailScreen> createState() => _ASIDetailScreenState();
}

class _ASIDetailScreenState extends State<ASIDetailScreen> {
  String currentDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.addASI.tr(),
        subtitle: LocaleKeys.siteName.tr(),
        showTrailing: true,
      ),
      body: SizedBox.expand(
        child: ColoredBox(
          color: context.colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                  child: CmoDropDownLayoutWidget(title: LocaleKeys.compartment.tr()),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                  child: CmoDropDownLayoutWidget(
                    title: LocaleKeys.type.tr(),
                    subTitle: LocaleKeys.grate_site_1.tr(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                  child: CmoDropDownLayoutWidget(
                    title: LocaleKeys.lat_long.tr(),
                    subTitle:
                        '${widget.point?.latitude.toStringAsFixed(5)} | ${widget.point?.longitude.toStringAsFixed(5)}',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                  child: CmoDropDownLayoutWidget(
                    onTap: () async {
                      final result = await DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2018, 3, 5),
                          maxTime: DateTime(2019, 6, 7),
                          onChanged: (date) {},
                          onConfirm: (date) {},
                          currentTime: DateTime.now());

                      final format = DateFormat('dd mm yyyy');

                      currentDate = format.format(result ?? DateTime.now());
                      if (mounted) setState(() {});
                    },
                    title: LocaleKeys.date.tr(),
                    subTitle: '${LocaleKeys.date.tr()} $currentDate',
                    trailingWidget: const Icon(Icons.date_range_sharp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                  child: CmoTextField(hintText: LocaleKeys.comments.tr(), maxLines: 5),
                ),
                const SizedBox(height: 300),
                Align(
                  child: CmoFilledButton(
                      title: LocaleKeys.save.tr(),
                      onTap: () {
                        AddMemberScreen.push(context);
                      }),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
