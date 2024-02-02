import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cmo/third_party/lunar_calendar/date_init.dart';
import 'package:cmo/third_party/lunar_calendar/date_model.dart';
import 'package:cmo/third_party/lunar_calendar/datetime_picker_theme.dart';

typedef DateChangedCallback = Function(DateTime time);
typedef DateCancelledCallback = Function();
typedef StringAtIndexCallBack = String? Function(int index);

class LunarDatePicker {
  static Future<DateTime?> showDatePicker(
    BuildContext context, {
    bool showTitleActions = true,
    DateTime? minTime,
    DateTime? maxTime,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    DateTime? currentTime,
    DatePickerTheme? theme,
    DateInitTime? dateInitTime,
    bool? showTime,
  }) {
    return Navigator.push(
      context,
      _DatePickerRoute(
        showTitleActions: showTitleActions,
        onChanged: onChanged,
        onConfirm: onConfirm,
        onCancel: onCancel,
        theme: theme,
        dateInitTime: dateInitTime,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        showTime: showTime,
      ),
    );
  }
}

class _DatePickerRoute<T> extends PopupRoute<T> {
  _DatePickerRoute({
    this.showTitleActions,
    this.onChanged,
    this.onConfirm,
    this.onCancel,
    DatePickerTheme? theme,
    this.dateInitTime,
    this.barrierLabel,
    this.showTime,
    RouteSettings? settings,
  })  : theme = theme ?? const DatePickerTheme(),
        super(settings: settings);

  final bool? showTitleActions;
  final DateChangedCallback? onChanged;
  final DateChangedCallback? onConfirm;
  final DateCancelledCallback? onCancel;
  final DatePickerTheme theme;
  final DateInitTime? dateInitTime;
  final bool? showTime;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => Colors.black54;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController = BottomSheet.createAnimationController(navigator!.overlay!);
    return _animationController!;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _DatePickerComponent(
        onChanged: onChanged,
        route: this,
        dateInitTime: dateInitTime,
        showTime: showTime,
      ),
    );
    return InheritedTheme.captureAll(context, bottomSheet);
  }
}

class _DatePickerComponent extends StatefulWidget {
  const _DatePickerComponent({
    Key? key,
    required this.route,
    this.onChanged,
    required this.dateInitTime,
    required this.showTime,
  }) : super(key: key);

  final DateChangedCallback? onChanged;

  final _DatePickerRoute route;

  final DateInitTime? dateInitTime;

  final bool? showTime;

  @override
  State<StatefulWidget> createState() {
    return _DatePickerState();
  }
}

class _DatePickerState extends State<_DatePickerComponent> {
  late FixedExtentScrollController leftScrollCtrl,
      middleScrollCtrl,
      rightScrollCtrl,
      hourScrollCtrl,
      minuteScrollCtrl;

  late BasePickerModel pickerModel;

  @override
  void initState() {
    super.initState();
    pickerModel = LunarPickerModel(
        currentTime: widget.dateInitTime?.currentTime,
        maxTime: widget.dateInitTime?.maxTime,
        minTime: widget.dateInitTime?.minTime,
    );
    refreshScrollOffset();
  }

  void refreshScrollOffset() {
    leftScrollCtrl = FixedExtentScrollController(
        initialItem: pickerModel.currentLeftIndex());
    middleScrollCtrl = FixedExtentScrollController(
        initialItem: pickerModel.currentMiddleIndex());
    rightScrollCtrl = FixedExtentScrollController(
        initialItem: pickerModel.currentRightIndex());
    hourScrollCtrl = FixedExtentScrollController(
        initialItem: pickerModel.currentHourIndex());
    minuteScrollCtrl = FixedExtentScrollController(
        initialItem: pickerModel.currentMinuteIndex());
  }

