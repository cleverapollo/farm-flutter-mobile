import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FarmerSyncSummaryScreen extends StatelessWidget {
  const FarmerSyncSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CmoAppBarV2(
          title: 'Sync Summary',
          showLeading: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: []),
        ));
  }
}
