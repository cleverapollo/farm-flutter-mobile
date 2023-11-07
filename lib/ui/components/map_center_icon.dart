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
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              border: Border.all(
                width: 1,
                color: Colors.red,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}