import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeMode> {
  static const String _prefsKey = 'selected_theme';
  final SharedPreferences _prefs;

  ThemeCubit(this._prefs)
    : super(
        ThemeMode.values.firstWhere(
          (e) => e.name == _prefs.getString(_prefsKey),
          orElse: () => ThemeMode.system,
        ),
      );

  Future<void> setLight() async {
    await _prefs.setString(_prefsKey, ThemeMode.light.name);
    emit(ThemeMode.light);
  }

  Future<void> setDark() async {
    await _prefs.setString(_prefsKey, ThemeMode.dark.name);
    emit(ThemeMode.dark);
  }

  Future<void> setSystem() async {
    await _prefs.setString(_prefsKey, ThemeMode.system.name);
    emit(ThemeMode.system);
  }
}
