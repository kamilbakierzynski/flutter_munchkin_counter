import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:munchkin_level_counter/colors.dart';
import 'package:munchkin_level_counter/data/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:xlive_switch/xlive_switch.dart';
import 'package:munchkin_level_counter/data/counter_data.dart';
import 'package:toast/toast.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterData counterData = Provider.of<CounterData>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: AutoSizeText(
                          AppLocalizations.of(context).translate('dark_mode'),
                          maxLines: 1,
                          style: TextStyle(
                              color: counterData.getTextColor(),
                              fontSize: 25.0),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      XlivSwitch(
                        value: counterData.darkMode,
                        onChanged: counterData.changeDarkMode,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: AutoSizeText(
                          AppLocalizations.of(context)
                              .translate('keep_screen_on'),
                          maxLines: 1,
                          style: TextStyle(
                              color: counterData.getTextColor(),
                              fontSize: 25.0),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      XlivSwitch(
                        value: counterData.keepScreenOn,
                        onChanged: counterData.toggleScreenOn,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: AutoSizeText(
                          AppLocalizations.of(context)
                              .translate('overwrite_device_language'),
                          maxLines: 1,
                          style: TextStyle(
                              color: counterData.getTextColor(),
                              fontSize: 25.0),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      XlivSwitch(
                        value: counterData.overrideLocale,
                        onChanged: (_) {
                          counterData.toggleOverrideLocale(_);
//                          if (counterData.overrideLocale) {
//                            Toast.show(
//                                AppLocalizations.of(context)
//                                    .translate('restart_app_to_change_language'), context,
//                                duration: Toast.LENGTH_SHORT,
//                                backgroundColor: AppColors().accentColor,
//                                textColor: Colors.white,
//                                gravity: Toast.BOTTOM);
//                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  counterData.overrideLocale
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: AutoSizeText(
                                AppLocalizations.of(context)
                                    .translate('choose_language'),
                                maxLines: 1,
                                style: TextStyle(
                                    color: counterData.getTextColor(),
                                    fontSize: 25.0),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors().backgroundColor,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 3.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: counterData.savedLocale,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('English'),
                                        value: 'en',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Polski'),
                                        value: 'pl',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Pусский'),
                                        value: 'ru',
                                      )
                                    ],
                                    onChanged: (String value) {
                                      counterData.changeSavedLocale(value);
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : SizedBox.shrink(),
                  counterData.savedLocale == 'ru'
                      ? Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: AutoSizeText(
                                  'Спасибо Максиму за перевод на русский',
                                  style: TextStyle(
                                      color: counterData.getTextColor(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
