import 'package:flutter/material.dart';
import 'package:munchkin_level_counter/widgets/dice/dice_five.dart';
import 'package:munchkin_level_counter/widgets/dice/dice_four.dart';
import 'package:munchkin_level_counter/widgets/dice/dice_one.dart';
import 'package:munchkin_level_counter/widgets/dice/dice_six.dart';
import 'package:munchkin_level_counter/widgets/dice/dice_three.dart';
import 'package:munchkin_level_counter/widgets/dice/dice_two.dart';

class DiceWidget extends StatelessWidget {

  final int diceNumber;
  final double dotSize;

  DiceWidget(this.diceNumber, this.dotSize);

  @override
  Widget build(BuildContext context) {
    switch (diceNumber) {
      case 1: {
        return DiceOne(dotSize: dotSize,);
      }
      break;
      case 2: {
        return DiceTwo(dotSize: dotSize,);
      }
      break;
      case 3: {
        return DiceThree(dotSize: dotSize,);
      }
      break;
      case 4: {
        return DiceFour(dotSize: dotSize,);
      }
      break;
      case 5: {
        return DiceFive(dotSize: dotSize,);
      }
      break;
      case 6: {
        return DiceSix(dotSize: dotSize,);
      }
      break;
      default: {
        return Text('Error');
      }
      break;
    }
  }
}
