import 'package:flutter/material.dart';
import 'package:munchkin_level_counter/widgets/dice/dot.dart';

class DiceThree extends StatelessWidget {
  final double dotSize;

  DiceThree({this.dotSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              DiceDot(
                dotSize: dotSize,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DiceDot(
                dotSize: dotSize,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              DiceDot(
                dotSize: dotSize,
              )
            ],
          ),
        ],
      ),
    );
  }
}
