import 'package:flutter/material.dart';
import 'package:munchkin_level_counter/widgets/dice/dot.dart';

class DiceSix extends StatelessWidget {
  final double dotSize;

  DiceSix({this.dotSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DiceDot(
                dotSize: dotSize,
              ),
              DiceDot(
                dotSize: dotSize,
              ),
              DiceDot(
                dotSize: dotSize,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DiceDot(
                dotSize: dotSize,
              ),
              DiceDot(
                dotSize: dotSize,
              ),
              DiceDot(
                dotSize: dotSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
