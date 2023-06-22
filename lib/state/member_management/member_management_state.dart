import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/model/resource_manager_unit.dart';

class MemberManagementState {
  const MemberManagementState({
    this.allFarms = const [],
    this.filteringFarms = const [],
    this.resourceManagerUnit,
    this.groupScheme,
    this.filteringText,
    this.isInCompleteSelected = true,
  });

  final List<Farm> allFarms;
  final ResourceManagerUnit? resourceManagerUnit;
  final GroupScheme? groupScheme;
  final List<Farm> filteringFarms;
  final String? filteringText;
  final bool isInCompleteSelected;

  MemberManagementState copyWith({
    List<Farm>? allFarms,
    ResourceManagerUnit? resourceManagerUnit,
    GroupScheme? groupScheme,
    List<Farm>? filteringFarms,
    String? filteringText,
    bool? isInCompleteSelected,
  }) {
    return MemberManagementState(
      allFarms: allFarms ?? this.allFarms,
      resourceManagerUnit: resourceManagerUnit ?? this.resourceManagerUnit,
      groupScheme: groupScheme ?? this.groupScheme,
      filteringFarms: filteringFarms ?? this.filteringFarms,
      filteringText: filteringText ?? this.filteringText,
      isInCompleteSelected: isInCompleteSelected ?? this.isInCompleteSelected,
    );
  }
}
