import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class CounterButton extends StatelessWidget {

  final Icon buttonIcon;
  final Function buttonFunction;

  CounterButton({this.buttonIcon, this.buttonFunction});


  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 3.5,
        height: MediaQuery.of(context).size.width / 3.5,
        child: NeuButton(
          onPressed: buttonFunction,
          child: buttonIcon,
        ));
  }
}
