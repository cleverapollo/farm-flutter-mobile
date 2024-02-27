import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:flutter/material.dart';

class MemberSearchViewMode extends StatelessWidget {
  final MemberManagementViewMode viewMode;
  final void Function()? onChangeViewMode;
  final Widget searchWidget;

  const MemberSearchViewMode({
    super.key,
    required this.searchWidget,
    required this.viewMode,
    this.onChangeViewMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            child: searchWidget,
          ),
          const SizedBox(
            width: 12,
          ),
          InkWell(
            onTap: () => onChangeViewMode?.call(),
            child: viewMode == MemberManagementViewMode.listView
                ? Assets.icons.icMapViewInactive.svg()
                : Assets.icons.icMapViewActive.svg(),
          ),
        ],
      ),
    );
  }
}