import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/service/cmo_database_company_service.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: BlocSelector<EntityCubit, EntityState, EntityState?>(
          selector: (state) {
            return state;
          },
          builder: (context, state) {
            final databaseService = state?.companyService;
            if (databaseService == null) return const SizedBox();

            return FutureBuilder(
              future: databaseService.initializeDatabase(),
              builder:
                  (BuildContext context, AsyncSnapshot<Database> snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Open db error: ${snapshot.error} - ${snapshot.stackTrace}',
                  );
                }
                if (!snapshot.hasData) return const Text('loading db...');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(),
                    const SizedBox(height: 24),
                    CmoHeaderTile(
                      title:
                          'Master Data: ${state?.company?.companyName} - Synced: ${state?.company?.isMasterDataSynced}',
                    ),
                    const SizedBox(height: 16),
                    ...[
                      _SummaryTite(
                        future: databaseService.getAllCachedCompliances(),
                        title: 'Company',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedPlantations(),
                        title: 'Plantations',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedUnits(),
                        title: 'Units',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedContractors(),
                        title: 'Contractors',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedProvinces(),
                        title: 'Provinces',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedMunicipalitys(),
                        title: 'Municipalitys',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedImpactCauseds(),
                        title: 'Impact causeds',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedImpactOns(),
                        title: 'Impact ons',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedJobCategorys(),
                        title: 'Job categorys',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedJobDescriptions(),
                        title: 'Job descriptions',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedJobElements(),
                        title: 'Job elements',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedMmms(),
                        title: 'Mmms',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedPdcas(),
                        title: 'Pdcas',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedSeveritys(),
                        title: 'Severitys',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedSpeqss(),
                        title: 'Speqss',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedCompliances(),
                        title: 'Compliances',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedTeams(),
                        title: 'Teams',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedRejectReasons(),
                        title: 'Reject reasons',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedTrainingProviders(),
                        title: 'Training providers',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedCourses(),
                        title: 'Courses',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedSchedules(),
                        title: 'Schedules',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedScheduleActivitys(),
                        title: 'Schedule activitys',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedWorkers(),
                        title: 'Workers',
                      ),
                      _SummaryTite(
                        future: databaseService.getAllCachedCompanyQuestions(),
                        title: 'Company questions',
                      ),
                    ].withSpaceBetween(height: 16),
                    const SizedBox(height: 40),
                  ],
                );
              },
            );
          },
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
