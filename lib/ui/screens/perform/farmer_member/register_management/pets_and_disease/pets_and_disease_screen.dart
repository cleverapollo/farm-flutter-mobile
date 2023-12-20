import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/pets_and_diseases/pets_and_diseases.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_cubit.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_state.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/pets_and_disease/pets_and_disease_add_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/register_item.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/widgets/status_filter_widget.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetsAndDiseaseScreen extends BaseStatefulWidget {
  PetsAndDiseaseScreen({super.key}) : super(screenName: LocaleKeys.pets_and_disease.tr());

  static Future<void> push(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider<PetsAndDiseasesCubit>(
          create: (_) => PetsAndDiseasesCubit()..initData(),
          child: PetsAndDiseaseScreen(),
        ),
      ),
    );
  }

  @override
  State<PetsAndDiseaseScreen> createState() => _PetsAndDiseaseScreenState();
}

class _PetsAndDiseaseScreenState extends BaseStatefulWidgetState<PetsAndDiseaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CmoAppBar(
          title: LocaleKeys.pets_and_disease.tr(),
          leading: Assets.icons.icBackButton.svgBlack,
          onTapLeading: Navigator.of(context).pop,
          trailing: Assets.icons.icUpdatedAddButton.svgBlack,
          onTapTrailing: () async {
            final shouldRefresh = await PetsAndDiseaseAddScreen.push(context);

            if (shouldRefresh != null && context.mounted) {
              await context.read<PetsAndDiseasesCubit>().initData();
            }
          },
        ),
        body: BlocBuilder<PetsAndDiseasesCubit, PetsAndDiseasesState>(
          builder: (context, state) {
            final cubit = context.read<PetsAndDiseasesCubit>();

            return state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(21, 0, 21, 16),
                          child: StatusFilterWidget(
                            onSelectFilter: cubit.onFilterStatus,
                            statusFilter: state.statusFilter,
                          ),
                        ),
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 18),
                            separatorBuilder: (_, index) =>
                                const SizedBox(height: 14),
                            itemCount: state.filterPetsAndDiseaseRegisters.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () async {
                                final shouldRefresh = await PetsAndDiseaseAddScreen
                                    .push(context, data: state
                                    .filterPetsAndDiseaseRegisters[index],);

                                if (shouldRefresh != null && context.mounted) {
                                  await context.read<PetsAndDiseasesCubit>()
                                      .initData();
                                }
                              },

                              child: RegisterItem(
                                title: '${LocaleKeys.pests_diseases.tr()} : ${state.filterPetsAndDiseaseRegisters[index].pestsAndDiseasesRegisterNo}',
                                mapData: generateInformationMapData(state.filterPetsAndDiseaseRegisters[index]),
                              ),
                            ),
                        ),
                      ],
                    ),
                  );
          },
        ));
  }

  Map<String, String?> generateInformationMapData(PetsAndDiseaseRegister registerItem) {
    return {
      LocaleKeys.name_pet_disease.tr(): registerItem.pestsAndDiseaseTypeName,
      LocaleKeys.treatment_methods.tr(): registerItem.pestsAndDiseaseTreatmentMethods,
      LocaleKeys.numbers_of_outbreaks.tr(): (registerItem.numberOfOutbreaks ?? 0).toString(),
      LocaleKeys.area_lost.tr(): (registerItem.areaLost ?? 0).toString(),
      LocaleKeys.under_control.tr(): (registerItem.underControl ?? false)
          ? LocaleKeys.yes.tr()
          : LocaleKeys.no.tr(),
      LocaleKeys.general_comments.tr(): registerItem.comment,
    };
  }
}

