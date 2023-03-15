import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:flutter/material.dart';

class SyncSummaryScreen extends StatelessWidget {
  const SyncSummaryScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SyncSummaryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.syncSummary.tr(),
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(),
            const SizedBox(height: 24),
            const CmoHeaderTile(title: 'Master Data'),
            const SizedBox(height: 16),
            ...[
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedCompliances(),
                title: 'Company',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedPlantations(),
                title: 'Plantations',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedUnits(),
                title: 'Units',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedContractors(),
                title: 'Contractors',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedProvinces(),
                title: 'Provinces',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedMunicipalitys(),
                title: 'Municipalitys',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedImpactCauseds(),
                title: 'Impact causeds',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedImpactOns(),
                title: 'Impact ons',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedJobCategorys(),
                title: 'Job categorys',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedJobDescriptions(),
                title: 'Job descriptions',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedJobElements(),
                title: 'Job elements',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedMmms(),
                title: 'Mmms',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedPdcas(),
                title: 'Pdcas',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedSeveritys(),
                title: 'Severitys',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedSpeqss(),
                title: 'Speqss',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedCompliances(),
                title: 'Compliances',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedTeams(),
                title: 'Teams',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedRejectReasons(),
                title: 'Reject reasons',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedTrainingProviders(),
                title: 'Training providers',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedCourses(),
                title: 'Courses',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedSchedules(),
                title: 'Schedules',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedScheduleActivitys(),
                title: 'Schedule activitys',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedWorkers(),
                title: 'Workers',
              ),
              _SummaryTite(
                future: cmoDatabaseService.getAllCachedCompanyQuestions(),
                title: 'Company questions',
              ),
            ].withSpaceBetween(height: 16),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _SummaryTite extends StatelessWidget {
  const _SummaryTite({
    required this.future,
    required this.title,
  });

  final Future<List<dynamic>> future;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(),
                Text('$title: ${snapshot.data?.length ?? '---'}'),
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}  ${snapshot.stackTrace}',
          );
        }
        return const Text('loading...');
      },
    );
  }
}
