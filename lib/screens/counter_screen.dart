import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:munchkin_level_counter/colors.dart';
import 'package:munchkin_level_counter/data/app_localizations.dart';
import 'package:munchkin_level_counter/icons.dart';
import 'package:munchkin_level_counter/widgets/counter_button.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:munchkin_level_counter/data/counter_data.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterData counterData = Provider.of<CounterData>(context);
    final double deviceHeight = MediaQuery.of(context).size.height - 80.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: deviceHeight * 0.35,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 40.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: NeuCard(
              bevel: 12,
              width: double.infinity,
              height: double.infinity,
              curveType: CurveType.emboss,
              decoration: NeumorphicDecoration(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Center(
                            child: AutoSizeText(counterData.getSum().toString(),
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 90.0,
                                    color: AppColors().accentColor,
                                    fontWeight: FontWeight.w700)),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        NeuButton(
                          onPressed: counterData.changeGender,
                          bevel: 6,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 20,
                            child: Center(
                              child: AutoSizeText(
                                counterData.getGender()
                                    ? AppLocalizations.of(context)
                                        .translate('male')
                                    : AppLocalizations.of(context)
                                        .translate('female'),
                                maxLines: 1,
                                style: TextStyle(
                                    color: counterData.getTextColor(),
                                    fontSize: 17.0),
                              ),
                            ),
                          ),
                        ),
                        NeuButton(
                          onPressed: counterData.death,
                          bevel: 6,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 20,
                            child: Center(
                              child: AutoSizeText(
                                AppLocalizations.of(context).translate('death'),
                                maxLines: 1,
                                style: TextStyle(
                                    color: counterData.getTextColor(),
                                    fontSize: 17.0),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            height: deviceHeight * 0.65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Center(
                        child: AutoSizeText(
                          AppLocalizations.of(context).translate('level'),
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 30.0,
                              color: counterData.getTextColor()),
                        ),
                      ),
                    ),
                    CounterButton(
                      buttonIcon: AppIcons().addIcon,
                      buttonFunction: counterData.addLevel,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog<int>(
                            context: context,
                            builder: (BuildContext context) {
                              return NumberPickerDialog.integer(
                                  title: Text(
                                    AppLocalizations.of(context)
                                        .translate('level'),
                                    style: TextStyle(
                                        color: AppColors().accentColor),
                                  ),
                                  confirmWidget: Text(
                                    AppLocalizations.of(context)
                                        .translate('set'),
                                    style: TextStyle(
                                        color: AppColors().accentColor),
                                  ),
                                  cancelWidget: Text(
                                    AppLocalizations.of(context)
                                        .translate('cancel'),
                                    style: TextStyle(
                                        color: AppColors().accentColor),
                                  ),
                                  minValue: 1,
                                  maxValue: 99,
                                  initialIntegerValue: counterData.getLevel());
                            }).then((int value) {
                          if (value != null) {
                            counterData.setLevel(value);
                          }
                        });
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Center(
                          child: AutoSizeText(
                            counterData.getLevel().toString(),
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 60.0,
                                color: counterData.getTextColor()),
                          ),
                        ),
                      ),
                    ),
                    CounterButton(
                      buttonIcon: AppIcons().minusIcon,
                      buttonFunction: counterData.minusLevel,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Center(
                        child: AutoSizeText(
                          AppLocalizations.of(context).translate('gear'),
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 30.0,
                              color: counterData.getTextColor()),
                        ),
                      ),
                    ),
                    CounterButton(
                      buttonIcon: AppIcons().addIcon,
                      buttonFunction: counterData.addGear,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog<int>(
                            context: context,
                            builder: (BuildContext context) {
                              return NumberPickerDialog.integer(
                                  title: Text(
                                    AppLocalizations.of(context)
                                        .translate('gear'),
                                    style: TextStyle(
                                        color: AppColors().accentColor),
                                  ),
                                  confirmWidget: Text(
                                    AppLocalizations.of(context)
                                        .translate('set'),
                                    style: TextStyle(
                                        color: AppColors().accentColor),
                                  ),
                                  cancelWidget: Text(
                                    AppLocalizations.of(context)
                                        .translate('cancel'),
                                    style: TextStyle(
                                        color: AppColors().accentColor),
                                  ),
                                  minValue: -99,
                                  maxValue: 99,
                                  initialIntegerValue: counterData.getGear());
                            }).then((int value) {
                          if (value != null) {
                            counterData.setGear(value);
                          }
                        });
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Center(
                          child: AutoSizeText(counterData.getGear().toString(),
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 60.0,
                                  color: counterData.getTextColor())),
                        ),
                      ),
                    ),
                    CounterButton(
                      buttonIcon: AppIcons().minusIcon,
                      buttonFunction: counterData.minusGear,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
