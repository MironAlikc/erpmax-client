import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocaleCubit extends Cubit<Locale> {
  static const String _prefsKey = 'selected_language';
  final SharedPreferences _prefs;

  LocaleCubit(this._prefs) : super(Locale(_prefs.getString(_prefsKey) ?? 'en'));

  Future<void> changeLanguage(String languageCode) async {
    await _prefs.setString(_prefsKey, languageCode);
    emit(Locale(languageCode));
  }

  void toggleLanguage() {
    final nextCode = state.languageCode == 'en' ? 'ar' : 'en';
    changeLanguage(nextCode);
  }
}
