import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/pets_and_diseases/pets_and_diseases.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_cubit.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_state.dart';

import 'package:cmo/ui/screens/perform/farmer_member/register_management/pets_and_disease/pets_and_disease_add_screen.dart';
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
                            itemBuilder: (context, index) =>
                                _PetsAndDiseaseItemWidget(
                                    data:
                                        state.filterPetsAndDiseaseRegisters[index])),
                      ],
                    ),
                  );
          },
        ));
  }
}

class _PetsAndDiseaseItemWidget extends StatelessWidget {
  const _PetsAndDiseaseItemWidget({required this.data});

  static const double _itemHorizontalPadding = 4;

  final PetsAndDiseaseRegister data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final shouldRefresh =
            await PetsAndDiseaseAddScreen.push(context, data: data);

        if (shouldRefresh != null && context.mounted) {
          await context.read<PetsAndDiseasesCubit>().initData();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          border: Border.all(color: context.colors.greyD9D9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: _itemHorizontalPadding,
              ),
              child: Text(
                '${LocaleKeys.p_d_no.tr()} : ${data.pestsAndDiseasesRegisterNo}',
                style: context.textStyles.bodyBold
                    .copyWith(color: context.colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: _itemHorizontalPadding * 2,
                vertical: 6,
              ),
              child: Container(
                height: 1,
                color: context.colors.black,
              ),
            ),
            _buildILineItem(context, '${LocaleKeys.name_pet_disease.tr()} : ',
                data.pestsAndDiseaseTypeName),
            _buildILineItem(context, '${LocaleKeys.treatment_methods.tr()} : ',
                data.pestsAndDiseaseTreatmentMethods),
            _buildILineItem(
                context,
                '${LocaleKeys.numbers_of_outbreaks.tr()} : ',
                (data.numberOfOutbreaks ?? 0).toString()),
            _buildILineItem(context, '${LocaleKeys.area_lost.tr()}: ',
                (data.areaLost ?? 0).toString()),
            _buildILineItem(context, '${LocaleKeys.under_control.tr()} : ',
                (data.underControl ?? false).toString()),
            _buildILineItem(
                context, '${LocaleKeys.generalComments.tr()} : ', data.comment),
          ],
        ),
      ),
    );
  }

  Padding _buildILineItem(BuildContext context, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(_itemHorizontalPadding, 8, 11, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: context.textStyles.bodyNormal,
            ),
          ),
          Expanded(
            child: Text(
              value ?? '',
              style: context.textStyles.bodyNormal,
            ),
          )
        ],
      ),
    );
  }
}
