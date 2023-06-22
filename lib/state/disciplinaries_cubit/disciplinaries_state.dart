import 'package:cmo/model/camp.dart';
import 'package:cmo/model/data/worker.dart';
import 'package:cmo/model/issue_type/issue_type.dart';
import 'package:cmo/model/labour_management/farmer_worker.dart';
import 'package:cmo/model/sanction_register/sanction_register.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/disciplinaries/disciplinaries_screen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'disciplinaries_state.freezed.dart';

@freezed
class DisciplinariesState with _$DisciplinariesState {
  const factory DisciplinariesState({
    SanctionRegister? data,
    @Default(<FarmerWorker>[]) List<FarmerWorker> workers,
    @Default(<IssueType>[]) List<IssueType> issueTypes,
    @Default(<Camp>[]) List<Camp> camps,
    @Default(<SanctionRegister>[]) List<SanctionRegister> sanctionRegisters,
    String? farmId,
    String? groupSchemeId,
    @Default(true) bool isOpen,
  }) = _DisciplinariesState;
}
