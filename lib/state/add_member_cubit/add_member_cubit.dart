import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMemberCubit extends Cubit<AddMemberState> {
  AddMemberCubit() : super(const AddMemberState());

  Future<void> onTapSlimf({required bool isSlimf}) async {
    emit(state.copyWith(
        addMemberSLIMF: AddMemberSLIMF(isSlimfCompliant: isSlimf)));
  }
}
