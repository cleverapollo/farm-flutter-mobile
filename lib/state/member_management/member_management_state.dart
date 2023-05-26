import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/model/resource_manager_unit.dart';

class MemberManagementState {
  const MemberManagementState({
    this.farms = const [],
    this.resourceManagerUnit,
    this.groupScheme,
  });

  final List<Farm> farms;
  final ResourceManagerUnit? resourceManagerUnit;
  final GroupScheme? groupScheme;

  MemberManagementState copyWith({
    List<Farm>? farms,
    ResourceManagerUnit? resourceManagerUnit,
    GroupScheme? groupScheme,
  }) {
    return MemberManagementState(
      farms: farms ?? this.farms,
      resourceManagerUnit: resourceManagerUnit ?? this.resourceManagerUnit,
      groupScheme: groupScheme ?? this.groupScheme,
    );
  }
}
