part of 'my_group_scheme_cubit.dart';

class MyGroupSchemeState extends BaseState {
  final GroupSchemeContentLibrary? groupSchemeContentLibrary;

  const MyGroupSchemeState({
    this.groupSchemeContentLibrary,
    super.loading = false,
  }) : super();

  MyGroupSchemeState copyWith({
    GroupSchemeContentLibrary? groupSchemeContentLibrary,
    bool? loading,
  }) {
    return MyGroupSchemeState(
      loading: loading ?? this.loading,
      groupSchemeContentLibrary: groupSchemeContentLibrary ?? this.groupSchemeContentLibrary,
    );
  }
}
