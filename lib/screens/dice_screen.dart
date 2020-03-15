import 'package:flutter/material.dart';
import 'package:munchkin_level_counter/colors.dart';
import 'package:munchkin_level_counter/data/app_localizations.dart';
import 'package:munchkin_level_counter/widgets/dice/dice.dart';
import 'package:munchkin_level_counter/data/counter_data.dart';

import 'package:neumorphic/neumorphic.dart';
import 'package:provider/provider.dart';

class DiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterData counterData = Provider.of<CounterData>(context);
    final double diceSize = MediaQuery.of(context).size.width * 0.6;
    final double dotSize = (diceSize - 40) / 3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        NeuCard(
          width: diceSize,
          height: diceSize,
          curveType: CurveType.emboss,
          decoration:
              NeumorphicDecoration(borderRadius: BorderRadius.circular(15.0)),
          child: ClipRRect(
              child: DiceWidget(counterData.diceRoll, dotSize),
              borderRadius: BorderRadius.circular(15.0)),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.3,
          child: NeuButton(
            onPressed: counterData.generateRandom,
            child: Text(
              AppLocalizations.of(context).translate('roll_a_dice'),
              style: TextStyle(
                  color: counterData.getTextColor(),
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900),
            ),
          ),
        )
      ],
    );
  }
}
