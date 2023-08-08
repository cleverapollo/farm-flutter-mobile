import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'aai_state.dart';

class AAICubit extends Cubit<AAIState> {
  AAICubit() : super(const AAIState()) {
    onInit();
  }

  Future<void> onInit() async {

  }

}
