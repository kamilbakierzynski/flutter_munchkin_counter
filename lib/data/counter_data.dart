import 'package:flutter/material.dart';
import 'dart:math';

import 'package:munchkin_level_counter/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

class CounterData extends ChangeNotifier {
  int levelCounter = 1;
  int gearCounter = 0;
  int monsterCounter = 0;
  int playerBattleCounter = 1;
  int diceRoll = 1;
  bool gender = true; // true == male, false == female
  bool darkMode = false;
  bool dataRead = false;
  bool keepScreenOn = false;
  bool overrideLocale = false;
  String savedLocale = 'en';


  static MaterialColor accentColor = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFCF1A49),
      100: const Color(0xFFCF1A49),
      200: const Color(0xFFCF1A49),
      300: const Color(0xFFCF1A49),
      400: const Color(0xFFCF1A49),
      500: const Color(0xFFCF1A49),
      600: const Color(0xFFCF1A49),
      700: const Color(0xFFCF1A49),
      800: const Color(0xFFCF1A49),
      900: const Color(0xFFCF1A49),
    },
  );

  ThemeData lightTheme = ThemeData(
    platform: TargetPlatform.iOS,
    primarySwatch: accentColor,
    backgroundColor: AppColors().backgroundColor,
    scaffoldBackgroundColor: AppColors().backgroundColor,
    dialogBackgroundColor: AppColors().backgroundColor,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: AppColors().backgroundColor,
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );

  ThemeData darkTheme = ThemeData(
    platform: TargetPlatform.iOS,
    primarySwatch: accentColor,
    backgroundColor: Color(0xFF1F232E),
    scaffoldBackgroundColor: Color(0xFF1F232E),
    dialogBackgroundColor: Color(0xFF1F232E),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Color(0xFF1F232E),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );

  ThemeData getTheme() {
    if (darkMode) {
      return darkTheme;
    }
    return lightTheme;
  }

  Color getTextColor() {
    if (darkMode) {
      return Colors.white;
    }
    return AppColors().textColor;
  }

  void updatePlayerBattleCounter() {
    playerBattleCounter = levelCounter + gearCounter;
    _saveData();
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('levelCounter', levelCounter);
    await prefs.setInt('gearCounter', gearCounter);
    await prefs.setInt('monsterCounter', monsterCounter);
    await prefs.setInt('playerBattleCounter', playerBattleCounter);
    await prefs.setInt('diceRoll', diceRoll);
    await prefs.setBool('gender', gender);
    await prefs.setBool('darkMode', darkMode);
    await prefs.setBool('keepScreenOn', keepScreenOn);
    await prefs.setBool('overrideLocale', overrideLocale);
    await prefs.setString('savedLocale', savedLocale);
  }

  void readData() async {
    if (!dataRead) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      levelCounter = prefs.getInt('levelCounter') ?? 1;
      gearCounter = prefs.getInt('gearCounter') ?? 0;
      monsterCounter = prefs.getInt('monsterCounter') ?? 0;
      playerBattleCounter = prefs.getInt('playerBattleCounter') ?? 1;
      diceRoll = prefs.getInt('diceRoll') ?? 5;
      gender = prefs.getBool('gender') ?? true;
      darkMode = prefs.getBool('darkMode') ?? false;
      keepScreenOn = prefs.getBool('keepScreenOn') ?? false;
      overrideLocale = prefs.getBool('overrideLocale') ?? false;
      savedLocale = prefs.getString('savedLocale') ?? 'en';
      if (keepScreenOn) {
        Wakelock.enable();
      }
      dataRead = true;
      notifyListeners();
    }
  }

  void addLevel() {
    levelCounter++;
    updatePlayerBattleCounter();
    notifyListeners();
  }

  void minusLevel() {
    if (levelCounter > 1) {
      levelCounter--;
      updatePlayerBattleCounter();
      notifyListeners();
    }
  }

  void setLevel(int value) {
    levelCounter = value;
    updatePlayerBattleCounter();
    notifyListeners();
  }

  void addGear() {
    gearCounter++;
    updatePlayerBattleCounter();
    notifyListeners();
  }

  void minusGear() {
    gearCounter--;
    updatePlayerBattleCounter();
    notifyListeners();
  }

  void setGear(int value) {
    gearCounter = value;
    updatePlayerBattleCounter();
    notifyListeners();
  }

  int getLevel() {
    return levelCounter;
  }

  int getGear() {
    return gearCounter;
  }

  int getSum() {
    return levelCounter + gearCounter;
  }

  void changeGender() {
    gender = !gender;
    _saveData();
    notifyListeners();
  }

  bool getGender() {
    return gender;
  }

  void death() {
    gearCounter = 0;
    updatePlayerBattleCounter();
    notifyListeners();
  }

  void addPlayerBattleCounter() {
    playerBattleCounter++;
    _saveData();
    notifyListeners();
  }

  void minusPlayerBattleCounter() {
    playerBattleCounter--;
    _saveData();
    notifyListeners();
  }

  void setPlayerBattleCounter(int value) {
    playerBattleCounter = value;
    _saveData();
    notifyListeners();
  }

  void addMonsterCounter() {
    monsterCounter++;
    _saveData();
    notifyListeners();
  }

  void minusMonsterCounter() {
    monsterCounter--;
    _saveData();
    notifyListeners();
  }

  void setMonsterCounter(int value) {
    monsterCounter = value;
    _saveData();
    notifyListeners();
  }

  int getBattleDiff() {
    return playerBattleCounter - monsterCounter;
  }

  void generateRandom() {
    Random random = new Random();
    diceRoll = random.nextInt(6) + 1;
    _saveData();
    notifyListeners();

  }

  void resetPlayerBattle() {
    playerBattleCounter = getSum();
    _saveData();
    notifyListeners();
  }

  void resetMonsterBattle() {
    monsterCounter = 0;
    _saveData();
    notifyListeners();
  }

  void changeDarkMode(data) {
    darkMode = !darkMode;
    _saveData();
    notifyListeners();
  }

  void toggleScreenOn(data) {
    keepScreenOn = !keepScreenOn;
    if (keepScreenOn) {
      Wakelock.enable();
    } else {
      Wakelock.disable();
    }
    _saveData();
    notifyListeners();
  }

  void toggleOverrideLocale(data) {
    overrideLocale = !overrideLocale;
    if (!overrideLocale) {
      savedLocale = 'en';
    }
    _saveData();
    notifyListeners();
  }

  void changeSavedLocale(String value) {
    savedLocale = value;
    print(value);
    _saveData();
    notifyListeners();
  }
}