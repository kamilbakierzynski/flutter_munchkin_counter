import 'dart:async';

import 'package:flutter/material.dart';
import 'package:munchkin_level_counter/colors.dart';
import 'package:neumorphic/neumorphic.dart';

class DiceDot extends StatefulWidget {

  final double dotSize;
  Color dotColor;
  double animSize;

  DiceDot({this.dotSize});

  @override
  _DiceDotState createState() => _DiceDotState();
}

class _DiceDotState extends State<DiceDot> {

  @override
  void initState() {
    widget.dotColor = Colors.transparent;
    widget.animSize = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 10), () {setState(() {
      widget.dotColor = AppColors().accentColor;
      widget.animSize = widget.dotSize;
    });});
    return NeuCard(
      curveType: CurveType.concave,
      width: widget.animSize,
      height: widget.animSize,
      color: Colors.yellow,
      bevel: 8,
      decoration: NeumorphicDecoration(
          borderRadius: BorderRadius.circular(50.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: widget.dotColor,
          ),
        ),
      ),
    );
  }
}
