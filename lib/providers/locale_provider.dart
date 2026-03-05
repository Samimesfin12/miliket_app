import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale;

  LocaleProvider({String? initialLocale})
      : _locale = Locale(initialLocale ?? 'en');

  Locale get locale => _locale;

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('preferredLanguage') ?? 'en';
    _locale = Locale(lang);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferredLanguage', locale.languageCode);
    notifyListeners();
  }

  void toggleLocale() {
    _locale = _locale.languageCode == 'en' ? const Locale('am') : const Locale('en');
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('preferredLanguage', _locale.languageCode);
    });
    notifyListeners();
  }
}
