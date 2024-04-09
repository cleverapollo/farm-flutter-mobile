import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_group_scheme_state.dart';
class MyGroupSchemeCubit extends Cubit<MyGroupSchemeState> {

  MyGroupSchemeCubit() : super(const MyGroupSchemeState()){
    initData();
  }

  Future<void> initData() async {
    emit(state.copyWith(loading: true));
    final groupSchemeContentLibrary = await cmoDatabaseMasterService.getGroupSchemeContentLibrary();
    emit(
      state.copyWith(
        groupSchemeContentLibrary: groupSchemeContentLibrary,
        loading: false,
      ),
    );
  }
}
