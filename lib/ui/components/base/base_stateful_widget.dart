import 'package:cmo/di.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  final String screenName;

  const BaseStatefulWidget({
    super.key,
    required this.screenName,
  });
}

abstract class BaseStatefulWidgetState<T extends BaseStatefulWidget> extends State<T>{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      navigationBreadcrumbs.updateCurrentSectionName(widget.screenName);
    });
  }

  @override
  void dispose() {
    Future.delayed(Duration(microseconds: 500)).then((_) {
      if (widget.screenName.isNotEmpty) {
        navigationBreadcrumbs.updateCurrentSectionName(null);
      }
    });

    super.dispose();
  }
}