  @override
  void dispose() {
    leftScrollCtrl.dispose();
    middleScrollCtrl.dispose();
    rightScrollCtrl.dispose();
    hourScrollCtrl.dispose();
    minuteScrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.route.theme;
    return GestureDetector(
      child: AnimatedBuilder(
        animation: widget.route.animation!,
        builder: (BuildContext context, Widget? child) {
          final bottomPadding = MediaQuery.of(context).padding.bottom;
          return ClipRect(
            child: CustomSingleChildLayout(
              delegate: _BottomPickerLayout(
                widget.route.animation!.value,
                theme,
                showTitleActions: widget.route.showTitleActions!,
                bottomPadding: bottomPadding,
              ),
              child: GestureDetector(
                child: Material(
                  color: theme.backgroundColor,
                  child: _renderPickerView(theme),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _notifyDateChanged() {
    if (widget.onChanged != null) {
      widget.onChanged!(pickerModel.finalTime()!);
    }
  }

  Widget _renderPickerView(DatePickerTheme theme) {
    final itemView = _renderItemView(theme);
    if (widget.route.showTitleActions == true) {
      return Column(
        children: <Widget>[
          _renderTitleActionsView(theme),
          itemView,
        ],
      );
    }
    return itemView;
  }

  Widget _renderColumnView(
    ValueKey key,
    DatePickerTheme theme,
    StringAtIndexCallBack stringAtIndexCB,
    ScrollController scrollController,
    int layoutProportion,
    ValueChanged<int> selectedChangedWhenScrolling,
    ValueChanged<int> selectedChangedWhenScrollEnd,
  ) {
    return Expanded(
      flex: layoutProportion,
      child: Container(
        height: theme.containerHeight,
        decoration: BoxDecoration(color: theme.backgroundColor),
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            if (notification.depth == 0 &&
                notification is ScrollEndNotification &&
                notification.metrics is FixedExtentMetrics) {
              final metrics = notification.metrics as FixedExtentMetrics;
              final currentItemIndex = metrics.itemIndex;
              selectedChangedWhenScrollEnd(currentItemIndex);
            }
            return false;
          },
          child: CupertinoPicker.builder(
            key: key,
            backgroundColor: theme.backgroundColor,
            scrollController: scrollController as FixedExtentScrollController,
            itemExtent: theme.itemHeight,
            onSelectedItemChanged: (int index) {
              selectedChangedWhenScrolling(index);
            },
            useMagnifier: true,
            itemBuilder: (BuildContext context, int index) {
              final content = stringAtIndexCB(index);
              if (content == null) {
                return null;
              }
              return Container(
                height: theme.itemHeight,
                alignment: Alignment.center,
                child: Text(
                  content,
                  style: theme.itemStyle,
                  textAlign: TextAlign.start,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _renderItemView(DatePickerTheme theme) {
    return Container(
      color: theme.backgroundColor,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: pickerModel.layoutProportions()[0] > 0
                  ? _renderColumnView(
                      ValueKey(pickerModel.currentLeftIndex()),
                      theme,
                      pickerModel.leftStringAtIndex,
                      leftScrollCtrl,
                      pickerModel.layoutProportions()[0], (index) {
                      pickerModel.setLeftIndex(index);
                    }, (index) {
                      setState(() {
                        refreshScrollOffset();
                        _notifyDateChanged();
                      });
                    })
                  : null,
            ),
            Text(
              pickerModel.leftDivider(),
              style: theme.itemStyle,
            ),
            Container(
              child: pickerModel.layoutProportions()[1] > 0
                  ? _renderColumnView(
                      ValueKey(pickerModel.currentLeftIndex() * 100 +
                          pickerModel.currentMiddleIndex()),
                      theme,
                      pickerModel.middleStringAtIndex,
                      middleScrollCtrl,
                      pickerModel.layoutProportions()[1], (index) {
                      pickerModel.setMiddleIndex(index);
                    }, (index) {
                      setState(() {
                        refreshScrollOffset();
                        _notifyDateChanged();
                      });
                    })
                  : null,
            ),
            Text(
              pickerModel.rightDivider(),
              style: theme.itemStyle,
            ),
            Container(
              child: pickerModel.layoutProportions()[2] > 0
                  ? _renderColumnView(
                      ValueKey(pickerModel.currentMiddleIndex() * 100 +
                          pickerModel.currentLeftIndex()),
                      theme,
                      pickerModel.rightStringAtIndex,
                      rightScrollCtrl,
                      pickerModel.layoutProportions()[2], (index) {
                      pickerModel.setRightIndex(index);
                    }, (index) {
                      setState(() {
                        refreshScrollOffset();
                        _notifyDateChanged();
                      });
                    })
                  : null,
            ),
            if (widget.showTime ?? true)
              Text(
                pickerModel.rightDivider(),
                style: theme.itemStyle,
              ),
            if (widget.showTime ?? true)
              Container(
                child: pickerModel.layoutProportions()[3] > 0
                    ? _renderColumnView(
                        ValueKey(pickerModel.currentMinuteIndex() * 200 +
                            pickerModel.currentHourIndex()),
                        theme,
                        pickerModel.hourStringAtIndex,
                        hourScrollCtrl,
                        pickerModel.layoutProportions()[3], (index) {
                        pickerModel.setHourIndex(index);
                      }, (index) {
                        setState(() {
                          refreshScrollOffset();
                          _notifyDateChanged();
                        });
                      })
                    : null,
              ),
            if (widget.showTime ?? true)
              Text(
                pickerModel.timeDivider(),
                style: theme.itemStyle,
              ),
            if (widget.showTime ?? true)
              Container(
                child: pickerModel.layoutProportions()[4] > 0
                    ? _renderColumnView(
                        ValueKey(pickerModel.currentMinuteIndex() * 100 +
                            pickerModel.currentHourIndex()),
                        theme,
                        pickerModel.minuteStringAtIndex,
                        minuteScrollCtrl,
                        pickerModel.layoutProportions()[4], (index) {
                        pickerModel.setMinuteIndex(index);
                      }, (index) {
                        setState(() {
                          refreshScrollOffset();
                          _notifyDateChanged();
                        });
                      })
                    : null,
              ),
          ],
        ),
    );
  }

  Widget _renderTitleActionsView(DatePickerTheme theme) {
    return Container(
      height: theme.titleHeight,
      decoration: BoxDecoration(
        color: theme.headerColor ?? theme.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: theme.titleHeight,
            child: CupertinoButton(
              pressedOpacity: 0.3,
              padding: const EdgeInsetsDirectional.only(start: 16, top: 0),
              child: Text(
                LocaleKeys.cancel.tr(),
                style: theme.cancelStyle,
              ),
              onPressed: () {
                Navigator.pop(context);
                if (widget.route.onCancel != null) {
                  widget.route.onCancel!();
                }
              },
            ),
          ),
          Expanded(
            child: Text(
              LocaleKeys.lunar_calendar.tr(),
              textAlign: TextAlign.center,
              style: context.textStyles.bodyBold.copyWith(fontSize: 20),
            ),
          ),
          SizedBox(
            height: theme.titleHeight,
            child: CupertinoButton(
              pressedOpacity: 0.3,
              padding: const EdgeInsetsDirectional.only(end: 16, top: 0),
              child: Text(
                LocaleKeys.done.tr(),
                style: theme.doneStyle,
              ),
              onPressed: () {
                Navigator.pop(context, pickerModel.finalTime());
                if (widget.route.onConfirm != null) {
                  widget.route.onConfirm!(pickerModel.finalTime()!);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomPickerLayout extends SingleChildLayoutDelegate {
  _BottomPickerLayout(
    this.progress,
    this.theme, {
    this.showTitleActions,
    this.bottomPadding = 0,
  });

  final double progress;

  final bool? showTitleActions;
  final DatePickerTheme theme;
  final double bottomPadding;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    var maxHeight = theme.containerHeight;
    if (showTitleActions != null && showTitleActions!) {
      maxHeight += theme.titleHeight;
    }

    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      maxHeight: maxHeight + bottomPadding,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final height = size.height - childSize.height * progress;
    return Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_BottomPickerLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
