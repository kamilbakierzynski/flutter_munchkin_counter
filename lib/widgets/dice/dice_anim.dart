import 'package:flutter/material.dart';
import 'package:munchkin_level_counter/widgets/dice/dice.dart';
import 'package:neumorphic/neumorphic.dart';

class DiceAnim extends StatefulWidget {

  final double diceSize;
  final int diceRoll;
  final double dotSize;

  DiceAnim({this.diceSize, this.diceRoll, this.dotSize});

  @override
  _DiceAnimState createState() => _DiceAnimState();
}

class _DiceAnimState extends State<DiceAnim> {
  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: 200,
      child: NeuCard(
        width: widget.diceSize,
        height: widget.diceSize,
        curveType: CurveType.emboss,
        decoration:
        NeumorphicDecoration(borderRadius: BorderRadius.circular(15.0)),
        child: ClipRRect(
            child: DiceWidget(widget.diceRoll, widget.dotSize),
            borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
