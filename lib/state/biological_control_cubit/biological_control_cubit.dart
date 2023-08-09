import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'biological_control_state.dart';

class BiologicalControlCubit extends Cubit<BiologicalControlState> {
  BiologicalControlCubit() : super(
    BiologicalControlState(),
        ) {
    onInit();
  }

  Future<void> onInit() async {}

}
