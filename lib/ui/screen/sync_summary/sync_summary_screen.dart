import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/service/cmo_database_company_service.dart';
import 'package:cmo/state/entity_cubit/entity_cubit.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:cmo/utils/json_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

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
              future: databaseService.db,
              builder: (BuildContext context, AsyncSnapshot<Isar> snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Open db error: ${snapshot.error} - ${snapshot.stackTrace}',
                  );
                }
                if (!snapshot.hasData) return const Text('loading db...');
                // print store content

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
                        future: databaseService.getCompliances(),
                        title: 'Company',
                      ),
                      _SummaryTite(
                        future: databaseService.getPlantations(),
                        title: 'Plantations',
                      ),
                      _SummaryTite(
                        future: databaseService.getUnits(),
                        title: 'Units',
                      ),
                      _SummaryTite(
                        future: databaseService.getContractors(),
                        title: 'Contractors',
                      ),
                      _SummaryTite(
                        future: databaseService.getProvinces(),
                        title: 'Provinces',
                      ),
                      _SummaryTite(
                        future: databaseService.getMunicipalitys(),
                        title: 'Municipalitys',
                      ),
                      _SummaryTite(
                        future: databaseService.getImpactCauseds(),
                        title: 'Impact causeds',
                      ),
                      _SummaryTite(
                        future: databaseService.getImpactOns(),
                        title: 'Impact ons',
                      ),
                      _SummaryTite(
                        future: databaseService.getJobCategorys(),
                        title: 'Job categorys',
                      ),
                      _SummaryTite(
                        future: databaseService.getJobDescriptions(),
                        title: 'Job descriptions',
                      ),
                      _SummaryTite(
                        future: databaseService.getJobElements(),
                        title: 'Job elements',
                      ),
                      _SummaryTite(
                        future: databaseService.getMmms(),
                        title: 'Mmms',
                      ),
                      _SummaryTite(
                        future: databaseService.getPdcas(),
                        title: 'Pdcas',
                      ),
                      _SummaryTite(
                        future: databaseService.getSeveritys(),
                        title: 'Severitys',
                      ),
                      _SummaryTite(
                        future: databaseService.getSpeqss(),
                        title: 'Speqss',
                      ),
                      _SummaryTite(
                        future: databaseService.getCompliances(),
                        title: 'Compliances',
                      ),
                      _SummaryTite(
                        future: databaseService.getTeams(),
                        title: 'Teams',
                      ),
                      _SummaryTite(
                        future: databaseService.getRejectReasons(),
                        title: 'Reject reasons',
                      ),
                      _SummaryTite(
                        future: databaseService.getTrainingProviders(),
                        title: 'Training providers',
                      ),
                      _SummaryTite(
                        future: databaseService.getCourses(),
                        title: 'Courses',
                      ),
                      _SummaryTite(
                        future: databaseService.getSchedules(),
                        title: 'Schedules',
                      ),
                      _SummaryTite(
                        future: databaseService.getScheduleActivitys(),
                        title: 'Schedule activitys',
                      ),
                      _SummaryTite(
                        future: databaseService.getWorkers(),
                        title: 'Workers',
                      ),
                      _SummaryTite(
                        future: databaseService.getCompanyQuestions(),
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
                if (kDebugMode)
                  SelectableText(
                    '$title: ${Json.tryEncode(snapshot.data?.lastOrNull?.toJson())?.toString() ?? '---'}',
                  ),
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
