import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'Miliket',
      'app_tagline': 'Ethiopian Sign Language Learning',

      // Auth
      'sign_in': 'Sign In',
      'sign_up': 'Sign Up',
      'email': 'Email',
      'password': 'Password',
      'full_name': 'Full Name',
      'forgot_password': 'Forgot Password?',
      'reset_password': 'Reset Password',
      'confirm_password': 'Confirm Password',

      // Home
      'home': 'Home',
      'learn': 'Learn',
      'dictionary': 'Dictionary',
      'practice': 'Practice',
      'profile': 'Profile',

      // Progress
      'your_progress': 'Your Progress',
      'streak': 'Streak',
      'days': 'days',
      'level': 'Level',
      'xp': 'XP',
      'continue_learning': 'Continue Learning',

      // Categories
      'greetings': 'Greetings',
      'family': 'Family',
      'food': 'Food',
      'numbers': 'Numbers',
      'colors': 'Colors',
      'everyday': 'Everyday',

      // Dictionary
      'search_signs': 'Search signs...',
      'favorites': 'Favorites',

      // Practice
      'ai_practice': 'AI Practice',
      'start_practice': 'Start Practice',
      'accuracy': 'Accuracy',

      // Profile
      'settings': 'Settings',
      'language': 'Language',
      'english': 'English',
      'amharic': 'አማርኛ',
      'sign_out': 'Sign Out',
      'achievements': 'Achievements',
    },
    'am': {
      'app_name': 'ሚልኬት',
      'app_tagline': 'የኢትዮጵያ ምልክት ቋንቋ ትምህርት',

      'sign_in': 'ግባ',
      'sign_up': 'ተመዝገብ',
      'email': 'ኢሜይል',
      'password': 'የይለፍ ቃል',
      'full_name': 'ሙሉ ስም',
      'forgot_password': 'የይለፍ ቃል ረሱ?',
      'reset_password': 'የይለፍ ቃል ዳግም ያስጀምሩ',
      'confirm_password': 'የይለፍ ቃል ያረጋግጡ',

      'home': 'ቤት',
      'learn': 'ተማር',
      'dictionary': 'መዝገበ ቃላት',
      'practice': 'ልምምድ',
      'profile': 'መገለጫ',

      'your_progress': 'የእርስዎ እድገት',
      'streak': 'ተከታታይ',
      'days': 'ቀናት',
      'level': 'ደረጃ',
      'xp': 'XP',
      'continue_learning': 'ትምህርት ይቀጥሉ',

      'greetings': 'ተሰብሳቢ',
      'family': 'ቤተሰብ',
      'food': 'ምግብ',
      'numbers': 'ቁጥሮች',
      'colors': 'ቀለሞች',
      'everyday': 'ዕለታዊ',

      'search_signs': 'ምልክቶችን ፈልግ...',
      'favorites': 'ተወዳጅ',

      'ai_practice': 'AI ልምምድ',
      'start_practice': 'ልምምድ ጀምር',
      'accuracy': 'ትክክለኛነት',

      'settings': 'ቅንብሮች',
      'language': 'ቋንቋ',
      'english': 'English',
      'amharic': 'አማርኛ',
      'sign_out': 'ውጣ',
      'achievements': 'ድሎች',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'am'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
