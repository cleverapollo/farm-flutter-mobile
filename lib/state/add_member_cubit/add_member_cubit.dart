import 'package:cmo/di.dart';
import 'package:cmo/model/farm_property_ownner_ship_type/farm_property_owner_ship_type.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMemberCubit extends Cubit<AddMemberState> {
  AddMemberCubit() : super(const AddMemberState()) {
    getAllFarmPropertyOwnerShipType();
  }

  Future<void> onTapSlimf({required bool isSlimf}) async {
    emit(state.copyWith(
        addMemberSLIMF: AddMemberSLIMF(isSlimfCompliant: isSlimf)));
  }

  Future<List<FarmPropertyOwnerShipType>> getAllFarmPropertyOwnerShipType() async {
    final data = await cmoDatabaseMasterService.getAllFarmPropertyOwnerShipType();
    return data;
  }

  Future<void> onTapMRA({
    bool? firstAnswer,
    bool? secondAnswer,
    bool? thirdAnswer,
    bool? fourthAnswer,
  }) async {
    final data = state.addMemberMRA ?? const AddMemberMRA();

    emit(state.copyWith(
        addMemberMRA: data.copyWith(
      firstAnswer: firstAnswer != null ? !firstAnswer : data.firstAnswer,
      secondAnswer: secondAnswer != null ? !secondAnswer : data.secondAnswer,
      thirdAnswer: thirdAnswer != null ? !thirdAnswer : data.thirdAnswer,
      fourthAnswer: fourthAnswer != null ? !fourthAnswer : data.fourthAnswer,
    )));
  }
}
