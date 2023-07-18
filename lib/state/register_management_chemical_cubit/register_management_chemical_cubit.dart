import 'package:cmo/di.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/chemical_application_method/chemical_application_method.dart';
import 'package:cmo/model/chemical_type/chemical_type.dart';
import 'package:cmo/state/register_management_chemical_cubit/register_management_chemical_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RMChemicalCubit extends Cubit<RMChemicalState> {
  RMChemicalCubit() : super(const RMChemicalState());

  Future<bool> initConfig() async {
    try {
      final farm = await configService.getActiveFarm();

      emit(state.copyWith(
          farmId: farm?.farmId, groupSchemeId: farm?.groupSchemeId));

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> initListData() async {
    emit(state.copyWith(isLoading: true));
    final canInit = await initConfig();

    if (!canInit) return emit(state.copyWith(isLoading: false));

    final result =
        await cmoDatabaseMasterService.getChemicalByFarmId(state.farmId!);

    if (result.isNotEmpty) {
      emit(state.copyWith(chemicals: result, chemicalsSearch: result));
    }

    emit(state.copyWith(isLoading: false));
  }

  void onSearch(String text) {
    if (text.isEmpty) {
      return emit(state.copyWith(chemicalsSearch: state.chemicals));
    }

    emit(state.copyWith(
        chemicalsSearch: state.chemicals
            .where((element) => element.chemicalNo?.contains(text) ?? false)
            .toList()));
  }

  Future<void> onChangeStatus(bool isOpen) async {
    emit(state.copyWith(isLoading: true, isOpen: isOpen));

    await Future.delayed(const Duration(milliseconds: 500));

    final result = await cmoDatabaseMasterService
        .getChemicalByFarmId(state.farmId!, isOpen: isOpen);

    if (result.isNotEmpty) {
      emit(state.copyWith(chemicals: result, chemicalsSearch: result));
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> initAddData() async {
    final canInit = await initConfig();

    if (!canInit) return;

    final chemicalTypes =
        await cmoDatabaseMasterService.getChemicalTypeByFarmId(state.farmId!);
    final chemicalApplicationMethods = await cmoDatabaseMasterService
        .getChemicalApplicationMethodByGroupSchemeId(state.groupSchemeId!);
    final camps = await cmoDatabaseMasterService
        .getCampByFarmId(int.parse(state.farmId!));

    emit(state.copyWith(
      chemicalTypes: chemicalTypes,
      chemicalApplicationMethods: chemicalApplicationMethods,
      camps: camps,
    ));
  }

  void onChangeData({
    ChemicalType? chemicalType,
    ChemicalApplicationMethod? chemicalApplicationMethod,
    Camp? camp,
    DateTime? dateTime,
    double? openStock,
    double? issue,
    double? balance,
    String? mixture,
    double? usagePerHa,
    String? comment,
  }) {
    emit(state.copyWith(
        chemical: state.chemical.copyWith(
      campId: int.tryParse(camp?.campId ?? state.chemical.campId.toString()),
      campName: camp?.campName ?? state.chemical.campName,
      chemicalTypeId:
          chemicalType?.chemicalTypeId ?? state.chemical.chemicalTypeId,
      chemicalType:
          chemicalType?.chemicalTypeName ?? state.chemical.chemicalType,
      chemicalApplicationMethodId:
          chemicalApplicationMethod?.chemicalApplicationMethodId ??
              state.chemical.chemicalApplicationMethodId,
      chemicalApplicationMethod:
          chemicalApplicationMethod?.hemicalApplicationMethodName ??
              state.chemical.chemicalApplicationMethod,
      date: dateTime ?? state.chemical.date,
      openingStock: openStock ?? state.chemical.openingStock ?? 0,
      issued: issue ?? state.chemical.issued ?? 0,
      balance: balance ?? state.chemical.balance ?? 0,
      mixture: mixture ?? state.chemical.mixture,
      usagePerHa: usagePerHa ?? state.chemical.usagePerHa ?? 0,
      comment: comment ?? state.chemical.comment,
    )));
  }

  Future<void> onSave(BuildContext context) async {
    final canSave = state.chemical.campId != null &&
        state.chemical.openingStock != null &&
        state.chemical.issued != null &&
        state.chemical.balance != null &&
        state.chemical.mixture != null &&
        state.chemical.usagePerHa != null &&
        state.chemical.comment != null;

    if (!canSave) {
      return showSnackError(msg: 'Please select required field');
    }

    await cmoDatabaseMasterService
        .cacheChemicalFromRM(state.chemical.copyWith(
      farmId: int.parse(state.farmId!),
      chemicalNo: DateTime.now().microsecondsSinceEpoch.toString(),
      chemicalId: null,
      isActive: true,
      isMasterdataSynced: false,
    ))
        .then((value) async {
      if (value != null) {
        showSnackSuccess(msg: 'Save Chemical Id $value Successfully}');
        Navigator.pop(context);
        await initListData();
      } else {
        showSnackError(msg: 'Something was wrong, please try again.');
      }
    });
  }
}
