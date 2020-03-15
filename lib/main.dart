import 'package:flutter/material.dart';
import 'package:munchkin_level_counter/colors.dart';
import 'package:flutter/services.dart';
import 'package:munchkin_level_counter/data/app_localizations.dart';
import 'package:munchkin_level_counter/data/counter_data.dart';
import 'package:munchkin_level_counter/screens/battle_screen.dart';
import 'package:munchkin_level_counter/screens/counter_screen.dart';
import 'package:munchkin_level_counter/screens/dice_screen.dart';
import 'package:munchkin_level_counter/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterData>(create: (_) => CounterData()),
      ],
      child: MaterialAppProviders(),
    );
  }
}

class MaterialAppProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterData counterData = Provider.of<CounterData>(context);
    counterData.readData();
    return MaterialApp(
      title: 'Munchkin Counter',
      supportedLocales: [
        Locale('en'),
        Locale('pl'),
        Locale('ru')
      ],
      locale: Locale(counterData.savedLocale),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          return supportedLocales.first;
        }
        for (var supportedLocale in supportedLocales) {
          print(locale.languageCode);
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: counterData.getTheme(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 4,
          initialIndex: 1,
          child: MaterialAppTabs()),
    );
  }
}

class MaterialAppTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterData counterData = Provider.of<CounterData>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TabBar(
              indicatorColor: AppColors().accentColor,
              labelColor: counterData.getTextColor(),
              indicatorWeight: 2.0,
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 18.0),
              tabs: <Widget>[
                Tab(text: AppLocalizations.of(context).translate('battle')),
                Tab(text: AppLocalizations.of(context).translate('counter')),
                Tab(text: AppLocalizations.of(context).translate('dice')),
                Tab(text: AppLocalizations.of(context).translate('settings'))
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          BattleScreen(),
          CounterScreen(),
          DiceScreen(),
          SettingsScreen()
        ],
      ),
    );
  }
}
