import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'compartment_state.dart';

class CompartmentCubit extends HydratedCubit<CompartmentState> {
  CompartmentCubit() : super(const CompartmentState());

  Future<void> loadListCompartment() async {
    emit(state.copyWith(loading: true));
    try {
      await cmoDatabaseMasterService.getCompartments();

      // final data = await service.getAllAuditsSynced();
      final data = [
        Compartment(compartmentId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'Compartment name 1', productGroup: 10, speciesGroup: 20,),
        Compartment(compartmentId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'Compartment name 1', productGroup: 10, speciesGroup: 20,),
        Compartment(compartmentId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'Compartment name 1', productGroup: 10, speciesGroup: 20,),
        Compartment(compartmentId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'Compartment name 1', productGroup: 10, speciesGroup: 20,),
        Compartment(compartmentId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'Compartment name 1', productGroup: 10, speciesGroup: 20,),
      ];
      emit(state.copyWith(listCompartment: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  @override
  CompartmentState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(CompartmentState state) {
    return null;
  }
}
