import 'package:flutter/material.dart';
import 'package:munchkin_level_counter/widgets/dice/dot.dart';

class DiceOne extends StatelessWidget {

  final double dotSize;

  DiceOne({this.dotSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DiceDot(dotSize: dotSize,),
    );
  }
}
