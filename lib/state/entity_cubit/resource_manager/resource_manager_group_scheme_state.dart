import 'package:cmo/model/group_scheme.dart';

class ResourceManagerGroupSchemeState {
  const ResourceManagerGroupSchemeState({
    this.isGroupSchemeLoading = false,
    this.groupSchemes = const [],
    this.selectedGroupScheme,
  });

  final bool isGroupSchemeLoading;
  final List<GroupScheme> groupSchemes;
  final GroupScheme? selectedGroupScheme;

  ResourceManagerGroupSchemeState copyWith({
    bool? isGroupSchemeLoading,
    List<GroupScheme>? groupSchemes,
    GroupScheme? selectedGroupScheme,
  }) {
    return ResourceManagerGroupSchemeState(
      isGroupSchemeLoading: isGroupSchemeLoading ?? this.isGroupSchemeLoading,
      groupSchemes: groupSchemes ?? this.groupSchemes,
      selectedGroupScheme: selectedGroupScheme ?? this.selectedGroupScheme,
    );
  }
}
