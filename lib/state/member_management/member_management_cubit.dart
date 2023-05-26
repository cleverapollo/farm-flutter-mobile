import 'package:cmo/di.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class MemberManagementCubit extends Cubit<MemberManagementState> {
  MemberManagementCubit() : super(const MemberManagementState());
  
  Future init() async {
    var data = await cmoDatabaseMasterService.getFarms();
    if (data == null) {
      return;
    }
    final groupScheme = await configService.getActiveGroupScheme();
    final rmUnit = await configService.getActiveRegionalManager();
    print("DEBUG fetch farm ${data.length}");
    emit(state.copyWith(
      groupScheme: groupScheme,
      resourceManagerUnit: rmUnit,
      farms: data,
    ));
  }
}
