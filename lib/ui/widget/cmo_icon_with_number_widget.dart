import 'package:cmo/gen/assets.gen.dart';
import 'package:flutter/material.dart';

enum AuditQuestionIconEnum {
  location,
  camera,
  comment;

  const AuditQuestionIconEnum();

  SvgGenImage get icon {
    switch (this) {
      case AuditQuestionIconEnum.location:
        return Assets.icons.icLocationAudit;
      case AuditQuestionIconEnum.camera:
        return Assets.icons.icCameraAudit;
      case AuditQuestionIconEnum.comment:
        return Assets.icons.icChatAudit;
    }
  }

  SvgGenImage get iconFilledBackground {
    switch (this) {
      case AuditQuestionIconEnum.location:
        return Assets.icons.icLocationAuditFillBackground;
      case AuditQuestionIconEnum.camera:
        return Assets.icons.icCameraAuditFillBackground;
      case AuditQuestionIconEnum.comment:
        return Assets.icons.icChatAuditFillBackground;
    }
  }
}

class CmoNumberIconWidget extends StatefulWidget {
  factory CmoNumberIconWidget.byEnum({
    required AuditQuestionIconEnum iconType,
    int? number,
    bool enable = false,
    void Function()? onTap,
  }) {
    return CmoNumberIconWidget._(
      byEnum: true,
      iconType: iconType,
      number: number,
      enable: enable,
      onTap: onTap,
    );
  }

  factory CmoNumberIconWidget.byImages() {
    return const CmoNumberIconWidget._(byEnum: false);
  }

  const CmoNumberIconWidget._({
    this.number,
    this.enable = false,
    required this.byEnum,
    this.image,
    this.imageFilledColor,
    this.iconType,
    this.onTap,
  });

  final int? number;
  final bool enable;
  final bool byEnum;
  final Widget? image;
  final Widget? imageFilledColor;
  final AuditQuestionIconEnum? iconType;
  final void Function()? onTap;

  @override
  State<CmoNumberIconWidget> createState() => _CmoNumberIconWidgetState();
}

class _CmoNumberIconWidgetState extends State<CmoNumberIconWidget> {
  final _numberNotifier = ValueNotifier<int?>(null);

  @override
  void initState() {
    super.initState();
    if (widget.number != null && widget.number != 0) {
      _numberNotifier.value = widget.number;
    }
  }

  @override
  void didUpdateWidget(covariant CmoNumberIconWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.number != widget.number) {
      if (widget.number != null && widget.number != 0) {
        _numberNotifier.value = widget.number;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.byEnum) {
      return InkWell(
        onTap: widget.onTap,
        child: ValueListenableBuilder(
            valueListenable: _numberNotifier,
            builder: (context, number, __) {
              if (!widget.enable) {
                return SizedBox(
                  height: 40,
                  width: 40,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: widget.iconType!.icon.svg(
                          height: 32,
                          width: 32,
                        ),
                      )
                    ],
                  ),
                );
              }

              return SizedBox(
                height: 40,
                width: 40,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: widget.iconType?.iconFilledBackground.svg(
                        height: 32,
                        width: 32,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Visibility(
                        visible: !(number == null || number == 0),
                        maintainState: true,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Assets.icons.icCircleFillBackground.svg(
                              height: 15,
                              width: 15,
                            ),
                            Text(
                              '$number',
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      );
    }
    return const SizedBox();
  }
}
