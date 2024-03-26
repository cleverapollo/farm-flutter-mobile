import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class MapCenterIcon extends StatelessWidget {
  const MapCenterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 1,
                  alignment: Alignment.center,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: Container(
                  width: 1,
                  alignment: Alignment.center,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  alignment: Alignment.center,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Container(
                  height: 1,
                  alignment: Alignment.center,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              border: Border.all(
                color: Colors.red,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: context.colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class MapTypeSwitchButton extends StatelessWidget {
  final void Function() onTap;

  const MapTypeSwitchButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      onPressed: onTap,
      child: const Icon(Icons.layers_sharp),
    );
  }
}