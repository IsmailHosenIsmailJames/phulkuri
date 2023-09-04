import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/show_toast.dart';
import '../theme_storage_manager.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  ThemeMode _themeMode = ThemeMode.system;
  Icon _icon = const Icon(Icons.brightness_4_outlined);
  String _modeName = "System";

  ThemeMode get themeMode => _themeMode;
  Icon get icon => _icon;
  String get modeName => _modeName;

  void initPrefarense() async {
    try {
      StorageManager.readData('themeMode').then((value) {
        if (value == "system") {
          changeTheme(0);
        } else if (value == "light") {
          changeTheme(1);
        } else {
          changeTheme(-1);
        }
      });
    } catch (e) {
      showToast(e.toString());
    }
    emit(ThemeChanged());
  }

  void changeTheme(int value) {
    if (value == 0) {
      _themeMode = ThemeMode.system;
      _icon = const Icon(Icons.brightness_4_outlined);
      _modeName = "System";
      StorageManager.saveData("themeMode", "system");
    } else if (value == 1) {
      _themeMode = ThemeMode.light;
      _icon = const Icon(Icons.wb_sunny_outlined);
      _modeName = "Light";
      StorageManager.saveData("themeMode", "light");
    } else {
      _themeMode = ThemeMode.dark;
      _icon = const Icon(Icons.dark_mode_outlined);
      _modeName = "Dark";
      StorageManager.saveData("themeMode", "dark");
    }
    emit(ThemeChanged());
  }
}
